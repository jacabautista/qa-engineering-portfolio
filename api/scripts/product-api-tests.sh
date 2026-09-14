#!/usr/bin/env bash

BASE_URL="https://dummyjson.com"

PASSED=0
FAILED=0

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

ID=$(jq '.id' response.json)
TITLE=$(jq -r '.title' response.json)
PRICE=$(jq '.price' response.json)
STOCK=$(jq '.stock' response.json)
AVAILABILITY_STATUS=$(jq -r '.availabilityStatus' response.json)

if [ "$STATUS_CODE" -eq 200 ] && \
   [ "$ID" -eq 1 ] && \
   [ "$PRICE" != "null" ] && \
   [ "$STOCK" != "null" ] && \
   [ -n "$TITLE" ]; then

  echo "[PASS] GET /products/1"
  echo "       Status: $STATUS_CODE"
  echo "       ID: $ID"
  echo "       Title: $TITLE"
  echo "       Price: $PRICE"
  echo "       Stock: $STOCK"
  echo "       Availability: $AVAILABILITY_STATUS"

  PASSED=$((PASSED + 1))

else

  echo "[FAIL] GET /products/1"
  echo "       Status: $STATUS_CODE"
  echo "       ID: $ID"
  echo "       Price: $PRICE"
  echo "       Stock: $STOCK"
  echo "       Availability: $AVAILABILITY_STATUS"

  FAILED=$((FAILED + 1))

fi

if [ "$STOCK" -gt 0 ] && \
   [ "$AVAILABILITY_STATUS" != "In Stock" ]; then

  echo "[FAIL] Product availability is inconsistent"
  FAILED=$((FAILED + 1))

else

  echo "[PASS] Product availability is consistent"
  PASSED=$((PASSED + 1))

fi

echo

rm -f response.json

# ========================================
# TEST 2 - GET nonexistent product
# ========================================

echo "TEST 2 - GET /products/999999"

STATUS_CODE=$(curl -s \
  -o error-response.json \
  -w "%{http_code}" \
  "$BASE_URL/products/999999")

ERROR_MESSAGE=$(jq -r '.message' error-response.json)

if [ "$STATUS_CODE" -eq 404 ] && \
   [ "$ERROR_MESSAGE" = "Product with id '999999' not found" ]; then

  echo "[PASS] GET /products/999999"
  echo "       Status: $STATUS_CODE"
  echo "       Message: $ERROR_MESSAGE"

  PASSED=$((PASSED + 1))

else

  echo "[FAIL] GET /products/999999"
  echo "       Expected Status: 404"
  echo "       Actual Status: $STATUS_CODE"
  echo "       Message: $ERROR_MESSAGE"

  FAILED=$((FAILED + 1))

fi

echo

rm -f error-response.json

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