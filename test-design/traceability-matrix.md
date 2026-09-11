# Requirements Traceability Matrix — QA E-Commerce Platform

## 1. Purpose

The Requirements Traceability Matrix connects requirements, acceptance criteria, test scenarios and detailed test cases.

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
Execution
   ↓
Defect
   ↓
Release Decision
```

---

## 3. Main Functional Traceability

| Requirement | Area            | AC            | Scenario                     | Test Cases    |
| ----------- | --------------- | ------------- | ---------------------------- | ------------- |
| FR-001      | Authentication  | AC-001–AC-004 | TS-001–TS-004                | TC-001–TC-006 |
| FR-002      | Product Catalog | AC-005–AC-006 | TS-005–TS-006                | TC-007–TC-008 |
| FR-003      | Product Details | AC-007–AC-008 | TS-007–TS-008                | TC-009–TC-010 |
| FR-004      | Shopping Cart   | AC-009–AC-012 | TS-009–TS-012, TS-024–TS-025 | TC-011–TC-019 |
| FR-005      | Checkout        | AC-013–AC-015 | TS-013–TS-015                | TC-020–TC-025 |
| FR-006      | Payment         | AC-016–AC-017 | TS-016–TS-017, TS-026        | TC-026–TC-028 |
| FR-007      | Order           | AC-018–AC-020 | TS-018–TS-020, TS-027        | TC-029–TC-032 |
| FR-008      | Email           | AC-021        | TS-021, TS-028               | TC-033–TC-036 |

---

## 4. E2E Coverage

| Test Case | Flow                          | Priority |
| --------- | ----------------------------- | -------- |
| TC-037    | Successful purchase           | Critical |
| TC-038    | Failed payment                | Critical |
| TC-039    | Persistence failure           | Critical |
| TC-040    | Duplicate purchase submission | Critical |

---

## 5. Requirement Coverage

| Requirement | Status  |
| ----------- | ------- |
| FR-001      | Covered |
| FR-002      | Covered |
| FR-003      | Covered |
| FR-004      | Covered |
| FR-005      | Covered |
| FR-006      | Covered |
| FR-007      | Covered |
| FR-008      | Covered |

Design coverage:

```text
8 / 8 = 100%
```

---

## 6. Acceptance Criteria Coverage

Defined acceptance criteria:

```text
AC-001 → AC-021
```

All currently defined acceptance criteria have designed test coverage.

Design coverage:

```text
21 / 21 = 100%
```

---

## 7. Execution Coverage

Current phase:

```text
Designed Test Cases = 40
Executed Test Cases = 0
```

Therefore:

```text
Execution Coverage = 0%
```

This is expected during Test Design.

---

## 8. Automation Coverage

Automation candidates have been identified, but implementation is still pending.

```text
Implemented Automated Tests = 0
```

Automation implementation coverage is therefore currently 0%.

---

## 9. Important Distinction

```text
Design Coverage = 100%
Execution Coverage = 0%
Automation Coverage = 0%
```

100% design coverage does not mean the product is production ready.

---

## 10. Risk-Based Coverage

QA identified additional coverage beyond explicit acceptance criteria, including:

* Invalid quantities
* Empty cart behavior
* Payment/order consistency
* Data integrity
* Notification consistency
* Persistence failures
* Duplicate transaction risk

These scenarios should be reviewed as requirements evolve.

---

## 11. Future RTM Evolution

The matrix will later include:

| Test Case | Automated | Execution         | Defect | Evidence | Release  |
| --------- | --------- | ----------------- | ------ | -------- | -------- |
| TC-XXX    | Yes/No    | Pass/Fail/Blocked | DEF-ID | Report   | Go/No-Go |

---

## 12. Completion Criteria

The RTM is ready when:

* Requirements are represented.
* Acceptance criteria are traceable.
* Test scenarios are traceable.
* Test cases are traceable.
* Risk-based gaps are visible.
* Execution status can be incorporated.
* Automation status can be incorporated.
