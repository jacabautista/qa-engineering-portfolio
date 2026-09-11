# Project Scope — QA E-Commerce Platform

## 1. Propósito

Este documento define el alcance del proyecto QA E-Commerce Platform.

Su objetivo es establecer claramente qué actividades y funcionalidades forman parte del proyecto y cuáles quedan fuera del alcance actual.

---

## 2. Objetivo del alcance

Validar la calidad de una plataforma de comercio electrónico mediante prácticas de Quality Engineering que cubran requisitos, funcionalidad, APIs, Database, automatización, CI/CD, Regression y Release Validation.

---

## 3. Funcionalidades In Scope

### Authentication

* Registro cuando corresponda.
* Login.
* Validación de credenciales.
* Manejo de errores.
* Control de acceso.

### Product Catalog

* Visualización de productos.
* Disponibilidad.
* Selección.

### Product Details

* Nombre.
* Precio.
* Información.
* Disponibilidad.
* Adición al carrito.

### Shopping Cart

* Agregar productos.
* Modificar cantidad.
* Eliminar productos.
* Recalcular total.
* Validar cantidades inválidas.

### Checkout

* Información del cliente.
* Información de envío.
* Campos requeridos.
* Validaciones.

### Payment

* Pago aprobado.
* Pago rechazado.
* Manejo de errores.
* Integración con Order.
* Prevención de resultados inconsistentes.

### Order

* Creación.
* Información.
* Persistencia.
* Integridad de datos.

### Email Notification

* Confirmación de orden.
* Consistencia de información.
* No enviar confirmación exitosa cuando la transacción falla.

---

## 4. Actividades QA In Scope

### Requirements

* Requirements Analysis.
* Acceptance Criteria Review.
* Requirement Gap identification.
* Requirements Traceability.

### Functional Testing

* Positive Testing.
* Negative Testing.
* Boundary Value Analysis.
* Equivalence Partitioning.
* Decision Tables.
* Exploratory Testing.

### API Testing

* REST APIs.
* HTTP Methods.
* Request/Response.
* Status Codes.
* Headers.
* Authentication.
* JSON.
* Error Handling.
* Negative Testing.

### Database Testing

* CRUD.
* Persistence.
* Relationships.
* Referential Integrity.
* Order Data.
* UI/API/Database consistency.

### Automation

* Web Automation.
* API Automation.
* Regression Automation.
* Smoke Automation.
* Data-Driven Testing.

### CI/CD

* Automated Test Execution.
* Quality Gates.
* Reports.
* Artifacts.
* Secrets Management.

### Release

* Regression.
* Release Checklist.
* QA Recommendation.
* Production Smoke.

---

## 5. Out of Scope actual

Mientras no exista una necesidad específica, quedan fuera:

* Desarrollo funcional de la plataforma.
* Transacciones financieras reales.
* Full Penetration Testing.
* Hardware Testing.
* Procesos externos no relacionados.
* Pruebas destructivas en Production.
* Uso de datos personales reales.

---

## 6. Restricciones

El proyecto puede depender de:

* APIs públicas o ambientes de laboratorio.
* Payment Sandbox o mocks.
* Disponibilidad de infraestructura.
* Herramientas gratuitas o de aprendizaje.
* Datos sintéticos.

---

## 7. Supuestos

Se asume que:

* Los requisitos serán refinados progresivamente.
* QA tendrá acceso a ambientes necesarios.
* Los datos utilizados serán sintéticos.
* Las APIs dispondrán de documentación suficiente.
* Los cambios de alcance serán documentados.

---

## 8. Control del alcance

Las nuevas funcionalidades no deberán incorporarse silenciosamente.

Se utilizará:

Change Request
     ↓
Impact Analysis
     ↓
Approval
     ↓
Scope Update
     ↓
Requirements Update
     ↓
Test Impact

El proceso completo está definido en:

`management/change-management.md`

---

## 9. Criterio de aceptación del alcance

El alcance se considera suficientemente definido cuando:

* Las funcionalidades principales están identificadas.
* Las actividades QA están identificadas.
* Las exclusiones son conocidas.
* Las restricciones están documentadas.
* Existe un mecanismo de Change Management.
