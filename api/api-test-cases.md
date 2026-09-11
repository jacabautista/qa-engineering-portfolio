# Casos de Prueba API — QA E-Commerce Platform

## 1. Propósito

Este documento define los Test Cases principales para validar las APIs del proyecto **QA E-Commerce Platform**.

La validación API busca comprobar no solo que una respuesta técnica sea recibida, sino que la respuesta sea correcta desde el punto de vista funcional y de negocio.

---

## 2. Objetivos

API Testing debe permitir validar:

* HTTP Methods.
* Status Codes.
* Headers.
* Request Body.
* Response Body.
* JSON.
* Authentication.
* Authorization.
* Business Rules.
* Error Handling.
* Negative Scenarios.
* Data Consistency.
* Integration behavior.

---

## 3. Principio de validación API

Una validación completa no debe limitarse a:

text
HTTP 200

El enfoque debe ser:

text
Status Code
    +
Headers
    +
Schema
    +
Values
    +
Business Rules

Por ejemplo:

text
GET /products/1001

podría responder:

json
{
  "id": 1002,
  "name": "Product A"
}

aunque el `Status Code` sea `200`, el test debe fallar porque el recurso retornado no corresponde al solicitado.

---

# API-TC-001 — Login exitoso

**Requirement:** FR-001
**Acceptance Criteria:** AC-001
**Related Test Case:** TC-001
**Prioridad:** Critical
**Tipo:** Positive / Authentication

## Objetivo

Validar que un usuario válido pueda autenticarse mediante API.

## Request conceptual

http
POST /login
Content-Type: application/json

Ejemplo:

json
{
  "username": "valid_user",
  "password": "valid_password"
}

## Validaciones

Validar:

* Status Code correspondiente al contrato API.
* `Content-Type`.
* Response Body.
* Authentication result.
* Token o sesión cuando corresponda.
* Ausencia de información sensible innecesaria.

## Expected Result

* Authentication exitosa.
* Respuesta consistente con el contrato definido.
* El usuario puede obtener la información necesaria para continuar autenticado.

---

# API-TC-002 — Login con Password inválido

**Requirement:** FR-001
**Acceptance Criteria:** AC-002
**Related Test Case:** TC-002
**Prioridad:** High
**Tipo:** Negative

## Request conceptual

http
POST /login
Content-Type: application/json

json
{
  "username": "valid_user",
  "password": "wrong_password"
}

## Validaciones

* Authentication debe ser rechazada.
* No debe entregarse una sesión válida.
* No debe generarse un token válido.
* El Status Code debe corresponder al contrato definido.
* El error debe utilizar el modelo de errores definido por la API.

---

# API-TC-003 — Username faltante

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Related Test Case:** TC-004
**Prioridad:** High
**Tipo:** Negative / Validation

## Request

json
{
  "password": "some_password"
}

## Expected Result

* Request inválido según el contrato API.
* Authentication no debe completarse.
* Debe aplicarse la validación de campo requerido.
* El Status Code debe coincidir con la especificación API.

QA no debe asumir automáticamente `400` o `422` si el contrato no lo define.

---

# API-TC-004 — Password faltante

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Related Test Case:** TC-005
**Prioridad:** High
**Tipo:** Negative / Validation

## Request

json
{
  "username": "valid_user"
}

## Expected Result

* Authentication no debe completarse.
* Debe existir una respuesta de validación consistente.
* El Status Code deberá validarse contra la especificación.

---

# API-TC-005 — Obtener catálogo de productos

**Requirement:** FR-002
**Acceptance Criteria:** AC-005
**Related Test Case:** TC-007
**Prioridad:** High
**Tipo:** GET / Functional

## Request conceptual

http
GET /products
Accept: application/json

## Validaciones

* Status Code esperado.
* `Content-Type`.
* Response Body no inválido.
* Estructura JSON.
* Productos disponibles.
* Campos obligatorios.
* Tipos de datos.
* Reglas de negocio aplicables.

Ejemplo conceptual:

json
[
  {
    "id": 1001,
    "name": "Product A",
    "price": 100,
    "stock": 10
  }
]

## Expected Result

* Se obtiene el catálogo esperado.
* Los registros cumplen el contrato API.
* Los valores son consistentes con las reglas de negocio.

---

# API-TC-006 — Obtener producto existente

**Requirement:** FR-003
**Acceptance Criteria:** AC-007
**Related Test Case:** TC-009
**Prioridad:** High
**Tipo:** GET / Functional

## Request conceptual

http
GET /products/1001

## Expected Result

El Response debe corresponder específicamente al producto solicitado.

Ejemplo conceptual:

json
{
  "id": 1001,
  "name": "Product A",
  "price": 100,
  "stock": 10
}

## Validaciones

text
requestedId == response.id

además de:

* Status Code.
* Headers.
* JSON Schema.
* Required Fields.
* Data Types.
* Business Values.

---

# API-TC-007 — Obtener producto inexistente

**Requirement:** FR-003
**Prioridad:** High
**Tipo:** Negative / GET

## Request conceptual

http
GET /products/999999

## Expected Result

La API debe responder de acuerdo con el contrato definido para un recurso inexistente.

Validar:

* Status Code.
* Error Body.
* Error Schema.
* Error Message.
* No retornar un producto diferente.
* No producir un error interno inesperado.

## Nota

No se debe asumir automáticamente:

text
404

hasta confirmar que ese es el comportamiento definido por la API.

---

# API-TC-008 — Agregar producto válido al carrito

**Requirement:** FR-004
**Acceptance Criteria:** AC-009
**Related Test Case:** TC-011
**Prioridad:** Critical
**Tipo:** POST / Functional

## Request conceptual

http
POST /cart
Content-Type: application/json

json
{
  "productId": 1001,
  "quantity": 1
}

## Expected Result

* El producto correcto es agregado al carrito.
* La cantidad es correcta.
* El precio utilizado es consistente.
* El Response corresponde al carrito esperado.

## Validaciones

* Status Code.
* Headers.
* Response Schema.
* Product ID.
* Quantity.
* Price.
* Cart totals cuando correspondan.

---

# API-TC-009 — Agregar cantidad negativa

**Requirement:** FR-004
**Related Test Cases:** TC-013, TC-014
**Related Scenario:** TS-024
**Prioridad:** High
**Tipo:** POST / Negative / Boundary

## Request conceptual

http
POST /cart
Content-Type: application/json

json
{
  "productId": 1001,
  "quantity": -1
}

## Expected Result

La API no debe aceptar una cantidad negativa como una cantidad válida de compra.

Validar:

* Request rechazado según contrato.
* No se crea un estado inválido del carrito.
* Error Response consistente.
* Status Code correspondiente a la especificación.

---

# 4. Casos API futuros

Conforme se avance en el proyecto se deberán incorporar casos para:

```text
POST   /login
GET    /products
GET    /products/{id}
POST   /cart
PUT    /cart/{id}
DELETE /cart/{id}
POST   /checkout
POST   /payments
POST   /orders
GET    /orders/{id}

Los nombres exactos de endpoints deberán obtenerse del contrato real de la API.

---

# 5. Métodos HTTP

## GET

Utilizado principalmente para consultar recursos.

Ejemplo:

http
GET /products

---

## POST

Utilizado normalmente para crear recursos o iniciar operaciones.

Ejemplo:

http
POST /orders

---

## PUT

Normalmente representa una actualización completa de un recurso.

Ejemplo:

http
PUT /cart/1001

---

## PATCH

Normalmente representa una actualización parcial.

Ejemplo:

http
PATCH /orders/1001

---

## DELETE

Utilizado para eliminar un recurso cuando el contrato lo permite.

Ejemplo:

http
DELETE /cart/1001

---

# 6. Status Codes

Algunos códigos comunes que deberán conocerse son:

| Status Code | Significado general   |
| ----------: | --------------------- |
|         200 | OK                    |
|         201 | Created               |
|         204 | No Content            |
|         400 | Bad Request           |
|         401 | Unauthorized          |
|         403 | Forbidden             |
|         404 | Not Found             |
|         409 | Conflict              |
|         422 | Unprocessable Content |
|         500 | Internal Server Error |
|         502 | Bad Gateway           |
|         503 | Service Unavailable   |

Estos códigos son referencias HTTP generales.

El Expected Result de cada Test Case debe basarse en el contrato específico de la API.

---

# 7. Headers

Headers comunes:

http
Content-Type: application/json
Accept: application/json
Authorization: Bearer <token>

QA puede validar:

* Header presente.
* Valor correcto.
* Authentication behavior.
* Content negotiation.
* Correlation ID cuando exista.

---

# 8. Authentication

Cuando se utilice un token:

http
Authorization: Bearer <token>

Nunca guardar un token real directamente en Git.

Ejemplo utilizando variable:

bash
export TOKEN="..."

Luego:

bash
curl -H "Authorization: Bearer $TOKEN" ...

---

# 9. JSON Validation

No basta con verificar que exista un JSON.

Se debe validar:

Structure
Data Types
Required Fields
Values
Relationships
Business Rules

Por ejemplo:

json
{
  "id": 1001,
  "price": 100,
  "stock": 10
}

Validaciones posibles:

id is not null
id is numeric
price >= 0
stock >= 0
requested id == returned id

Siempre que esas reglas estén definidas.

---

# 10. Negative Testing

Las APIs deberán evaluarse también con:

* Missing Fields.
* Invalid Data Types.
* Invalid IDs.
* Unauthorized Requests.
* Invalid Tokens.
* Expired Tokens cuando corresponda.
* Invalid Quantities.
* Duplicate Requests.
* Invalid State Transitions.

---

# 11. Business Rule Validation

Ejemplo:

Failed Payment
      ↓
No Successful Order

El API Test debe validar no solo la respuesta de Payment, sino también el impacto sobre Order cuando sea posible.

---

# 12. Data Consistency

Las pruebas futuras podrán validar:

API Request
     ↓
API Response
     ↓
Database

Ejemplo:

POST /orders
      ↓
orderId = 5001
      ↓
Database record ID = 5001

---

# 13. Response Time

El Response Time puede medirse, pero no debe declararse como Failed usando un límite inventado.

Ejemplo:

Response Time = 450 ms

Para afirmar:

Expected < 500 ms

debe existir un Performance Requirement definido.

---

# 14. API Contract Gaps

Antes de construir cobertura completa, aún se requiere conocer:

* Base URL.
* API Version.
* Exact Endpoint Paths.
* Authentication mechanism.
* Request Schemas.
* Response Schemas.
* Required Headers.
* Expected Success Status Codes.
* Validation Status Codes.
* Error Model.
* Pagination.
* Rate Limits.
* Timeout behavior.
* Retry behavior.
* Idempotency.
* Correlation IDs.
* Backward Compatibility Policy.

Estos puntos deben tratarse como:

API Contract Gaps

y no como supuestos.

---

# 15. Herramientas

La progresión prevista es:

curl
  ↓
Postman
  ↓
Collections
  ↓
Assertions
  ↓
Newman
  ↓
Automation
  ↓
GitHub Actions

---

# 16. Evidencia

Durante ejecución real se deberá registrar:

* Request.
* Response.
* Status Code.
* Headers relevantes.
* Test Result.
* Environment.
* Date/Time.
* Defect ID cuando aplique.

---

# 17. Estado actual

Actualmente este documento representa **API Test Design**.

No significa que los Test Cases hayan sido ejecutados.

API Test Cases Designed = 9
API Test Cases Executed = 0
Passed = 0
Failed = 0
Blocked = 0

Estos valores deberán cambiar únicamente con resultados reales.

---

# 18. Principio de QA

No debemos concluir:

HTTP 200 = Test Passed

Debemos evaluar:

HTTP Response
      +
Contract
      +
Data
      +
Business Rule
      =
Test Result
