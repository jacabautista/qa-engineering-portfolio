# Quality Gates — QA E-Commerce Platform

## 1. Propósito

Este documento define los **Quality Gates** utilizados para determinar si el producto puede avanzar de una etapa del ciclo de entrega a la siguiente.

Un Quality Gate representa un conjunto de condiciones mínimas de calidad que deben cumplirse antes de continuar.

---

## 2. Principio

El avance entre etapas no debe depender únicamente de fechas o de que el desarrollo haya finalizado.

Debe existir evidencia suficiente de calidad.

Build
  ↓
QA Entry Gate
  ↓
Testing
  ↓
Regression Gate
  ↓
Release Gate
  ↓
Deployment
  ↓
Production Gate

---

# Gate 1 — QA Entry Gate

## Objetivo

Determinar si el sistema está preparado para comenzar formalmente las pruebas.

## Criterios

* Build desplegado.
* Ambiente disponible.
* Requisitos disponibles.
* Acceptance Criteria definidos.
* Test Data disponible.
* Dependencias críticas disponibles.
* Configuración necesaria completada.

## Resultado

PASS → iniciar ejecución QA

FAIL → no iniciar / registrar Blocked

---

# Gate 2 — Regression Gate

## Objetivo

Determinar si el producto cumple las condiciones necesarias para finalizar la regresión.

## Criterios

* Casos críticos ejecutados.
* Critical Tests aprobados.
* No existen defectos Critical sin resolver.
* Defectos High evaluados.
* API Tests ejecutados.
* Automated Regression ejecutada cuando esté disponible.
* Riesgos conocidos documentados.

## Resultado

PASS → avanzar hacia Release Validation

FAIL → continuar corrección y Regression

---

# Gate 3 — Release Gate

## Objetivo

Determinar si existe evidencia suficiente para considerar el producto candidato a release.

## Criterios

* Regression completada.
* Resultados documentados.
* Defectos abiertos conocidos.
* Riesgos residuales documentados.
* Release Documentation completada.
* QA Recommendation emitida.

La recomendación de QA puede ser:

GO

GO WITH ACCEPTED RISK

NO-GO

QA proporciona una recomendación basada en evidencia.

La decisión final de negocio corresponde a los stakeholders autorizados.

---

# Gate 4 — Production Gate

## Objetivo

Validar que el deployment fue realizado correctamente y que las funciones críticas se encuentran disponibles.

## Criterios

* Deployment exitoso.
* Aplicación disponible.
* Production Smoke Tests aprobados.
* APIs críticas disponibles.
* No se detectaron incidentes Critical.
* Monitoring disponible.

## Resultado

PASS → Release estable

FAIL → Incident / Rollback Evaluation

---

## 3. Gestión de excepciones

Un Quality Gate no debe ignorarse silenciosamente.

Cuando un criterio no se cumple pero el negocio desea continuar, deberá documentarse:

* Criterio incumplido.
* Riesgo.
* Impacto.
* Mitigación.
* Responsable de aceptación.
* Decisión.

Esto puede producir:

GO WITH ACCEPTED RISK

---

## 4. Evidencia

Los Quality Gates pueden utilizar evidencia proveniente de:

* Test Execution Reports.
* Automated Test Reports.
* API Reports.
* Defect Reports.
* CI/CD Pipeline.
* Logs.
* Monitoring.
* Regression Report.
* Risk Register.

---

## 5. Métricas relacionadas

Los Quality Gates podrán considerar:

* Test Execution Coverage.
* Pass Rate.
* Failure Rate.
* Blocked Rate.
* Critical Defects.
* High Defects.
* Automation Coverage.
* Regression Coverage.
* Defect Leakage.
* Escaped Defects.

---

## 6. Responsabilidades

### QA Engineer

* Ejecutar pruebas.
* Registrar evidencia.
* Reportar defectos.
* Identificar riesgos.

### QA Lead

* Evaluar resultados.
* Evaluar Quality Gates.
* Comunicar riesgo residual.
* Emitir QA Recommendation.

### Product Owner / Project Manager

* Evaluar impacto de negocio.
* Participar en decisiones de release.

### DevOps

* Garantizar disponibilidad de deployment, ambientes y pipeline.

---

## 7. Principio de calidad

Deployment exitoso
        ≠
Release exitoso

Un deployment puede finalizar técnicamente sin errores y aun así contener problemas funcionales.

Por ello:

Deployment
    ↓
Production Smoke
    ↓
Monitoring
    ↓
Release Validation
