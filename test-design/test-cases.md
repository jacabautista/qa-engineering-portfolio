# Test Cases — QA E-Commerce Platform

## 1. Purpose

This document defines detailed test cases for the QA E-Commerce Platform.

The objective is to transform test scenarios into reproducible test cases that provide traceability between requirements, acceptance criteria, test scenarios, execution and future automation.

---

## 2. Traceability Model

```text
Requirement
    ↓
Acceptance Criteria
    ↓
Test Scenario
    ↓
Test Case
    ↓
Automation
    ↓
Execution Evidence
    ↓
Defect / Release Decision
```

---

## 3. Test Case Standard

Each test case should contain:

* Test Case ID
* Title
* Requirement
* Acceptance Criteria
* Test Scenario
* Priority
* Test Type
* Automation Candidate
* Preconditions
* Test Data
* Test Steps
* Expected Results
* Postconditions
* Execution Status
* Automation Status

---

# 4. Authentication Test Cases

## TC-001 — Successful Login with Valid Credentials

**Requirement:** FR-001
**Acceptance Criteria:** AC-001
**Test Scenario:** TS-001
**Priority:** Critical
**Test Type:** Functional / Positive
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Application is available.
* User authentication service is available.
* A registered and active test user exists.
* User is not currently authenticated.

### Test Data

| Field    | Value          |
| -------- | -------------- |
| Username | valid_user     |
| Password | valid_password |

### Test Steps

| Step | Action                                   | Expected Result                                            |
| ---- | ---------------------------------------- | ---------------------------------------------------------- |
| 1    | Navigate to the login page               | Login page is displayed successfully                       |
| 2    | Enter a valid username                   | Username is accepted                                       |
| 3    | Enter the valid password                 | Password is accepted and protected from plain-text display |
| 4    | Click the Login button                   | Authentication request is submitted                        |
| 5    | Wait for authentication to complete      | User is successfully authenticated                         |
| 6    | Verify navigation to the authorized area | Authorized page is displayed                               |

### Expected Result

The registered user is successfully authenticated and receives access to the authorized area of the application.

### Postconditions

* A valid authenticated session exists.

---

## TC-002 — Login with Invalid Password

**Requirement:** FR-001
**Acceptance Criteria:** AC-002
**Test Scenario:** TS-002
**Priority:** High
**Test Type:** Functional / Negative
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Application is available.
* A registered test user exists.
* User is not authenticated.

### Test Data

| Field    | Value            |
| -------- | ---------------- |
| Username | valid_user       |
| Password | invalid_password |

### Test Steps

| Step | Action                       | Expected Result                     |
| ---- | ---------------------------- | ----------------------------------- |
| 1    | Navigate to the login page   | Login page is displayed             |
| 2    | Enter a valid username       | Username is accepted                |
| 3    | Enter an incorrect password  | Password value is accepted as input |
| 4    | Click the Login button       | Authentication request is submitted |
| 5    | Verify authentication result | Authentication is rejected          |
| 6    | Verify application access    | User remains unauthenticated        |

### Expected Result

Authentication is rejected and the user does not receive access to protected application functionality.

### Postconditions

* No authenticated session is created.

---

## TC-003 — Login with Nonexistent User

**Requirement:** FR-001
**Acceptance Criteria:** AC-003
**Test Scenario:** TS-003
**Priority:** High
**Test Type:** Functional / Negative
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Application is available.
* User is not authenticated.
* The test username does not correspond to a registered account.

### Test Data

| Field    | Value            |
| -------- | ---------------- |
| Username | nonexistent_user |
| Password | test_password    |

### Test Steps

| Step | Action                       | Expected Result                              |
| ---- | ---------------------------- | -------------------------------------------- |
| 1    | Navigate to the login page   | Login page is displayed                      |
| 2    | Enter a nonexistent username | Username is accepted as input                |
| 3    | Enter a password             | Password is accepted as input                |
| 4    | Click the Login button       | Authentication request is submitted          |
| 5    | Verify authentication result | Authentication is rejected                   |
| 6    | Verify application access    | Protected functionality remains inaccessible |

### Expected Result

The system rejects authentication for an account that does not exist.

### Postconditions

* No authenticated session exists.

---

## TC-004 — Login with Empty Username

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Test Scenario:** TS-004
**Priority:** High
**Test Type:** Validation / Negative
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Application is available.
* User is not authenticated.

### Test Data

| Field    | Value          |
| -------- | -------------- |
| Username | Empty          |
| Password | valid_password |

### Test Steps

| Step | Action                           | Expected Result              |
| ---- | -------------------------------- | ---------------------------- |
| 1    | Navigate to the login page       | Login page is displayed      |
| 2    | Leave the username field empty   | Username remains empty       |
| 3    | Enter a password                 | Password is accepted         |
| 4    | Attempt to submit the login form | Validation is triggered      |
| 5    | Verify authentication state      | User remains unauthenticated |

### Expected Result

The system prevents authentication when the username is missing and provides appropriate validation feedback.

### Postconditions

* No authenticated session exists.

---

## TC-005 — Login with Empty Password

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Test Scenario:** TS-004
**Priority:** High
**Test Type:** Validation / Negative
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Application is available.
* User is not authenticated.

### Test Data

| Field    | Value      |
| -------- | ---------- |
| Username | valid_user |
| Password | Empty      |

### Test Steps

| Step | Action                           | Expected Result              |
| ---- | -------------------------------- | ---------------------------- |
| 1    | Navigate to the login page       | Login page is displayed      |
| 2    | Enter a valid username           | Username is accepted         |
| 3    | Leave the password field empty   | Password remains empty       |
| 4    | Attempt to submit the login form | Validation is triggered      |
| 5    | Verify authentication state      | User remains unauthenticated |

### Expected Result

The system prevents authentication when the password is missing and provides appropriate validation feedback.

### Postconditions

* No authenticated session exists.

---

## TC-006 — Login with All Required Credentials Empty

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Test Scenario:** TS-004
**Priority:** High
**Test Type:** Validation / Negative
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Application is available.
* User is not authenticated.

### Test Data

| Field    | Value |
| -------- | ----- |
| Username | Empty |
| Password | Empty |

### Test Steps

| Step | Action                           | Expected Result                        |
| ---- | -------------------------------- | -------------------------------------- |
| 1    | Navigate to the login page       | Login page is displayed                |
| 2    | Leave the username empty         | Username remains empty                 |
| 3    | Leave the password empty         | Password remains empty                 |
| 4    | Attempt to submit the login form | Required-field validation is triggered |
| 5    | Verify authentication state      | Authentication does not occur          |

### Expected Result

The system prevents login when mandatory credentials are missing.

### Postconditions

* No authenticated session exists.

---

# 5. Authentication Coverage Summary

| Test Case | Scenario | Acceptance Criteria | Type       | Priority | Automation |
| --------- | -------- | ------------------- | ---------- | -------- | ---------- |
| TC-001    | TS-001   | AC-001              | Positive   | Critical | Yes        |
| TC-002    | TS-002   | AC-002              | Negative   | High     | Yes        |
| TC-003    | TS-003   | AC-003              | Negative   | High     | Yes        |
| TC-004    | TS-004   | AC-004              | Validation | High     | Yes        |
| TC-005    | TS-004   | AC-004              | Validation | High     | Yes        |
| TC-006    | TS-004   | AC-004              | Validation | High     | Yes        |

---

# 6. Initial Coverage Analysis

Authentication currently contains:

* 1 positive test case
* 2 negative credential test cases
* 3 required-field validation test cases
* 6 total test cases
* 6 automation candidates

Additional security and session test cases will be incorporated when security and risk-based scenarios are expanded.

# 7. Product Catalog Test Cases

## TC-007 — Display Available Products

**Requirement:** FR-002
**Acceptance Criteria:** AC-005
**Test Scenario:** TS-005
**Priority:** High
**Test Type:** Functional / Positive
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Application is available.
* Product catalog service is available.
* At least one available product exists.

### Test Data

| Field                | Value     |
| -------------------- | --------- |
| Product Availability | Available |
| Product Count        | >= 1      |

### Test Steps

| Step | Action                           | Expected Result                             |
| ---- | -------------------------------- | ------------------------------------------- |
| 1    | Navigate to the product catalog  | Product catalog page is displayed           |
| 2    | Wait for products to load        | Available products are retrieved            |
| 3    | Verify product list              | At least one available product is displayed |
| 4    | Verify basic product information | Expected product information is visible     |

### Expected Result

Available products are correctly displayed in the catalog with the expected basic information.

### Postconditions

* Product catalog remains accessible.

---

## TC-008 — Select Product from Catalog

**Requirement:** FR-002
**Acceptance Criteria:** AC-006
**Test Scenario:** TS-006
**Priority:** High
**Test Type:** Functional / Positive
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Product catalog contains at least one available product.

### Test Data

| Field   | Value             |
| ------- | ----------------- |
| Product | available_product |

### Test Steps

| Step | Action                          | Expected Result                      |
| ---- | ------------------------------- | ------------------------------------ |
| 1    | Navigate to the product catalog | Catalog is displayed                 |
| 2    | Identify an available product   | Product can be selected              |
| 3    | Select the product              | Product details request is initiated |
| 4    | Verify navigation               | Product details page is displayed    |

### Expected Result

The user can select an available product and access its product details.

### Postconditions

* Selected product details are displayed.

---

# 8. Product Details Test Cases

## TC-009 — Display Product Information

**Requirement:** FR-003
**Acceptance Criteria:** AC-007
**Test Scenario:** TS-007
**Priority:** High
**Test Type:** Functional / Positive
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* A valid product exists.
* User has navigated to its product details page.

### Test Data

| Field   | Value             |
| ------- | ----------------- |
| Product | available_product |

### Test Steps

| Step | Action                                    | Expected Result                       |
| ---- | ----------------------------------------- | ------------------------------------- |
| 1    | Open the product details page             | Product page is displayed             |
| 2    | Verify product name                       | Correct product name is displayed     |
| 3    | Verify product price                      | Correct price is displayed            |
| 4    | Verify product availability               | Availability information is displayed |
| 5    | Verify other relevant product information | Expected product details are present  |

### Expected Result

The product details page displays correct and consistent product information.

### Postconditions

* Product details remain available for further actions.

---

## TC-010 — Add Available Product to Cart

**Requirement:** FR-003
**Acceptance Criteria:** AC-008
**Test Scenario:** TS-008
**Priority:** Critical
**Test Type:** Functional / Positive
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Product exists.
* Product is available.
* Product details page is displayed.

### Test Data

| Field    | Value             |
| -------- | ----------------- |
| Product  | available_product |
| Quantity | 1                 |

### Test Steps

| Step | Action                           | Expected Result                 |
| ---- | -------------------------------- | ------------------------------- |
| 1    | Open the product details page    | Product is displayed            |
| 2    | Confirm the product is available | Product can be purchased        |
| 3    | Click Add to Cart                | Add-to-cart action is processed |
| 4    | Open the shopping cart           | Shopping cart is displayed      |
| 5    | Verify the selected product      | Product is present in the cart  |
| 6    | Verify initial quantity          | Quantity is 1                   |

### Expected Result

The selected available product is successfully added to the shopping cart.

### Postconditions

* Product exists in the shopping cart.

---

# 9. Catalog and Product Coverage Summary

| Test Case | Requirement | Scenario | Acceptance Criteria | Priority | Automation |
| --------- | ----------- | -------- | ------------------- | -------- | ---------- |
| TC-007    | FR-002      | TS-005   | AC-005              | High     | Yes        |
| TC-008    | FR-002      | TS-006   | AC-006              | High     | Yes        |
| TC-009    | FR-003      | TS-007   | AC-007              | High     | Yes        |
| TC-010    | FR-003      | TS-008   | AC-008              | Critical | Yes        |

---

# 10. Requirement Gaps Identified

The following information is not currently defined in sufficient detail and should be clarified before finalizing complete test coverage:

* Expected behavior when no products are available.
* Required product fields in the catalog.
* Required product fields in the product details page.
* Behavior when a product becomes unavailable after the catalog is loaded.
* Maximum or minimum allowed product quantity.
* Expected handling of inconsistent price or inventory information between catalog and product details.

# 11. Shopping Cart Test Cases

## TC-011 — Add Product to Shopping Cart

**Requirement:** FR-004
**Acceptance Criteria:** AC-009
**Test Scenario:** TS-009
**Priority:** Critical
**Test Type:** Functional / Positive
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Application is available.
* A valid and available product exists.
* Shopping cart is accessible.

### Test Data

| Field      | Value             |
| ---------- | ----------------- |
| Product    | available_product |
| Unit Price | 100.00            |
| Quantity   | 1                 |

### Test Steps

| Step | Action                      | Expected Result                  |
| ---- | --------------------------- | -------------------------------- |
| 1    | Select an available product | Product is displayed             |
| 2    | Add the product to the cart | Add-to-cart operation succeeds   |
| 3    | Open the shopping cart      | Cart is displayed                |
| 4    | Verify the selected product | Correct product is present       |
| 5    | Verify quantity             | Quantity is 1                    |
| 6    | Verify unit price           | Expected unit price is displayed |

### Expected Result

The selected product is successfully added to the shopping cart with the correct initial quantity and price.

### Postconditions

* Product remains in the shopping cart.

---

## TC-012 — Update Product Quantity to a Valid Value

**Requirement:** FR-004
**Acceptance Criteria:** AC-010
**Test Scenario:** TS-010
**Priority:** High
**Test Type:** Functional / Positive
**Test Design Technique:** Equivalence Partitioning
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Product exists in the shopping cart.
* Initial product quantity is 1.

### Test Data

| Initial Quantity | New Quantity |
| ---------------: | -----------: |
|                1 |            2 |

### Test Steps

| Step | Action                      | Expected Result          |
| ---- | --------------------------- | ------------------------ |
| 1    | Open the shopping cart      | Cart is displayed        |
| 2    | Locate the product          | Product is present       |
| 3    | Change quantity from 1 to 2 | New quantity is accepted |
| 4    | Apply the quantity update   | Cart is updated          |
| 5    | Verify quantity             | Quantity displayed is 2  |

### Expected Result

The shopping cart accepts a valid quantity and correctly updates the cart item.

---

## TC-013 — Update Product Quantity to Zero

**Requirement:** FR-004
**Acceptance Criteria:** AC-010
**Test Scenario:** TS-024
**Priority:** High
**Test Type:** Functional / Negative / Boundary
**Test Design Technique:** Boundary Value Analysis
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Product exists in the shopping cart.

### Test Data

| Field    | Value |
| -------- | ----: |
| Quantity |     0 |

### Test Steps

| Step | Action                       | Expected Result                    |
| ---- | ---------------------------- | ---------------------------------- |
| 1    | Open the shopping cart       | Cart is displayed                  |
| 2    | Attempt to set quantity to 0 | Quantity validation is triggered   |
| 3    | Apply the change             | Invalid cart state is not accepted |
| 4    | Verify cart state            | Cart remains in a valid state      |

### Expected Result

A quantity that violates the minimum allowed quantity must not produce an invalid cart state.

> Final expected behavior requires confirmation of the business rule for quantity zero.

---

## TC-014 — Update Product Quantity to a Negative Value

**Requirement:** FR-004
**Test Scenario:** TS-024
**Priority:** High
**Test Type:** Functional / Negative
**Test Design Technique:** Equivalence Partitioning
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Test Data

| Field    | Value |
| -------- | ----: |
| Quantity |    -1 |

### Expected Result

The system must not accept a negative product quantity.

---

## TC-015 — Minimum Valid Product Quantity

**Requirement:** FR-004
**Acceptance Criteria:** AC-010
**Test Scenario:** TS-010
**Priority:** High
**Test Type:** Boundary / Positive
**Test Design Technique:** Boundary Value Analysis
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Test Data

| Field    | Value |
| -------- | ----: |
| Quantity |     1 |

### Expected Result

The minimum valid product quantity is accepted and the cart remains valid.

---

## TC-016 — Remove Product from Shopping Cart

**Requirement:** FR-004
**Acceptance Criteria:** AC-011
**Test Scenario:** TS-011
**Priority:** High
**Test Type:** Functional / Positive
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* At least one product exists in the shopping cart.

### Test Steps

| Step | Action                   | Expected Result                      |
| ---- | ------------------------ | ------------------------------------ |
| 1    | Open the shopping cart   | Cart is displayed                    |
| 2    | Locate the product       | Product is present                   |
| 3    | Select the remove action | Remove operation is processed        |
| 4    | Verify the shopping cart | Removed product is no longer present |

### Expected Result

The selected product is successfully removed from the shopping cart.

---

## TC-017 — Calculate Total for One Product

**Requirement:** FR-004
**Acceptance Criteria:** AC-012
**Test Scenario:** TS-012
**Priority:** Critical
**Test Type:** Functional / Business Rule
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Test Data

| Unit Price | Quantity | Expected Total |
| ---------: | -------: | -------------: |
|     100.00 |        2 |         200.00 |

### Expected Result

The cart total equals:

```text
Unit Price × Quantity
100.00 × 2 = 200.00
```

---

## TC-018 — Recalculate Total After Quantity Update

**Requirement:** FR-004
**Acceptance Criteria:** AC-010 / AC-012
**Test Scenario:** TS-025
**Priority:** Critical
**Test Type:** Functional / Business Rule
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Test Data

| Unit Price | Initial Qty | New Qty | Initial Total | Expected New Total |
| ---------: | ----------: | ------: | ------------: | -----------------: |
|     100.00 |           1 |       3 |        100.00 |             300.00 |

### Expected Result

After changing the quantity from 1 to 3, the cart total is recalculated from 100.00 to 300.00.

---

## TC-019 — Recalculate Total After Product Removal

**Requirement:** FR-004
**Acceptance Criteria:** AC-011 / AC-012
**Test Scenario:** TS-025
**Priority:** Critical
**Test Type:** Functional / Business Rule
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Test Data

| Product   |  Price |
| --------- | -----: |
| Product A | 100.00 |
| Product B |  50.00 |

**Initial Total:** 150.00

### Expected Result

After removing Product B, the cart total is recalculated to:

```text
100.00
```

---

# 12. Shopping Cart Boundary Analysis

| Value | Partition          | Expected Classification              |
| ----: | ------------------ | ------------------------------------ |
|    -1 | Invalid            | Reject                               |
|     0 | Boundary / Invalid | Requires confirmed business behavior |
|     1 | Boundary / Valid   | Accept                               |
|     2 | Valid              | Accept                               |

---

# 13. Shopping Cart Requirement Gaps

The following business rules require clarification:

* Maximum quantity allowed per product.
* Exact behavior when quantity is changed to zero.
* Whether zero removes the product automatically or produces validation.
* Behavior when requested quantity exceeds available inventory.
* Decimal quantities versus integer-only quantities.
* Price rounding rules.
* Currency precision.
* Tax calculation rules.
* Discount calculation rules.
* Shipping cost impact on the final total.
* Behavior when product price changes while the product is already in the cart.

These gaps should be clarified before complete cart coverage and automation are finalized.

---

# 14. Shopping Cart Coverage Summary

| Test Case | Main Validation        | Technique                | Priority |
| --------- | ---------------------- | ------------------------ | -------- |
| TC-011    | Add product            | Positive                 | Critical |
| TC-012    | Valid quantity         | Equivalence Partitioning | High     |
| TC-013    | Quantity = 0           | Boundary Value Analysis  | High     |
| TC-014    | Negative quantity      | Equivalence Partitioning | High     |
| TC-015    | Minimum quantity       | Boundary Value Analysis  | High     |
| TC-016    | Remove product         | Positive                 | High     |
| TC-017    | Total calculation      | Business Rule            | Critical |
| TC-018    | Quantity recalculation | Business Rule            | Critical |
| TC-019    | Removal recalculation  | Business Rule            | Critical |
