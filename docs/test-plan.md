# Test Plan — QA E-Commerce Platform

## 1. Propósito

Este documento define el plan de pruebas específico para QA E-Commerce Platform.

El Test Plan establece qué será probado, cómo se organizará la ejecución, qué ambientes y datos serán utilizados, cuáles serán los criterios de entrada y salida y qué evidencia deberá generarse.

---

## 2. Objetivos

Los objetivos son:

* Validar los requisitos funcionales.
* Validar los flujos críticos de negocio.
* Ejecutar escenarios positivos y negativos.
* Validar valores límite.
* Validar APIs.
* Validar persistencia en Database.
* Validar integraciones.
* Construir Automated Regression.
* Generar evidencia de calidad.
* Proporcionar información para decisiones de release.

---

## 3. Alcance

### In Scope

* Authentication.
* Product Catalog.
* Product Details.
* Shopping Cart.
* Checkout.
* Payment.
* Order Creation.
* Database Persistence.
* Email Notification.
* REST APIs.
* Integration Testing.
* Automation.
* CI/CD Validation.
* Regression Testing.
* Production Smoke Testing.

### Out of Scope

En la fase actual:

* Desarrollo de la aplicación.
* Transacciones financieras reales.
* Full Penetration Testing.
* Hardware Testing.
* Procesos de negocio externos no relacionados.

---

## 4. Flujo crítico

Login
 ↓
Catalog
 ↓
Product
 ↓
Cart
 ↓
Checkout
 ↓
Payment
 ↓
Order
 ↓
Database
 ↓
Email

Este flujo tendrá prioridad Critical dentro de Regression.

---

## 5. Entregables

* Requirements Analysis.
* Acceptance Criteria.
* Test Scenarios.
* Test Cases.
* Test Data.
* Requirements Traceability Matrix.
* Decision Tables.
* Boundary Analysis.
* API Test Cases.
* Automated Tests.
* Defect Reports.
* Test Execution Report.
* Regression Report.
* Release Checklist.
* QA Recommendation.
* Production Smoke Report.

---

## 6. Fases

Requirements Analysis
        ↓
Test Planning
        ↓
Test Design
        ↓
API Testing
        ↓
Database Testing
        ↓
Automation
        ↓
CI/CD
        ↓
Regression
        ↓
Release Validation
        ↓
Production Validation

---

## 7. Tipos de pruebas

El proyecto utilizará, según corresponda:

* Functional Testing.
* Positive Testing.
* Negative Testing.
* Equivalence Partitioning.
* Boundary Value Analysis.
* Decision Table Testing.
* API Testing.
* Database Testing.
* Integration Testing.
* End-to-End Testing.
* Regression Testing.
* Smoke Testing.
* Exploratory Testing.
* Performance Testing.
* Basic Security Validation.

---

## 8. Ambientes

Modelo:

Local
 ↓
Development
 ↓
QA
 ↓
Staging
 ↓
Production

La estrategia detallada se encuentra en:

test-design/environment-strategy.md

---

## 9. Test Data

Los datos deberán ser:

* Controlados.
* Predecibles.
* Repetibles.
* Aislados cuando sea posible.
* No sensibles.

La definición se mantiene en:

test-design/test-data.md

---

## 10. Prioridades

### Critical

Flujos que pueden impedir operaciones principales del negocio.

### High

Funcionalidades importantes con impacto significativo.

### Medium

Funcionalidades con impacto moderado.

### Low

Escenarios de menor impacto.

---

## 11. Ciclos previstos

### Cycle 1 — Functional Validation

Validación individual de funcionalidades.

### Cycle 2 — API / Integration

Validación de servicios e integraciones.

### Cycle 3 — Automated Regression

Ejecución de escenarios automatizados estables.

### Cycle 4 — Release Regression

Validación del Release Candidate.

### Cycle 5 — Production Smoke

Validación controlada posterior al deployment.

---

## 12. Entry Criteria

La ejecución puede comenzar cuando:

* Build disponible.
* Ambiente disponible.
* Requisitos definidos.
* Acceptance Criteria disponibles.
* Test Data preparada.
* Dependencias críticas disponibles.

---

## 13. Exit Criteria

Una fase puede finalizar cuando:

* Critical Tests fueron ejecutados.
* Critical Defects fueron resueltos o aceptados formalmente.
* Regression fue completada.
* Evidencia fue generada.
* Riesgos conocidos fueron documentados.
* Quality Gates aplicables fueron evaluados.

---

## 14. Suspension Criteria

Las pruebas podrán suspenderse cuando:

* El ambiente esté indisponible.
* El Build sea inestable.
* Una dependencia crítica esté caída.
* No sea posible preparar Test Data.
* Un Blocker impida continuar.

Un test impedido por una dependencia deberá evaluarse como:

Blocked

y no automáticamente como:

Failed

---

## 15. Roles

| Rol              | Responsabilidad                    |
| ---------------- | ---------------------------------- |
| Product Owner    | Reglas de negocio                  |
| Project Manager  | Planificación y coordinación       |
| Business Analyst | Requisitos                         |
| QA Lead          | Estrategia y reporting             |
| QA Engineer      | Diseño, ejecución y automatización |
| Development      | Implementación y corrección        |
| DevOps           | Ambientes, deployment y CI/CD      |

---

## 16. Defect Management

Los defectos deberán incluir:

* ID.
* Summary.
* Environment.
* Severity.
* Priority.
* Preconditions.
* Steps.
* Actual Result.
* Expected Result.
* Evidence.
* Status.

---

## 17. Reporting

QA reportará:

Planned
Executed
Passed
Failed
Blocked
Not Executed
Defects
Coverage
Risks
Automation Status
QA Recommendation

---

## 18. Criterios de éxito

La ejecución será considerada exitosa cuando:

* Los flujos críticos hayan sido validados.
* La evidencia sea trazable.
* Los defectos críticos sean conocidos.
* Los riesgos residuales sean comunicados.
* Los Quality Gates puedan ser evaluados.
* Exista información suficiente para una decisión de release.
