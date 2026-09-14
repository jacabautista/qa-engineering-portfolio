#!/usr/bin/env bash

# ========================================

# CONFIGURATION

# ========================================

CONFIG_FILE="api/config/test.env"

if [ ! -f "$CONFIG_FILE" ]; then
echo "[ERROR] Configuration file not found: $CONFIG_FILE"
exit 1
fi

source "$CONFIG_FILE"

required_variables=(
BASE_URL
PRODUCT_ID
INVALID_PRODUCT_ID
PRODUCT_TITLE
PRODUCT_PRICE
UPDATED_PRODUCT_TITLE
)

for variable in "${required_variables[@]}"; do
if [ -z "${!variable}" ]; then
echo "[ERROR] Required variable is missing: $variable"
exit 1
fi
done

# ========================================

# DEPENDENCY VALIDATION

# ========================================

if ! command -v curl >/dev/null 2>&1; then
echo "[ERROR] curl is not installed or not available in PATH"
exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
echo "[ERROR] jq is not installed or not available in PATH"
exit 1
fi

# ========================================

# COUNTERS

# ========================================

PASSED=0
FAILED=0

# ========================================

# TEMPORARY FILES

# ========================================

GET_RESPONSE="api/scripts/get-response.json"
ERROR_RESPONSE="api/scripts/error-response.json"
POST_RESPONSE="api/scripts/post-response.json"
PATCH_RESPONSE="api/scripts/patch-response.json"
DELETE_RESPONSE="api/scripts/delete-response.json"

cleanup() {
rm -f "$GET_RESPONSE" "$ERROR_RESPONSE" "$POST_RESPONSE" "$PATCH_RESPONSE" "$DELETE_RESPONSE"
}

trap cleanup EXIT

# ========================================

# REPORTING

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

# ASSERTIONS

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
echo "Base URL: $BASE_URL"
echo

# ========================================

# TEST 1 - GET EXISTING PRODUCT

# ========================================

echo "TEST 1 - GET /products/$PRODUCT_ID"

STATUS_CODE=$(curl -s -o "$GET_RESPONSE" -w "%{http_code}" "$BASE_URL/products/$PRODUCT_ID")

if [ ! -f "$GET_RESPONSE" ]; then
echo "[ERROR] GET response file was not created"
exit 1
fi

ID=$(jq -r '.id' "$GET_RESPONSE")
TITLE=$(jq -r '.title' "$GET_RESPONSE")
PRICE=$(jq -r '.price' "$GET_RESPONSE")
STOCK=$(jq -r '.stock' "$GET_RESPONSE")
AVAILABILITY_STATUS=$(jq -r '.availabilityStatus' "$GET_RESPONSE")

assert_equals "200" "$STATUS_CODE" "GET /products/$PRODUCT_ID - Status Code"
assert_equals "$PRODUCT_ID" "$ID" "GET /products/$PRODUCT_ID - Product ID"
assert_not_null "$TITLE" "GET /products/$PRODUCT_ID - Title exists"
assert_not_null "$PRICE" "GET /products/$PRODUCT_ID - Price exists"
assert_not_null "$STOCK" "GET /products/$PRODUCT_ID - Stock exists"

if [[ "$STOCK" =~ ^[0-9]+$ ]] && [ "$STOCK" -gt 0 ]; then
assert_equals "In Stock" "$AVAILABILITY_STATUS" "GET /products/$PRODUCT_ID - Availability matches stock"
fi

echo

# ========================================

# TEST 2 - GET NONEXISTENT PRODUCT

# ========================================

echo "TEST 2 - GET /products/$INVALID_PRODUCT_ID"

STATUS_CODE=$(curl -s -o "$ERROR_RESPONSE" -w "%{http_code}" "$BASE_URL/products/$INVALID_PRODUCT_ID")

if [ ! -f "$ERROR_RESPONSE" ]; then
echo "[ERROR] Negative GET response file was not created"
exit 1
fi

ERROR_MESSAGE=$(jq -r '.message' "$ERROR_RESPONSE")

assert_equals "404" "$STATUS_CODE" "GET /products/$INVALID_PRODUCT_ID - Status Code"
assert_equals "Product with id '$INVALID_PRODUCT_ID' not found" "$ERROR_MESSAGE" "GET /products/$INVALID_PRODUCT_ID - Error message"

echo

# ========================================

# TEST 3 - POST PRODUCT

# ========================================

echo "TEST 3 - POST /products/add"

POST_BODY=$(jq -n --arg title "$PRODUCT_TITLE" --argjson price "$PRODUCT_PRICE" '{title: $title, price: $price}')

STATUS_CODE=$(curl -s -o "$POST_RESPONSE" -w "%{http_code}" -X POST "$BASE_URL/products/add" -H "Content-Type: application/json" -d "$POST_BODY")

if [ ! -f "$POST_RESPONSE" ]; then
echo "[ERROR] POST response file was not created"
exit 1
fi

CREATED_ID=$(jq -r '.id' "$POST_RESPONSE")
CREATED_TITLE=$(jq -r '.title' "$POST_RESPONSE")
CREATED_PRICE=$(jq -r '.price' "$POST_RESPONSE")

assert_equals "201" "$STATUS_CODE" "POST /products/add - Status Code"
assert_not_null "$CREATED_ID" "POST /products/add - Generated ID"
assert_equals "$PRODUCT_TITLE" "$CREATED_TITLE" "POST /products/add - Title"
assert_equals "$PRODUCT_PRICE" "$CREATED_PRICE" "POST /products/add - Price"

echo

# ========================================

# TEST 4 - PATCH PRODUCT

# ========================================

echo "TEST 4 - PATCH /products/$PRODUCT_ID"

PATCH_BODY=$(jq -n --arg title "$UPDATED_PRODUCT_TITLE" '{title: $title}')

STATUS_CODE=$(curl -s -o "$PATCH_RESPONSE" -w "%{http_code}" -X PATCH "$BASE_URL/products/$PRODUCT_ID" -H "Content-Type: application/json" -d "$PATCH_BODY")

if [ ! -f "$PATCH_RESPONSE" ]; then
echo "[ERROR] PATCH response file was not created"
exit 1
fi

UPDATED_ID=$(jq -r '.id' "$PATCH_RESPONSE")
UPDATED_TITLE=$(jq -r '.title' "$PATCH_RESPONSE")
UPDATED_PRICE=$(jq -r '.price' "$PATCH_RESPONSE")

assert_equals "200" "$STATUS_CODE" "PATCH /products/$PRODUCT_ID - Status Code"
assert_equals "$PRODUCT_ID" "$UPDATED_ID" "PATCH /products/$PRODUCT_ID - Product ID"
assert_equals "$UPDATED_PRODUCT_TITLE" "$UPDATED_TITLE" "PATCH /products/$PRODUCT_ID - Updated title"
assert_not_null "$UPDATED_PRICE" "PATCH /products/$PRODUCT_ID - Price preserved"

echo

# ========================================

# TEST 5 - DELETE PRODUCT

# ========================================

echo "TEST 5 - DELETE /products/$PRODUCT_ID"

STATUS_CODE=$(curl -s -o "$DELETE_RESPONSE" -w "%{http_code}" -X DELETE "$BASE_URL/products/$PRODUCT_ID")

if [ ! -f "$DELETE_RESPONSE" ]; then
echo "[ERROR] DELETE response file was not created"
exit 1
fi

DELETED_ID=$(jq -r '.id' "$DELETE_RESPONSE")
IS_DELETED=$(jq -r '.isDeleted' "$DELETE_RESPONSE")
DELETED_ON=$(jq -r '.deletedOn' "$DELETE_RESPONSE")

assert_equals "200" "$STATUS_CODE" "DELETE /products/$PRODUCT_ID - Status Code"
assert_equals "$PRODUCT_ID" "$DELETED_ID" "DELETE /products/$PRODUCT_ID - Product ID"
assert_equals "true" "$IS_DELETED" "DELETE /products/$PRODUCT_ID - isDeleted"
assert_not_null "$DELETED_ON" "DELETE /products/$PRODUCT_ID - deletedOn exists"

echo

# ========================================

# SUMMARY

# ========================================

TOTAL=$((PASSED + FAILED))

echo "========================================"
echo "TEST SUMMARY"
echo "========================================"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo "Total Assertions: $TOTAL"
echo "========================================"

if [ "$FAILED" -gt 0 ]; then
exit 1
fi

exit 0
