# Communication Plan — QA E-Commerce Platform

## 1. Propósito

Este documento define cómo será comunicada la información del proyecto y del estado de calidad entre los stakeholders.

El objetivo es garantizar que las decisiones relacionadas con calidad, riesgo y release se basen en información clara, oportuna y trazable.

---

## 2. Objetivos

* Mantener alineados a los stakeholders.
* Proporcionar visibilidad del progreso.
* Comunicar el estado de calidad.
* Escalar Blockers rápidamente.
* Comunicar defectos Critical.
* Comunicar riesgos.
* Facilitar Release Decisions.
* Mantener trazabilidad de decisiones.

---

## 3. Stakeholders

* Product Owner.
* Project Manager.
* Business Analyst.
* QA Lead.
* QA Engineer.
* Development Lead.
* Developers.
* DevOps Engineer.
* Customer Support.

---

## 4. Communication Matrix

| Comunicación        | Audiencia            | Responsable      | Frecuencia      | Objetivo                      |
| ------------------- | -------------------- | ---------------- | --------------- | ----------------------------- |
| Project Status      | Project Team         | Project Manager  | Semanal         | Comunicar progreso            |
| QA Status           | PM / PO / Dev        | QA Lead          | Por ciclo       | Visibilidad de calidad        |
| Defect Review       | QA / Dev / PO        | QA Lead          | Según necesidad | Priorizar defectos            |
| Risk Review         | PM / QA / PO         | Project Manager  | Semanal         | Gestionar riesgos             |
| Requirements Review | PO / BA / QA / Dev   | BA / PO          | Según necesidad | Resolver ambigüedades         |
| Automation Status   | QA / Dev             | QA Lead          | Por ciclo       | Seguimiento de automatización |
| Regression Report   | Stakeholders         | QA Lead          | Por Regression  | Comunicar resultados          |
| Release Readiness   | Release Stakeholders | QA Lead          | Por Release     | Soportar Go/No-Go             |
| Production Incident | Equipos afectados    | Responsible Lead | Inmediata       | Gestionar incidentes          |

---

## 5. QA Status Report

Debe incluir:

Tests Planned
Tests Executed
Passed
Failed
Blocked
Not Executed
Critical Defects
High Defects
Environment Issues
Automation Status
Risks
Next Activities

Ejemplo:

Regression Progress: 85%

Executed: 34
Passed: 30
Failed: 1
Blocked: 3

Critical Defects: 0
High Defects: 1

Main Risk:
Payment Sandbox unavailable.

QA Recommendation:
Regression must continue before Release approval.

---

## 6. Escalación

Se requiere escalación inmediata ante:

* Critical Production Defect.
* Payment Failure de alto impacto.
* Data Corruption.
* Security Risk significativo.
* Release Blocker.
* Critical Environment Outage.
* Critical Integration Failure.

---

## 7. Flujo de escalación

Issue Detected
      ↓
QA Engineer
      ↓
QA Lead
      ↓
Development / DevOps
      ↓
Project Manager
      ↓
Product Owner
      ↓
Business / Release Decision

---

## 8. Requirement Gaps

QA no debe inventar el comportamiento esperado.

El proceso será:

Requirement Gap
      ↓
Document
      ↓
BA / Product Owner
      ↓
Clarification
      ↓
Requirement Update
      ↓
Test Design Update
      ↓
RTM Update

---

## 9. Comunicación de Release

Antes de un release, QA comunicará:

* Regression Status.
* Pass/Fail/Blocked.
* Open Defects.
* Known Limitations.
* Residual Risks.
* Automation Results.
* Quality Gate Status.

Posibles recomendaciones:

GO
GO WITH ACCEPTED RISK
NO-GO

---

## 10. Principios de comunicación

La comunicación debe ser:

* Clara.
* Objetiva.
* Basada en evidencia.
* Oportuna.
* Trazable.
* Adecuada para la audiencia.

Evitar:

Testing is going badly.

Preferir:

85% of Regression has been executed.
3 Critical Tests remain Blocked due to Payment Sandbox unavailability.
1 High Defect affects Checkout.
Current Release Risk: High.

---

## 11. Canales

Pueden utilizarse:

* GitHub.
* Project Management Tools.
* CI/CD Reports.
* Test Reports.
* Meetings.
* Approved Team Communication Tools.
* Email.

Las decisiones importantes deberán quedar documentadas.

---

## 12. Mejora continua

Después de releases importantes se revisarán:

* Communication delays.
* Missing stakeholders.
* Late escalations.
* Reporting gaps.
* Decision bottlenecks.
* Lessons Learned.
