# Estrategia de Ambientes — QA E-Commerce Platform

## 1. Propósito

Este documento define cómo serán utilizados los diferentes ambientes durante el ciclo de desarrollo, testing, release y producción.

---

## 2. Modelo de ambientes

Local
  ↓
Development
  ↓
QA
  ↓
Staging
  ↓
Production

Cada ambiente tiene un propósito diferente.

---

## 3. Local

### Propósito

Permitir desarrollo y validaciones técnicas rápidas.

### Usos

* Unit Tests.
* Component Testing.
* Development Debugging.
* Automation Development.
* Local API Testing cuando sea posible.

### Restricciones

No debe considerarse equivalente a Production.

---

## 4. Development

### Propósito

Integración inicial de cambios desarrollados.

### Usos

* Developer Testing.
* Integration checks.
* Early API Validation.
* Early QA collaboration.

### Riesgos

* Cambios frecuentes.
* Inestabilidad.
* Configuración no definitiva.

---

## 5. QA Environment

### Propósito

Ambiente principal para pruebas funcionales y técnicas controladas.

### Usos

* Functional Testing.
* Negative Testing.
* API Testing.
* Database Testing.
* Automation.
* Integration Testing.
* Controlled Test Data.
* Exploratory Testing.

### Características deseadas

* Datos controlados.
* Build identificado.
* Configuración conocida.
* Dependencias disponibles.
* Acceso a logs cuando sea apropiado.

---

## 6. Staging

### Propósito

Proporcionar un ambiente lo más cercano posible a Production antes del Release.

### Usos

* Release Regression.
* Integration Validation.
* Deployment Validation.
* Configuration Validation.
* Pre-production Smoke.
* Final Release Validation.

### Principio

Staging ≈ Production

pero no debe asumirse que son idénticos.

Las diferencias deberán ser conocidas.

---

## 7. Production

### Propósito

Ambiente real utilizado por usuarios.

### Testing permitido

Solo pruebas:

* Seguras.
* Controladas.
* No destructivas.
* Aprobadas.

Principalmente:

Production Smoke
Monitoring
Observability

---

## 8. Configuración por ambiente

La configuración no debe estar hardcoded dentro de los tests.

Variables previstas:

BASE_URL
API_URL
DB_HOST
DB_NAME
ENVIRONMENT
TEST_USERNAME
TEST_PASSWORD
PAYMENT_MODE

Ejemplo conceptual:

ENVIRONMENT=qa
BASE_URL=https://qa.example.com

---

## 9. Secrets

No almacenar directamente en Git:

Passwords
Tokens
API Keys
Private Keys
Database Credentials

Preferir:

* Environment Variables.
* CI/CD Secrets.
* Secret Management Services.

---

## 10. Environment Entry Checklist

Antes de iniciar Testing:

[ ] Build desplegado
[ ] Ambiente accesible
[ ] APIs disponibles
[ ] Database disponible
[ ] Test Data disponible
[ ] Dependencias disponibles
[ ] Payment Sandbox disponible
[ ] Configuración conocida
[ ] Logs accesibles cuando corresponda
[ ] Version del Build identificada

---

## 11. Build Identification

Cada ejecución importante debe poder relacionarse con:

* Build.
* Commit.
* Version.
* Environment.

Ejemplo:

Environment: QA
Build: 1.4.0-rc2
Commit: abc1234

---

## 12. Environment Issues

Si una prueba no puede ejecutarse por un problema del ambiente:

Test Status = Blocked

No marcar automáticamente:

Test Status = Failed

Ejemplo:

Payment Sandbox unavailable
        ↓
Payment Test cannot execute
        ↓
BLOCKED

---

## 13. Riesgos

| Riesgo                   | Mitigación               |
| ------------------------ | ------------------------ |
| Ambiente inestable       | Health Check             |
| Configuración incorrecta | Configuration Review     |
| Test Data corrupta       | Reset Strategy           |
| Shared Environment       | Coordinación / Isolation |
| Dependency outage        | Monitoring / Mock        |
| Environment Drift        | Configuration Management |

---

## 14. Environment Drift

Environment Drift ocurre cuando ambientes destinados a representar configuraciones similares terminan siendo diferentes.

Ejemplo:

QA      → API v2
Staging → API v3

Esto puede producir resultados engañosos.

Debe controlarse mediante:

* Versioning.
* Configuration Management.
* Deployment Automation.
* Environment Documentation.

---

## 15. Pipeline esperado

Developer
   ↓
Git
   ↓
Pull Request
   ↓
Build
   ↓
Automated Tests
   ↓
QA
   ↓
Staging
   ↓
Regression
   ↓
Release
   ↓
Production
   ↓
Smoke

---

## 16. Principio

Un test puede fallar por:

Product Defect
Test Defect
Test Data Issue
Environment Issue
Dependency Issue

QA debe analizar la causa antes de clasificar el resultado.
