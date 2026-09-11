# Risk Register — QA E-Commerce Platform

## 1. Propósito

Este documento identifica, analiza y controla los principales riesgos que pueden afectar la calidad, alcance, cronograma y entrega del proyecto QA E-Commerce Platform.

---

## 2. Escala de probabilidad

| Valor | Nivel    |
| ----: | -------- |
|     1 | Muy baja |
|     2 | Baja     |
|     3 | Media    |
|     4 | Alta     |
|     5 | Muy alta |

---

## 3. Escala de impacto

| Valor | Nivel    |
| ----: | -------- |
|     1 | Muy bajo |
|     2 | Bajo     |
|     3 | Medio    |
|     4 | Alto     |
|     5 | Crítico  |

---

## 4. Cálculo

Risk Score = Probability × Impact

Clasificación:

| Score | Nivel   |
| ----: | ------- |
|   1–5 | Bajo    |
|  6–10 | Medio   |
| 11–15 | Alto    |
| 16–25 | Crítico |

---

## 5. Registro de riesgos

| ID       | Riesgo                           | Prob. | Impacto | Score | Nivel   | Mitigación                                |
| -------- | -------------------------------- | ----: | ------: | ----: | ------- | ----------------------------------------- |
| RISK-001 | Requisitos incompletos           |     4 |       4 |    16 | Crítico | Requirements Review y Requirement Gaps    |
| RISK-002 | Acceptance Criteria ambiguos     |     4 |       4 |    16 | Crítico | Revisión con BA/PO                        |
| RISK-003 | Ambiente QA inestable            |     3 |       4 |    12 | Alto    | Environment Checklist y monitoreo         |
| RISK-004 | Test Data compartida             |     4 |       3 |    12 | Alto    | Data isolation                            |
| RISK-005 | Payment Sandbox no disponible    |     3 |       5 |    15 | Alto    | Mock/Sandbox alternativo                  |
| RISK-006 | Baja cobertura de automatización |     3 |       4 |    12 | Alto    | Automation Roadmap                        |
| RISK-007 | Flaky Tests                      |     3 |       3 |     9 | Medio   | Wait strategy y análisis de causa         |
| RISK-008 | Defectos encontrados tarde       |     3 |       5 |    15 | Alto    | Shift Left y API Testing                  |
| RISK-009 | Duplicación de pagos             |     2 |       5 |    10 | Medio   | Idempotency Testing                       |
| RISK-010 | Orden no persistida              |     2 |       5 |    10 | Medio   | Database Validation                       |
| RISK-011 | Datos inconsistentes UI/API/DB   |     3 |       5 |    15 | Alto    | Cross-layer validation                    |
| RISK-012 | Cambios tardíos de alcance       |     4 |       4 |    16 | Crítico | Change Management                         |
| RISK-013 | Secrets almacenados en Git       |     2 |       5 |    10 | Medio   | Environment Variables / Secret Management |
| RISK-014 | Regression insuficiente          |     3 |       5 |    15 | Alto    | Risk-Based Regression                     |
| RISK-015 | Defectos críticos en producción  |     2 |       5 |    10 | Medio   | Quality Gates + Production Smoke          |

---

## 6. Riesgos funcionales críticos

Las áreas con mayor impacto de negocio son:

Authentication
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
Notification

Payment y Order requieren especial atención debido al posible impacto financiero y de integridad de datos.

---

## 7. Estrategias de respuesta

### Mitigar

Reducir la probabilidad o impacto.

### Evitar

Modificar el enfoque para eliminar el riesgo.

### Transferir

Asignar parte del riesgo a un proveedor o servicio.

### Aceptar

Aceptar conscientemente el riesgo y documentar su impacto.

---

## 8. Riesgo residual

Después de aplicar mitigaciones puede continuar existiendo riesgo.

Este riesgo se denomina:

Residual Risk

Debe ser comunicado antes de una decisión de release.

---

## 9. Escalación

Los riesgos Critical o de alto impacto deben comunicarse al:

QA Lead
   ↓
Project Manager
   ↓
Product Owner
   ↓
Stakeholders correspondientes

---

## 10. Revisión

El Risk Register debe revisarse:

* Durante planificación.
* Cuando cambien requisitos.
* Cuando aparezcan defectos críticos.
* Antes de Regression.
* Antes del Release.
* Después de incidentes de producción.

---

## 11. Relación con QA

Los riesgos deben influir directamente en:

* Prioridad de Test Cases.
* Regression Scope.
* Automation Priority.
* Performance Testing.
* Security Testing.
* Quality Gates.
* Release Recommendation.

---

## 12. Principio

Mayor riesgo
    ↓
Mayor profundidad de pruebas
    ↓
Mayor prioridad de automatización

Esto constituye la base del enfoque de **Risk-Based Testing**.
