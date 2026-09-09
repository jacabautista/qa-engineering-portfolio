# Acceptance Criteria — QA E-Commerce Platform

## 1. Purpose

The purpose of this document is to define clear, measurable and testable acceptance criteria for the main functional requirements of the QA E-Commerce Platform.

These criteria will be used as the foundation for test scenarios, test cases, automation and requirements traceability.

## 2. Acceptance Criteria Format

Acceptance criteria will use the following structure:

```text
Given   → Initial condition
When    → Action performed
Then    → Expected result
```

Each criterion must be:

* Clear
* Testable
* Measurable
* Unambiguous
* Traceable to a requirement

## 3. Authentication

### FR-001 — User Authentication

#### AC-001 — Successful Login

**Given** a registered user with valid credentials
**When** the user submits the login form
**Then** the system must authenticate the user and provide access to the application.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-002 — Invalid Password

**Given** a registered user
**When** the user submits an incorrect password
**Then** the system must reject authentication and display an appropriate error message.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-003 — Invalid User

**Given** a user that does not exist
**When** the user attempts to authenticate
**Then** the system must reject the authentication request.

**Priority:** High
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-004 — Required Credentials

**Given** the login form is displayed
**When** the user submits the form without required credentials
**Then** the system must display validation messages for the required fields.

**Priority:** High
**Testable:** Yes
**Automation Candidate:** Yes

## 4. Product Catalog

### FR-002 — Product Catalog

#### AC-005 — Display Available Products

**Given** the customer accesses the product catalog
**When** the catalog loads successfully
**Then** the system must display available products with their relevant information.

**Priority:** High
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-006 — Product Selection

**Given** an available product is displayed
**When** the customer selects the product
**Then** the system must navigate to the corresponding product details.

**Priority:** High
**Testable:** Yes
**Automation Candidate:** Yes

## 5. Product Details

### FR-003 — Product Details

#### AC-007 — Product Information

**Given** the customer selects a product
**When** the product details page loads
**Then** the system must display the product name, description, price and availability.

**Priority:** High
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-008 — Add Available Product

**Given** a product is available
**When** the customer selects the add-to-cart action
**Then** the product must be added to the shopping cart.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

## 6. Shopping Cart

### FR-004 — Shopping Cart

#### AC-009 — Add Product

**Given** the customer is viewing an available product
**When** the customer adds the product to the cart
**Then** the cart must contain the selected product.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-010 — Update Quantity

**Given** a product exists in the shopping cart
**When** the customer changes the quantity
**Then** the cart total must be recalculated correctly.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-011 — Remove Product

**Given** a product exists in the shopping cart
**When** the customer removes the product
**Then** the product must no longer appear in the cart.

**Priority:** High
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-012 — Cart Total

**Given** one or more products exist in the cart
**When** the cart is displayed
**Then** the total must equal the sum of the selected product prices multiplied by their quantities.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

## 7. Checkout

### FR-005 — Checkout

#### AC-013 — Required Checkout Information

**Given** the customer starts checkout
**When** required information is missing
**Then** the system must prevent the customer from continuing and display validation messages.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-014 — Valid Checkout

**Given** all required checkout information is valid
**When** the customer submits the checkout information
**Then** the system must allow the customer to proceed to payment.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-015 — Invalid Checkout Information

**Given** the customer is completing checkout
**When** invalid information is submitted
**Then** the system must reject the information and display an appropriate validation message.

**Priority:** High
**Testable:** Yes
**Automation Candidate:** Yes

## 8. Payment

### FR-006 — Payment

#### AC-016 — Successful Payment Validation

**Given** a valid checkout
**When** the payment information is accepted
**Then** the payment process must be marked as successful and the order process may continue.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-017 — Failed Payment

**Given** a valid checkout
**When** the payment process fails
**Then** the system must report the payment failure and must not create a successful order.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

## 9. Order Creation

### FR-007 — Order Creation

#### AC-018 — Successful Order

**Given** checkout and payment have been successfully validated
**When** the order is submitted
**Then** the system must create an order with a unique identifier.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-019 — Order Information

**Given** an order has been successfully created
**When** the order details are displayed
**Then** the order must contain the correct products, quantities and total amount.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

#### AC-020 — Order Persistence

**Given** an order has been successfully created
**When** the order is persisted
**Then** the corresponding order information must be stored correctly in the database.

**Priority:** Critical
**Testable:** Yes
**Automation Candidate:** Yes

## 10. Email Notification

### FR-008 — Email Notification

#### AC-021 — Order Notification

**Given** an order has been successfully created
**When** the notification process is triggered
**Then** the system must generate an order notification containing information corresponding to the created order.

**Priority:** Medium
**Testable:** Yes
**Automation Candidate:** Partial

## 11. Acceptance Criteria Summary

| ID     | Requirement        | Priority | Testable | Automation |
| ------ | ------------------ | -------- | -------- | ---------- |
| AC-001 | Authentication     | Critical | Yes      | Yes        |
| AC-002 | Authentication     | Critical | Yes      | Yes        |
| AC-003 | Authentication     | High     | Yes      | Yes        |
| AC-004 | Authentication     | High     | Yes      | Yes        |
| AC-005 | Product Catalog    | High     | Yes      | Yes        |
| AC-006 | Product Catalog    | High     | Yes      | Yes        |
| AC-007 | Product Details    | High     | Yes      | Yes        |
| AC-008 | Product Details    | Critical | Yes      | Yes        |
| AC-009 | Shopping Cart      | Critical | Yes      | Yes        |
| AC-010 | Shopping Cart      | Critical | Yes      | Yes        |
| AC-011 | Shopping Cart      | High     | Yes      | Yes        |
| AC-012 | Shopping Cart      | Critical | Yes      | Yes        |
| AC-013 | Checkout           | Critical | Yes      | Yes        |
| AC-014 | Checkout           | Critical | Yes      | Yes        |
| AC-015 | Checkout           | High     | Yes      | Yes        |
| AC-016 | Payment            | Critical | Yes      | Yes        |
| AC-017 | Payment            | Critical | Yes      | Yes        |
| AC-018 | Order Creation     | Critical | Yes      | Yes        |
| AC-019 | Order Creation     | Critical | Yes      | Yes        |
| AC-020 | Order Creation     | Critical | Yes      | Yes        |
| AC-021 | Email Notification | Medium   | Yes      | Partial    |

## 12. Definition of Acceptance Criteria Completion

The acceptance criteria will be considered complete when:

* All critical requirements have defined acceptance criteria.
* Each criterion is testable.
* Each criterion has a defined priority.
* Automation candidates have been identified.
* Criteria can be mapped to test scenarios and test cases.
* Criteria can be traced back to the corresponding requirement.
