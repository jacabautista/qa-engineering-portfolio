# Change Management Plan — QA E-Commerce Platform

## 1. Propósito

Este documento define cómo se identificarán, analizarán, aprobarán, implementarán y validarán los cambios dentro del proyecto.

El objetivo es prevenir cambios no controlados que puedan afectar Scope, Quality, Schedule, Testing, Automation o Release Stability.

---

## 2. Objetivos

* Evitar Scope Creep.
* Evaluar Business Impact.
* Evaluar Technical Impact.
* Evaluar QA Impact.
* Mantener Requirements Traceability.
* Evaluar Regression Impact.
* Proteger Release Quality.
* Mantener alineados a los stakeholders.

---

## 3. Fuentes de cambios

Los cambios pueden originarse desde:

* Product Owner.
* Business Stakeholders.
* Business Analyst.
* Project Manager.
* Development.
* QA.
* DevOps.
* Production Incidents.
* Customer Feedback.
* Security Findings.
* Technical Constraints.

---

## 4. Tipos de cambios

### Business Requirements

Ejemplo:

Nueva regla de Checkout.

### Functional Requirements

Ejemplo:

Nueva validación de cantidad.

### API

Ejemplo:

Cambio del Response Schema.

### Database

Ejemplo:

Nueva columna o Constraint.

### Infrastructure

Ejemplo:

Cambio en Deployment Configuration.

### Quality Requirements

Ejemplo:

Nuevo Performance Target.

---

## 5. Flujo de Change Management

Change Request
      ↓
Initial Review
      ↓
Impact Analysis
      ↓
Business Review
      ↓
Technical Review
      ↓
QA Impact Analysis
      ↓
Risk Analysis
      ↓
Approve / Reject / Defer
      ↓
Implementation
      ↓
Testing
      ↓
Regression
      ↓
Traceability Update

---

## 6. Información del Change Request

Debe incluir:

* Change ID.
* Title.
* Description.
* Requester.
* Business Reason.
* Priority.
* Affected Functionality.
* Expected Benefit.
* Dependencies.
* Known Risks.

---

## 7. Clasificación

| Nivel    | Descripción                       | Ejemplo              |
| -------- | --------------------------------- | -------------------- |
| Low      | Impacto mínimo                    | Cambio de texto      |
| Medium   | Impacto funcional limitado        | Nueva validación     |
| High     | Impacto sobre flujo principal     | Cambio en Checkout   |
| Critical | Impacto financiero/arquitectónico | Cambio Payment/Order |

---

## 8. QA Impact Analysis

QA evaluará:

* Requirements afectados.
* Acceptance Criteria afectados.
* Test Scenarios afectados.
* Test Cases afectados.
* Test Data afectada.
* Decision Tables.
* Boundary Analysis.
* APIs.
* Database.
* UI.
* Automation.
* Regression Scope.
* Performance.
* Security.
* Environments.
* Release Risk.

---

## 9. Ejemplo

Nuevo requisito:

Maximum product quantity per cart item = 10

Impacto:

Requirement
     ↓
Acceptance Criteria
     ↓
Boundary Analysis
     ↓
Test Scenarios
     ↓
Test Cases
     ↓
API Tests
     ↓
Automation
     ↓
Regression
     ↓
RTM

Nuevos límites:

| Quantity | Clasificación              |
| -------: | -------------------------- |
|        0 | Invalid / Business-defined |
|        1 | Minimum Valid              |
|        9 | Valid                      |
|       10 | Maximum Valid              |
|       11 | Invalid                    |

---

## 10. Decisiones posibles

APPROVED

REJECTED

DEFERRED

NEEDS CLARIFICATION

La decisión deberá quedar documentada.

---

## 11. Regression Impact

Cada cambio debe responder:

What changed?

What could this change break?

Which Test Cases validate it?

Which existing tests must be rerun?

Which Automated Tests must be updated?

Which integrations could be affected?

---

## 12. Automation Impact

Un cambio puede requerir:

* Locator updates.
* API payload changes.
* Schema updates.
* Test Data updates.
* Page Object updates.
* Assertions updates.
* Environment configuration.
* Pipeline updates.

---

## 13. Database Impact

Evaluar:

* Schema.
* Columns.
* Relationships.
* Constraints.
* Migration.
* Referential Integrity.
* Backward Compatibility.

---

## 14. API Impact

Evaluar:

* Endpoint.
* HTTP Method.
* Request Schema.
* Response Schema.
* Authentication.
* Headers.
* Status Codes.
* Error Model.
* Versioning.
* Backward Compatibility.

---

## 15. Risk Register

Los nuevos riesgos significativos deberán agregarse a:

docs/risk-register.md

---

## 16. Scope Creep Prevention

New Request
     ↓
Evaluate
     ↓
Estimate
     ↓
Approve
     ↓
Update Scope
     ↓
Implement

Un nuevo requerimiento no debe convertirse silenciosamente en Scope comprometido.

---

## 17. Emergency Changes

Un Emergency Change deberá considerar como mínimo:

* Justificación.
* Owner.
* Risk Assessment.
* Approval.
* Minimum Testing.
* Production Smoke.
* Monitoring.
* Rollback consideration.
* Post-change review.

---

## 18. Post-Change Validation

QA deberá validar:

* Nuevo comportamiento.
* Funcionalidad relacionada.
* Regression Scope.
* Data Integrity.
* API behavior.
* Automation status.
* Environment health.

---

## 19. Principio

Code Change
    ≠
Complete Change

Un cambio puede afectar:

Requirements
Tests
Automation
Test Data
API Contracts
Database
Documentation
CI/CD
Risk Register
Release Documentation

---

## 20. Criterio de finalización

El proceso se considera establecido cuando:

* Los cambios son identificados.
* Existe Impact Analysis.
* QA Impact es evaluado.
* Las decisiones son documentadas.
* Regression Impact es evaluado.
* La trazabilidad se mantiene.
* Los Emergency Changes están controlados.
