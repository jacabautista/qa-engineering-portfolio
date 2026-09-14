#!/usr/bin/env bash

BASE_URL="https://dummyjson.com"

PASSED=0
FAILED=0

# ========================================
# REPORTING FUNCTIONS
# ========================================

pass_test() {
  local message="$1"

  echo "[PASS] $message"
  PASSED=$((PASSED + 1))
}

fail_test() {
  local message="$1"

  echo "[FAIL] $message"
  FAILED=$((FAILED + 1))
}

# ========================================
# ASSERTION FUNCTIONS
# ========================================

assert_equals() {
  local expected="$1"
  local actual="$2"
  local message="$3"

  if [ "$expected" = "$actual" ]; then
    pass_test "$message"
  else
    fail_test "$message | Expected: $expected | Actual: $actual"
  fi
}

assert_not_null() {
  local actual="$1"
  local message="$2"

  if [ -n "$actual" ] && [ "$actual" != "null" ]; then
    pass_test "$message"
  else
    fail_test "$message | Actual value is null or empty"
  fi
}

# ========================================
# TEST SUITE
# ========================================

echo "========================================"
echo "       PRODUCT API TEST SUITE"
echo "========================================"
echo

# ========================================
# TEST 1 - GET existing product
# ========================================

echo "TEST 1 - GET /products/1"

STATUS_CODE=$(curl -s \
  -o response.json \
  -w "%{http_code}" \
  "$BASE_URL/products/1")

ID=$(jq -r '.id' response.json)
TITLE=$(jq -r '.title' response.json)
PRICE=$(jq -r '.price' response.json)
STOCK=$(jq -r '.stock' response.json)
AVAILABILITY_STATUS=$(jq -r '.availabilityStatus' response.json)

assert_equals "200" "$STATUS_CODE" "GET /products/1 - Status Code"
assert_equals "1" "$ID" "GET /products/1 - Product ID"

assert_not_null "$TITLE" "GET /products/1 - Title exists"
assert_not_null "$PRICE" "GET /products/1 - Price exists"
assert_not_null "$STOCK" "GET /products/1 - Stock exists"

if [ "$STOCK" -gt 0 ]; then
  assert_equals \
    "In Stock" \
    "$AVAILABILITY_STATUS" \
    "GET /products/1 - Availability matches stock"
fi

rm -f response.json

echo

# ========================================
# TEST 2 - GET nonexistent product
# ========================================

echo "TEST 2 - GET /products/999999"

STATUS_CODE=$(curl -s \
  -o error-response.json \
  -w "%{http_code}" \
  "$BASE_URL/products/999999")

ERROR_MESSAGE=$(jq -r '.message' error-response.json)

assert_equals \
  "404" \
  "$STATUS_CODE" \
  "GET /products/999999 - Status Code"

assert_equals \
  "Product with id '999999' not found" \
  "$ERROR_MESSAGE" \
  "GET /products/999999 - Error message"

rm -f error-response.json

echo

# ========================================
# TEST 3 - POST product
# ========================================

echo "TEST 3 - POST /products/add"

STATUS_CODE=$(curl -s \
  -o post-response.json \
  -w "%{http_code}" \
  -X POST \
  "$BASE_URL/products/add" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "QA Automation Laptop",
    "price": 1500
  }')

CREATED_ID=$(jq -r '.id' post-response.json)
CREATED_TITLE=$(jq -r '.title' post-response.json)
CREATED_PRICE=$(jq -r '.price' post-response.json)

assert_equals \
  "201" \
  "$STATUS_CODE" \
  "POST /products/add - Status Code"

assert_not_null \
  "$CREATED_ID" \
  "POST /products/add - Generated ID"

assert_equals \
  "QA Automation Laptop" \
  "$CREATED_TITLE" \
  "POST /products/add - Title"

assert_equals \
  "1500" \
  "$CREATED_PRICE" \
  "POST /products/add - Price"

rm -f post-response.json

echo

# ========================================
# TEST 4 - PATCH product
# ========================================

echo "TEST 4 - PATCH /products/1"

STATUS_CODE=$(curl -s \
  -o patch-response.json \
  -w "%{http_code}" \
  -X PATCH \
  "$BASE_URL/products/1" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "QA Updated Product"
  }')

UPDATED_ID=$(jq -r '.id' patch-response.json)
UPDATED_TITLE=$(jq -r '.title' patch-response.json)
UPDATED_PRICE=$(jq -r '.price' patch-response.json)

assert_equals \
  "200" \
  "$STATUS_CODE" \
  "PATCH /products/1 - Status Code"

assert_equals \
  "1" \
  "$UPDATED_ID" \
  "PATCH /products/1 - Product ID"

assert_equals \
  "QA Updated Product" \
  "$UPDATED_TITLE" \
  "PATCH /products/1 - Updated title"

assert_not_null \
  "$UPDATED_PRICE" \
  "PATCH /products/1 - Price preserved"

rm -f patch-response.json

echo

# ========================================
# TEST 5 - DELETE product
# ========================================

echo "TEST 5 - DELETE /products/1"

STATUS_CODE=$(curl -s \
  -o delete-response.json \
  -w "%{http_code}" \
  -X DELETE \
  "$BASE_URL/products/1")

DELETED_ID=$(jq -r '.id' delete-response.json)
IS_DELETED=$(jq -r '.isDeleted' delete-response.json)
DELETED_ON=$(jq -r '.deletedOn' delete-response.json)

assert_equals \
  "200" \
  "$STATUS_CODE" \
  "DELETE /products/1 - Status Code"

assert_equals \
  "1" \
  "$DELETED_ID" \
  "DELETE /products/1 - Product ID"

assert_equals \
  "true" \
  "$IS_DELETED" \
  "DELETE /products/1 - isDeleted"

assert_not_null \
  "$DELETED_ON" \
  "DELETE /products/1 - deletedOn exists"

rm -f delete-response.json

echo

# ========================================
# TEST SUMMARY
# ========================================

echo "========================================"
echo "TEST SUMMARY"
echo "========================================"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo "Total:  $((PASSED + FAILED))"
echo "========================================"

if [ "$FAILED" -gt 0 ]; then
  exit 1
else
  exit 0
fi