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

# 15. Checkout Test Cases

## TC-020 — Checkout with Valid Required Information

**Requirement:** FR-005
**Acceptance Criteria:** AC-014
**Test Scenario:** TS-014
**Priority:** Critical
**Test Type:** Functional / Positive
**Test Design Technique:** Decision Table
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Application is available.
* User has at least one valid product in the shopping cart.
* Product is available.
* Checkout page is accessible.

### Test Data

| Field                | Value                  |
| -------------------- | ---------------------- |
| Customer Information | Valid                  |
| Shipping Information | Valid                  |
| Cart State           | Contains valid product |

### Test Steps

| Step | Action                                         | Expected Result                  |
| ---- | ---------------------------------------------- | -------------------------------- |
| 1    | Open the shopping cart                         | Cart is displayed                |
| 2    | Continue to checkout                           | Checkout page is displayed       |
| 3    | Enter valid customer information               | Information is accepted          |
| 4    | Enter valid shipping information               | Information is accepted          |
| 5    | Continue checkout                              | Checkout validation succeeds     |
| 6    | Verify navigation to the next transaction step | User can continue toward payment |

### Expected Result

The user can continue the checkout process when all required information is valid.

### Postconditions

* Checkout information remains available for the transaction.

---

## TC-021 — Checkout with Missing Customer Information

**Requirement:** FR-005
**Acceptance Criteria:** AC-013 / AC-015
**Test Scenario:** TS-013 / TS-015
**Priority:** High
**Test Type:** Validation / Negative
**Test Design Technique:** Decision Table
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Shopping cart contains at least one valid product.
* Checkout page is accessible.

### Test Data

| Condition            | Value          |
| -------------------- | -------------- |
| Customer Information | Missing        |
| Shipping Information | Valid          |
| Cart State           | Contains items |

### Expected Result

The checkout process does not continue and required customer information is identified.

---

## TC-022 — Checkout with Missing Shipping Information

**Requirement:** FR-005
**Acceptance Criteria:** AC-013 / AC-015
**Test Scenario:** TS-013 / TS-015
**Priority:** High
**Test Type:** Validation / Negative
**Test Design Technique:** Decision Table
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Test Data

| Condition            | Value          |
| -------------------- | -------------- |
| Customer Information | Valid          |
| Shipping Information | Missing        |
| Cart State           | Contains items |

### Expected Result

The checkout process does not continue when required shipping information is missing.

---

## TC-023 — Checkout with Invalid Customer Information

**Requirement:** FR-005
**Acceptance Criteria:** AC-015
**Test Scenario:** TS-015
**Priority:** High
**Test Type:** Functional / Validation / Negative
**Test Design Technique:** Equivalence Partitioning
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Checkout page is accessible.
* Shopping cart contains a valid product.

### Test Data

| Condition            | Value          |
| -------------------- | -------------- |
| Customer Information | Invalid        |
| Shipping Information | Valid          |
| Cart State           | Contains items |

### Expected Result

Invalid customer information prevents the checkout flow from continuing.

---

## TC-024 — Checkout with Invalid Shipping Information

**Requirement:** FR-005
**Acceptance Criteria:** AC-015
**Test Scenario:** TS-015
**Priority:** High
**Test Type:** Functional / Validation / Negative
**Test Design Technique:** Equivalence Partitioning
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Test Data

| Condition            | Value          |
| -------------------- | -------------- |
| Customer Information | Valid          |
| Shipping Information | Invalid        |
| Cart State           | Contains items |

### Expected Result

Invalid shipping information prevents the transaction from continuing.

---

## TC-025 — Checkout with Empty Cart

**Requirement:** FR-004 / FR-005
**Test Scenario:** TS-015
**Priority:** Critical
**Test Type:** Negative / Business Rule
**Test Design Technique:** Decision Table
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* User can access the application.
* Shopping cart contains no products.

### Test Data

| Condition            | Value |
| -------------------- | ----- |
| Customer Information | Valid |
| Shipping Information | Valid |
| Cart State           | Empty |

### Expected Result

The system must not allow a transaction to continue when the shopping cart contains no purchasable products.

> This behavior should be confirmed as an explicit business rule.

---

# 16. Checkout Decision Table

| Rule | Customer Information | Shipping Information | Cart      | Expected Decision |
| ---- | -------------------- | -------------------- | --------- | ----------------- |
| R1   | Valid                | Valid                | Has Items | Continue          |
| R2   | Invalid              | Valid                | Has Items | Reject            |
| R3   | Valid                | Invalid              | Has Items | Reject            |
| R4   | Missing              | Valid                | Has Items | Reject            |
| R5   | Valid                | Missing              | Has Items | Reject            |
| R6   | Valid                | Valid                | Empty     | Reject            |

---

# 17. Checkout Requirement Gaps

The following rules require clarification before checkout coverage can be considered complete:

* Exact mandatory customer fields.
* Exact mandatory shipping fields.
* Accepted formats for customer information.
* Accepted address formats.
* Whether checkout requires authentication.
* Whether guest checkout is supported.
* Behavior when the cart becomes invalid during checkout.
* Behavior when product inventory changes during checkout.
* Behavior when product price changes during checkout.
* Whether taxes are calculated before or during checkout.
* Whether shipping costs are calculated before payment.
* Whether coupons or promotional codes can modify the checkout total.

---

# 18. Checkout Coverage Summary

| Test Case | Main Validation       | Technique                      | Priority |
| --------- | --------------------- | ------------------------------ | -------- |
| TC-020    | Valid checkout        | Decision Table                 | Critical |
| TC-021    | Missing customer data | Decision Table                 | High     |
| TC-022    | Missing shipping data | Decision Table                 | High     |
| TC-023    | Invalid customer data | Equivalence Partitioning       | High     |
| TC-024    | Invalid shipping data | Equivalence Partitioning       | High     |
| TC-025    | Empty cart            | Decision Table / Business Rule | Critical |

# 19. Payment Test Cases

## TC-026 — Successful Payment

**Requirement:** FR-006
**Acceptance Criteria:** AC-016
**Test Scenario:** TS-016
**Priority:** Critical
**Test Type:** Functional / Integration / Positive
**Test Design Technique:** Decision Table
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Shopping cart contains valid products.
* Checkout information is valid.
* Payment service is available.
* Transaction is ready for payment.

### Test Data

| Field            | Value    |
| ---------------- | -------- |
| Payment Response | Approved |
| Cart State       | Valid    |
| Checkout State   | Valid    |

### Test Steps

| Step | Action                              | Expected Result                    |
| ---- | ----------------------------------- | ---------------------------------- |
| 1    | Complete valid checkout information | Checkout validation succeeds       |
| 2    | Continue to payment                 | Payment step is displayed          |
| 3    | Submit valid payment information    | Payment request is sent            |
| 4    | Receive successful payment response | Payment is marked as approved      |
| 5    | Verify transaction flow             | System continues to order creation |

### Expected Result

An approved payment allows the transaction to continue to successful order creation.

### Postconditions

* Payment transaction is recorded as successful.
* Transaction can proceed to order creation.

---

## TC-027 — Failed Payment

**Requirement:** FR-006
**Acceptance Criteria:** AC-017
**Test Scenario:** TS-017
**Priority:** Critical
**Test Type:** Functional / Integration / Negative
**Test Design Technique:** Decision Table
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Cart and checkout data are valid.
* Payment step is accessible.

### Test Data

| Field            | Value    |
| ---------------- | -------- |
| Payment Response | Declined |

### Test Steps

| Step | Action                                | Expected Result                        |
| ---- | ------------------------------------- | -------------------------------------- |
| 1    | Reach the payment step                | Payment interface is available         |
| 2    | Submit payment information            | Payment request is processed           |
| 3    | Simulate or receive declined response | Payment is rejected                    |
| 4    | Verify transaction status             | Transaction does not become successful |
| 5    | Verify order state                    | Successful order is not generated      |

### Expected Result

A declined payment prevents successful order creation and appropriate failure feedback is provided.

### Postconditions

* No successful payment exists.
* No confirmed order should exist.

---

## TC-028 — Payment Failure Must Not Create Order

**Requirement:** FR-006 / FR-007
**Acceptance Criteria:** AC-017
**Test Scenario:** TS-026
**Priority:** Critical
**Test Type:** Integration / Negative / Business Rule
**Test Design Technique:** Decision Table
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Checkout is valid.
* Payment can be submitted.

### Test Data

| Payment | Expected Order State |
| ------- | -------------------- |
| Failed  | Not Created          |

### Expected Result

A failed payment must not result in a confirmed successful order.

### Postconditions

* No successful order exists for the failed payment transaction.

---

# 20. Order Creation Test Cases

## TC-029 — Create Order After Successful Payment

**Requirement:** FR-007
**Acceptance Criteria:** AC-018
**Test Scenario:** TS-018
**Priority:** Critical
**Test Type:** Functional / Integration / Positive
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Valid cart exists.
* Checkout is complete.
* Payment has been successfully approved.

### Test Steps

| Step | Action                             | Expected Result                     |
| ---- | ---------------------------------- | ----------------------------------- |
| 1    | Complete successful payment        | Payment is approved                 |
| 2    | Allow transaction flow to continue | Order creation is initiated         |
| 3    | Verify order result                | New order is created                |
| 4    | Verify order identifier            | Unique order reference is available |
| 5    | Verify order status                | Order has expected initial status   |

### Expected Result

A valid order is created after successful payment.

### Postconditions

* Order exists in the system.

---

## TC-030 — Validate Order Information

**Requirement:** FR-007
**Acceptance Criteria:** AC-019
**Test Scenario:** TS-019
**Priority:** Critical
**Test Type:** Functional / Data Validation
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Successful order exists.

### Expected Order Data

The order should correctly represent transaction information including, where applicable:

* Order identifier
* Customer information
* Purchased products
* Product quantities
* Unit prices
* Transaction total
* Payment result
* Order status

### Expected Result

Order information matches the transaction that generated the order.

---

## TC-031 — Persist Successful Order in Database

**Requirement:** FR-007
**Acceptance Criteria:** AC-020
**Test Scenario:** TS-020
**Priority:** Critical
**Test Type:** Database / Integration
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Successful order has been generated.
* Database is available.
* Test environment permits database validation.

### Test Steps

| Step | Action                            | Expected Result                     |
| ---- | --------------------------------- | ----------------------------------- |
| 1    | Complete a successful transaction | Order is generated                  |
| 2    | Capture the order identifier      | Identifier is available             |
| 3    | Query the order persistence layer | Corresponding order record is found |
| 4    | Compare stored order information  | Stored data matches transaction     |
| 5    | Verify order status               | Expected status is persisted        |

### Expected Result

The successfully created order is correctly persisted and can be retrieved using its unique identifier.

### Postconditions

* Order remains stored in the database.

---

## TC-032 — Validate Order Data Integrity

**Requirement:** FR-007
**Test Scenario:** TS-027
**Priority:** Critical
**Test Type:** Database / Integration / Data Integrity
**Automation Candidate:** Yes
**Execution Status:** Not Executed
**Automation Status:** Not Automated

### Preconditions

* Successful transaction and order exist.
* Database access for test validation is available.

### Validation Model

```text
Application Transaction
        ↓
Order Service
        ↓
Database
```

The following values should remain consistent across layers:

| Transaction Field | Database Field |
| ----------------- | -------------- |
| Order ID          | Order ID       |
| Customer          | Customer       |
| Product           | Product        |
| Quantity          | Quantity       |
| Unit Price        | Unit Price     |
| Total             | Total          |
| Status            | Status         |

### Expected Result

Order information stored in the database matches the transaction produced by the application without unexpected data corruption or inconsistency.

---

# 21. Payment and Order Decision Table

| Rule | Checkout Valid | Payment | Order Created | Persisted           | Expected Result            |
| ---- | -------------- | ------- | ------------- | ------------------- | -------------------------- |
| R1   | Yes            | Success | Yes           | Yes                 | Transaction succeeds       |
| R2   | Yes            | Failed  | No            | No successful order | Payment rejected           |
| R3   | No             | —       | No            | No                  | Payment should not proceed |
| R4   | Yes            | Success | No            | No                  | System/integration defect  |
| R5   | Yes            | Success | Yes           | No                  | Persistence defect         |

---

# 22. Critical E2E Assertions

The following cross-layer rules are considered critical:

1. Successful payment must lead to a valid order.
2. Failed payment must not create a successful order.
3. Successful order must be persisted.
4. Persisted data must match the transaction.
5. Order totals must remain consistent between cart, checkout, order and database.
6. Order status must represent the real transaction state.

---

# 23. Payment and Order Requirement Gaps

The following rules require clarification:

* Supported payment methods.
* Payment timeout behavior.
* Retry behavior after payment failure.
* Duplicate payment protection.
* Duplicate order protection.
* Payment idempotency behavior.
* Order identifier format.
* Initial order status.
* Order status transitions.
* Transaction rollback behavior.
* Behavior when payment succeeds but order creation fails.
* Behavior when order is created but database persistence fails.
* Behavior when external payment confirmation is delayed.
* Currency and rounding rules.
* Payment audit requirements.

---

# 24. Payment and Order Coverage Summary

| Test Case | Validation                | Layer               | Priority |
| --------- | ------------------------- | ------------------- | -------- |
| TC-026    | Successful payment        | Integration         | Critical |
| TC-027    | Failed payment            | Integration         | Critical |
| TC-028    | Failed payment → no order | E2E / Business Rule | Critical |
| TC-029    | Successful order creation | Integration         | Critical |
| TC-030    | Order information         | Functional / Data   | Critical |
| TC-031    | Order persistence         | Database            | Critical |
| TC-032    | Data integrity            | Database / E2E      | Critical |
