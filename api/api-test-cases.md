# API Test Cases — QA E-Commerce Platform

## 1. Purpose

This document defines API-level test cases for the QA E-Commerce Platform.

The objective is to validate HTTP behavior, API contracts, business rules, authentication, integration behavior and data consistency independently from the user interface.

---

# 2. API Testing Validation Model

Each API test should consider applicable validations across the following dimensions:

```text
Request
   ↓
HTTP Status
   ↓
Headers
   ↓
Response Body
   ↓
Schema
   ↓
Business Rules
   ↓
Data Persistence
```

---

# 3. Authentication API

## API-TC-001 — Successful Login

**Requirement:** FR-001
**Acceptance Criteria:** AC-001
**Related Functional Test:** TC-001
**Priority:** Critical
**Method:** POST
**Endpoint:** `/login`
**Test Type:** API / Functional / Positive
**Automation Candidate:** Yes

### Request

```json
{
  "username": "valid_user",
  "password": "valid_password"
}
```

### Expected Validations

* Response indicates successful authentication.
* Appropriate success HTTP status is returned according to API contract.
* Response body contains the expected authentication information.
* No unexpected sensitive credential information is returned.
* Response schema matches the defined API contract.
* Authenticated user identity corresponds to the supplied account.

---

## API-TC-002 — Login with Invalid Password

**Requirement:** FR-001
**Acceptance Criteria:** AC-002
**Related Functional Test:** TC-002
**Priority:** High
**Method:** POST
**Endpoint:** `/login`
**Test Type:** API / Negative
**Automation Candidate:** Yes

### Request

```json
{
  "username": "valid_user",
  "password": "invalid_password"
}
```

### Expected Validations

* Authentication is rejected.
* Successful authentication token is not returned.
* Response follows the defined authentication error contract.
* HTTP status matches the API specification.
* Sensitive authentication information is not exposed.

---

## API-TC-003 — Login with Missing Username

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Related Functional Test:** TC-004
**Priority:** High
**Method:** POST
**Endpoint:** `/login`
**Test Type:** API / Validation / Negative
**Automation Candidate:** Yes

### Request

```json
{
  "password": "valid_password"
}
```

### Expected Validations

* Request is rejected.
* Validation feedback identifies the missing required information according to the API contract.
* Authentication token is not generated.

---

## API-TC-004 — Login with Missing Password

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Related Functional Test:** TC-005
**Priority:** High
**Method:** POST
**Endpoint:** `/login`
**Test Type:** API / Validation / Negative
**Automation Candidate:** Yes

### Request

```json
{
  "username": "valid_user"
}
```

### Expected Validations

* Request is rejected.
* Missing password is handled according to the API contract.
* Authentication token is not generated.

---

# 4. Product API

## API-TC-005 — Retrieve Product Catalog

**Requirement:** FR-002
**Acceptance Criteria:** AC-005
**Related Functional Test:** TC-007
**Priority:** High
**Method:** GET
**Endpoint:** `/products`
**Test Type:** API / Functional / Positive
**Automation Candidate:** Yes

### Expected Validations

* Appropriate success status is returned.
* Response body contains the expected product collection.
* Product representation follows the defined schema.
* No malformed product records are returned.
* Product availability information is consistent with the API contract.

---

## API-TC-006 — Retrieve Existing Product

**Requirement:** FR-003
**Acceptance Criteria:** AC-007
**Related Functional Test:** TC-009
**Priority:** High
**Method:** GET
**Endpoint:** `/products/{id}`
**Test Type:** API / Functional / Positive
**Automation Candidate:** Yes

### Expected Validations

* Requested product is returned.
* Product identifier matches the requested identifier.
* Product details follow the expected schema.
* Product data is internally consistent.

---

## API-TC-007 — Retrieve Nonexistent Product

**Requirement:** FR-003
**Priority:** Medium
**Method:** GET
**Endpoint:** `/products/{id}`
**Test Type:** API / Negative
**Automation Candidate:** Yes

### Test Data

Use a product identifier that does not correspond to an existing product.

### Expected Validations

* API does not return an unrelated product.
* Response follows the defined not-found contract.
* HTTP status follows the API specification.
* Unexpected internal implementation information is not exposed.

---

# 5. Shopping Cart API

## API-TC-008 — Add Valid Product to Cart

**Requirement:** FR-004
**Acceptance Criteria:** AC-009
**Related Functional Test:** TC-011
**Priority:** Critical
**Method:** POST
**Endpoint:** `/cart`
**Test Type:** API / Functional / Positive
**Automation Candidate:** Yes

### Example Request

```json
{
  "productId": 1001,
  "quantity": 1
}
```

### Expected Validations

* Product is added to the cart.
* Quantity is correctly represented.
* Cart state reflects the new item.
* Calculated totals remain consistent.

---

## API-TC-009 — Add Invalid Product Quantity

**Requirement:** FR-004
**Related Functional Tests:** TC-013 / TC-014
**Priority:** High
**Method:** POST
**Endpoint:** `/cart`
**Test Type:** API / Boundary / Negative
**Automation Candidate:** Yes

### Example Request

```json
{
  "productId": 1001,
  "quantity": -1
}
```

### Expected Validations

* Invalid quantity is not accepted as a valid cart state.
* Cart data remains consistent.
* Response follows the defined validation contract.

> Exact expected HTTP status and error structure require confirmation from the API specification.

---

# 6. API Requirement Gaps

The following information must be confirmed before API assertions can be finalized:

* Base API URL.
* API versioning strategy.
* Exact endpoint paths.
* Authentication mechanism.
* Exact request schemas.
* Exact response schemas.
* Required and optional headers.
* Expected success status codes.
* Expected validation status codes.
* Standard API error model.
* Pagination behavior.
* Rate limits.
* Timeout rules.
* Idempotency implementation.
* Correlation or trace identifiers.
* API version compatibility policy.

---

# 7. API Test Case Completion Criteria

Initial API design is considered complete when:

* Critical endpoints have positive test coverage.
* Negative API scenarios are represented.
* Authentication behavior is covered.
* Request validation is covered.
* Status codes are verified against the API contract.
* Response schemas are verified.
* Business rules are validated.
* API requirement gaps are documented.
* Automation candidates are identified.
