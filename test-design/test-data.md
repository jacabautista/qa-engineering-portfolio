# Test Data Management — QA E-Commerce Platform

## 1. Purpose

This document defines the strategy for creating, managing, protecting and maintaining test data for the QA E-Commerce Platform.

The objective is to ensure that test execution is repeatable, isolated, traceable and suitable for automation.

---

## 2. Test Data Principles

Test data should be:

* Predictable
* Reusable when appropriate
* Isolated between test executions
* Easy to create
* Easy to reset
* Non-sensitive
* Traceable
* Suitable for automated execution

Production-sensitive data must not be copied into test environments without appropriate protection and authorization.

---

## 3. Test Data Categories

| Category    | Example                             |
| ----------- | ----------------------------------- |
| Valid       | Registered active user              |
| Invalid     | Invalid password                    |
| Boundary    | Quantity = 0 or 1                   |
| Negative    | Failed payment response             |
| Integration | Valid order for database validation |
| E2E         | User + product + payment + order    |
| Security    | Unauthorized session                |

---

# 4. Authentication Test Data

| Data ID     | Username         | Password         | State          | Purpose                   |
| ----------- | ---------------- | ---------------- | -------------- | ------------------------- |
| TD-AUTH-001 | valid_user       | valid_password   | Active         | Successful authentication |
| TD-AUTH-002 | valid_user       | invalid_password | Active         | Invalid password          |
| TD-AUTH-003 | nonexistent_user | test_password    | Not Registered | Invalid account           |
| TD-AUTH-004 | Empty            | valid_password   | N/A            | Required username         |
| TD-AUTH-005 | valid_user       | Empty            | N/A            | Required password         |
| TD-AUTH-006 | Empty            | Empty            | N/A            | Required credentials      |

---

# 5. Product Test Data

| Data ID     | Product   |  Price | Stock | Purpose                    |
| ----------- | --------- | -----: | ----: | -------------------------- |
| TD-PROD-001 | Product A | 100.00 |    10 | Standard available product |
| TD-PROD-002 | Product B |  50.00 |     5 | Multi-product cart         |
| TD-PROD-003 | Product C |  75.00 |     0 | Out-of-stock validation    |

---

# 6. Shopping Cart Test Data

| Data ID     | Product   | Quantity | Expected Classification           |
| ----------- | --------- | -------: | --------------------------------- |
| TD-CART-001 | Product A |       -1 | Invalid                           |
| TD-CART-002 | Product A |        0 | Boundary / Requires business rule |
| TD-CART-003 | Product A |        1 | Minimum valid                     |
| TD-CART-004 | Product A |        2 | Valid                             |
| TD-CART-005 | Product A |        3 | Valid                             |

---

# 7. Checkout Test Data

| Data ID    | Customer | Shipping | Cart      | Expected |
| ---------- | -------- | -------- | --------- | -------- |
| TD-CHK-001 | Valid    | Valid    | Has Items | Continue |
| TD-CHK-002 | Missing  | Valid    | Has Items | Reject   |
| TD-CHK-003 | Valid    | Missing  | Has Items | Reject   |
| TD-CHK-004 | Invalid  | Valid    | Has Items | Reject   |
| TD-CHK-005 | Valid    | Invalid  | Has Items | Reject   |
| TD-CHK-006 | Valid    | Valid    | Empty     | Reject   |

---

# 8. Payment Test Data

| Data ID    | Payment Response     | Expected Transaction            |
| ---------- | -------------------- | ------------------------------- |
| TD-PAY-001 | Approved             | Continue                        |
| TD-PAY-002 | Declined             | Stop                            |
| TD-PAY-003 | Timeout              | Requires recovery rule          |
| TD-PAY-004 | Duplicate submission | Requires idempotency validation |

---

# 9. Order Test Data

| Data ID    | Scenario            | Expected Result               |
| ---------- | ------------------- | ----------------------------- |
| TD-ORD-001 | Successful payment  | Order created                 |
| TD-ORD-002 | Failed payment      | No successful order           |
| TD-ORD-003 | Persistence failure | Recovery behavior required    |
| TD-ORD-004 | Duplicate request   | No unintended duplicate order |

---

# 10. Test Data Lifecycle

```text id="tdm-lifecycle"
Create
  ↓
Prepare
  ↓
Execute Test
  ↓
Validate
  ↓
Clean / Reset
```

Test data should not create dependencies between independent automated tests.

For example:

```text id="tdm-bad"
TC-001 creates User A
      ↓
TC-002 requires User A
      ↓
TC-003 deletes User A
```

This creates fragile test dependency.

Preferred model:

```text id="tdm-good"
TC-001 → creates or retrieves its own data
TC-002 → creates or retrieves its own data
TC-003 → creates or retrieves its own data
```

---

# 11. Test Data Isolation

Automated tests should avoid sharing mutable test data where possible.

Recommended strategies include:

* Unique identifiers
* Dedicated test accounts
* API-based setup
* Database setup scripts
* Fixtures
* Factory methods
* Cleanup routines
* Environment reset processes

Example identifier pattern:

```text id="tdm-id"
qa_user_<timestamp>
qa_order_<unique-id>
```

---

# 12. Sensitive Data Rules

Test data should avoid:

* Real passwords
* Real payment information
* Real customer personal information
* Production credentials
* Production access tokens
* Confidential production records

Preferred approach:

```text id="tdm-sensitive"
Synthetic Data
Masked Data
Dedicated Test Accounts
Mock Payment Data
```

---

# 13. Automation Data Strategy

Different automation layers may use different data strategies.

| Layer       | Preferred Strategy            |
| ----------- | ----------------------------- |
| UI          | Fixtures / API setup          |
| API         | JSON payloads / factories     |
| Database    | Seed scripts                  |
| E2E         | Controlled integrated dataset |
| Performance | Generated datasets            |

---

# 14. Test Data Risks

| Risk                         | Impact                 | Mitigation            |
| ---------------------------- | ---------------------- | --------------------- |
| Shared test data             | Flaky tests            | Isolated datasets     |
| Data modified by other tests | Unstable results       | Unique data           |
| Production data exposure     | Security risk          | Synthetic data        |
| Data not reset               | False failures         | Cleanup strategy      |
| Hard-coded credentials       | Security / maintenance | Environment variables |
| Duplicate records            | Execution failures     | Unique identifiers    |

---

# 15. Completion Criteria

Test data management is considered ready when:

* Critical test cases have defined data.
* Positive and negative datasets exist.
* Boundary data is identified.
* Sensitive production data is avoided.
* Test isolation rules are defined.
* Cleanup strategy is documented.
* Automation data strategy is defined.
* Required environment variables are identified.
