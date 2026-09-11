# Requirements Traceability Matrix — QA E-Commerce Platform

## 1. Propósito

Este documento mantiene trazabilidad entre Requirements, Acceptance Criteria, Test Scenarios y Test Cases.

La trazabilidad permite identificar:

* Qué requisito está cubierto.
* Qué pruebas lo validan.
* Qué cobertura falta.
* Qué pruebas deberán actualizarse cuando cambia un requisito.

---

## 2. Flujo de trazabilidad

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
Release

---

## 3. Matriz principal

| Requirement | Acceptance Criteria | Test Scenarios               | Test Cases    |
| ----------- | ------------------- | ---------------------------- | ------------- |
| FR-001      | AC-001–AC-004       | TS-001–TS-004, TS-022        | TC-001–TC-006 |
| FR-002      | AC-005–AC-006       | TS-005–TS-006                | TC-007–TC-008 |
| FR-003      | AC-007–AC-008       | TS-007–TS-008, TS-023        | TC-009–TC-010 |
| FR-004      | AC-009–AC-012       | TS-009–TS-012, TS-024–TS-025 | TC-011–TC-019 |
| FR-005      | AC-013–AC-015       | TS-013–TS-015                | TC-020–TC-025 |
| FR-006      | AC-016–AC-017       | TS-016–TS-017, TS-026        | TC-026–TC-028 |
| FR-007      | AC-018–AC-020       | TS-018–TS-020, TS-027        | TC-029–TC-032 |
| FR-008      | AC-021              | TS-021, TS-028               | TC-033–TC-036 |

---

## 4. E2E Coverage

| Test Case | Descripción                   | Requirements principales       |
| --------- | ----------------------------- | ------------------------------ |
| TC-037    | Successful Purchase E2E       | FR-001–FR-008                  |
| TC-038    | Failed Payment E2E            | FR-005, FR-006, FR-007, FR-008 |
| TC-039    | Persistence Failure E2E       | FR-006, FR-007                 |
| TC-040    | Duplicate Purchase Submission | FR-006, FR-007                 |

---

## 5. Cobertura por requisito

### FR-001 — User Authentication

AC-001 → TS-001 → TC-001
AC-002 → TS-002 → TC-002
AC-003 → TS-003 → TC-003
AC-004 → TS-004 → TC-004, TC-005, TC-006

---

### FR-002 — Product Catalog

AC-005 → TS-005 → TC-007
AC-006 → TS-006 → TC-008

---

### FR-003 — Product Details

AC-007 → TS-007 → TC-009
AC-008 → TS-008 → TC-010

---

### FR-004 — Shopping Cart

AC-009 → TS-009 → TC-011
AC-010 → TS-010 → TC-012, TC-015
AC-011 → TS-011 → TC-016
AC-012 → TS-012 → TC-017

Risk-Based:
TS-024 → TC-013, TC-014
TS-025 → TC-018, TC-019

---

### FR-005 — Checkout

AC-013 → TS-013 → TC-021, TC-022
AC-014 → TS-014 → TC-020
AC-015 → TS-015 → TC-021–TC-025

---

### FR-006 — Payment

AC-016 → TS-016 → TC-026
AC-017 → TS-017 → TC-027
TS-026 → TC-028

---

### FR-007 — Order Creation

AC-018 → TS-018 → TC-029
AC-019 → TS-019 → TC-030
AC-020 → TS-020 → TC-031
TS-027 → TC-032

---

### FR-008 — Email Notification

AC-021 → TS-021 → TC-033, TC-036
TS-028 → TC-034, TC-035

---

## 6. Design Coverage

### Requirement Coverage

Requirements covered = 8
Total Requirements = 8

Design Coverage = 100%

### Acceptance Criteria Coverage

Acceptance Criteria covered = 21
Total Acceptance Criteria = 21

Design Coverage = 100%

---

## 7. Importante: Design Coverage ≠ Execution Coverage

Tener:

Design Coverage = 100%

no significa:

Execution = 100%

ni significa:

Pass Rate = 100%

ni significa:

Production Ready

Son métricas diferentes.

---

## 8. Execution Coverage inicial

Executed Test Cases = 0
Total Test Cases = 40

Execution Coverage = 0%

Hasta que existan resultados reales no se debe modificar este valor.

---

## 9. Automation Coverage inicial

Automated Test Cases = 0
Total Test Cases = 40

Automation Implementation Coverage = 0%

Ser Automation Candidate no significa estar automatizado.

---

## 10. Trazabilidad futura

La matriz podrá extenderse con columnas como:

| Requirement | AC | TS | TC | Automation | Status | Defect | Release |
| ----------- | -- | -- | -- | ---------- | ------ | ------ | ------- |

Ejemplo futuro:

FR-006
 ↓
AC-017
 ↓
TS-017
 ↓
TC-027
 ↓
API-AUTO-017
 ↓
FAILED
 ↓
BUG-102
 ↓
Release 1.2

---

## 11. Principio

La trazabilidad permite responder:

¿Qué requisito falló?

¿Qué prueba lo detectó?

¿Qué defecto se generó?

¿Qué release está afectado?

Esto convierte el testing en información útil para la gestión del proyecto.
