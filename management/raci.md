# RACI Matrix — QA E-Commerce Platform

## 1. Propósito

Este documento define las responsabilidades de los principales roles del proyecto mediante una matriz RACI.

RACI significa:

* **R — Responsible:** persona que ejecuta la actividad.
* **A — Accountable:** persona responsable final del resultado.
* **C — Consulted:** persona que debe ser consultada.
* **I — Informed:** persona que debe ser informada.

---

## 2. Roles

Los principales roles considerados son:

* Product Owner — PO
* Project Manager — PM
* Business Analyst — BA
* QA Lead — QAL
* QA Engineer — QAE
* Development Lead — DL
* Developer — DEV
* DevOps Engineer — DO

---

## 3. RACI Matrix

| Actividad                    | PO | PM | BA | QAL | QAE | DL | DEV | DO  |
| ---------------------------- | -- | -- | -- | --- | --- | -- | --- | --- |
| Definir objetivos de negocio | A  | C  | R  | I   | I   | C  | I   | I   |
| Definir alcance              | A  | R  | C  | C   | I   | C  | I   | I   |
| Analizar requisitos          | A  | I  | R  | C   | C   | C  | I   | I   |
| Definir Acceptance Criteria  | A  | I  | R  | C   | C   | C  | I   | I   |
| Identificar Requirement Gaps | C  | I  | C  | A   | R   | C  | I   | I   |
| Definir Test Strategy        | I  | C  | C  | A/R | C   | C  | I   | I   |
| Crear Test Plan              | I  | C  | C  | A   | R   | C  | I   | I   |
| Diseñar Test Scenarios       | C  | I  | C  | A   | R   | C  | I   | I   |
| Diseñar Test Cases           | I  | I  | C  | A   | R   | C  | I   | I   |
| Preparar Test Data           | I  | I  | C  | A   | R   | C  | C   | C   |
| Ejecutar Functional Testing  | I  | I  | I  | A   | R   | C  | C   | I   |
| Ejecutar API Testing         | I  | I  | I  | A   | R   | C  | C   | I   |
| Ejecutar Database Testing    | I  | I  | I  | A   | R   | C  | C   | C   |
| Crear Automation Framework   | I  | I  | I  | A   | R   | C  | C   | C   |
| Implementar Automated Tests  | I  | I  | I  | A   | R   | C  | C   | I   |
| Configurar CI/CD             | I  | I  | I  | C   | C   | C  | I   | A/R |
| Reportar defectos            | I  | I  | I  | A   | R   | C  | C   | I   |
| Corregir defectos            | I  | I  | I  | C   | C   | A  | R   | I   |
| Ejecutar Regression          | I  | I  | I  | A   | R   | C  | C   | I   |
| Evaluar Quality Gates        | C  | C  | I  | A/R | C   | C  | I   | C   |
| Emitir QA Recommendation     | I  | C  | I  | A/R | C   | C  | I   | I   |
| Aprobar Release de negocio   | A  | R  | C  | C   | I   | C  | I   | C   |
| Ejecutar Deployment          | I  | I  | I  | C   | I   | C  | I   | A/R |
| Ejecutar Production Smoke    | I  | I  | I  | A   | R   | C  | I   | C   |
| Gestionar incidentes         | C  | A  | I  | C   | C   | C  | R   | R   |

---

## 4. Principios

Cada actividad debe tener:

* Al menos un Responsible.
* Un Accountable claramente identificado.
* Los Consulted necesarios.
* Los Informed necesarios.

Se debe evitar asignar demasiados Accountable a una misma actividad.

---

## 5. Responsabilidad de QA

QA es responsable de proporcionar información objetiva sobre calidad.

QA no debe decidir unilateralmente si el negocio realiza un release.

El flujo esperado es:

QA Evidence
     ↓
QA Recommendation
     ↓
Risk Evaluation
     ↓
Business / Release Decision

---

## 6. Actualización

La RACI Matrix deberá actualizarse cuando:

* Cambien los roles.
* Cambie el alcance.
* Se agreguen nuevas fases.
* Cambie el proceso de release.
* Se incorporen nuevos equipos o proveedores.
