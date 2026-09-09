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
