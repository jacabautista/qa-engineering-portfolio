# Casos de Prueba — QA E-Commerce Platform

## 1. Propósito

Este documento contiene los Test Cases principales del proyecto QA E-Commerce Platform.

Cada Test Case debe ser trazable hacia requisitos, Acceptance Criteria y Test Scenarios.

Formato utilizado:

* ID
* Título
* Requirement
* Acceptance Criteria
* Test Scenario
* Prioridad
* Tipo
* Automation Candidate
* Preconditions
* Test Data
* Steps
* Expected Result
* Execution Status
* Automation Status

---

# Authentication

## TC-001 — Login exitoso

**Requirement:** FR-001
**Acceptance Criteria:** AC-001
**Test Scenario:** TS-001
**Prioridad:** Critical
**Tipo:** Positive
**Automation Candidate:** Yes

### Preconditions

* Usuario existente.
* Cuenta activa.
* Credenciales válidas.

### Test Data

* Username válido.
* Password válido.

### Steps

1. Acceder a Login.
2. Ingresar Username válido.
3. Ingresar Password válido.
4. Ejecutar Login.

### Expected Result

* El usuario es autenticado correctamente.
* Se crea una sesión válida.
* El usuario puede acceder al área autorizada.

**Execution Status:** Not Executed
**Automation Status:** Not Automated

---

## TC-002 — Login con contraseña inválida

**Requirement:** FR-001
**Acceptance Criteria:** AC-002
**Test Scenario:** TS-002
**Prioridad:** High
**Tipo:** Negative
**Automation Candidate:** Yes

### Preconditions

* Usuario existente.

### Steps

1. Ingresar Username válido.
2. Ingresar Password inválido.
3. Ejecutar Login.

### Expected Result

* Authentication es rechazada.
* No se crea una sesión válida.
* Se presenta el comportamiento de error definido.

**Execution Status:** Not Executed
**Automation Status:** Not Automated

---

## TC-003 — Login con usuario inexistente

**Requirement:** FR-001
**Acceptance Criteria:** AC-003
**Test Scenario:** TS-003
**Prioridad:** High
**Tipo:** Negative
**Automation Candidate:** Yes

### Steps

1. Ingresar Username inexistente.
2. Ingresar cualquier Password.
3. Ejecutar Login.

### Expected Result

* Authentication es rechazada.
* No se crea una sesión válida.

**Execution Status:** Not Executed
**Automation Status:** Not Automated

---

## TC-004 — Username vacío

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Test Scenario:** TS-004
**Prioridad:** High
**Tipo:** Negative
**Automation Candidate:** Yes

### Steps

1. Dejar Username vacío.
2. Ingresar Password.
3. Ejecutar Login.

### Expected Result

* El sistema no debe autenticar al usuario.
* Se debe aplicar la validación correspondiente al campo requerido.

**Execution Status:** Not Executed
**Automation Status:** Not Automated

---

## TC-005 — Password vacío

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Test Scenario:** TS-004
**Prioridad:** High
**Tipo:** Negative
**Automation Candidate:** Yes

### Steps

1. Ingresar Username.
2. Dejar Password vacío.
3. Ejecutar Login.

### Expected Result

* El sistema no debe autenticar al usuario.
* Se debe aplicar la validación correspondiente.

**Execution Status:** Not Executed
**Automation Status:** Not Automated

---

## TC-006 — Username y Password vacíos

**Requirement:** FR-001
**Acceptance Criteria:** AC-004
**Test Scenario:** TS-004
**Prioridad:** High
**Tipo:** Negative
**Automation Candidate:** Yes

### Expected Result

* Login no debe completarse.
* Las validaciones requeridas deben aplicarse.

**Execution Status:** Not Executed
**Automation Status:** Not Automated

---

# Catalog y Product

## TC-007 — Mostrar productos disponibles

**Requirement:** FR-002
**Acceptance Criteria:** AC-005
**Test Scenario:** TS-005
**Prioridad:** High
**Tipo:** Functional
**Automation Candidate:** Yes

### Expected Result

* El catálogo muestra productos disponibles.
* La información básica corresponde a cada producto.

---

## TC-008 — Seleccionar producto

**Requirement:** FR-002
**Acceptance Criteria:** AC-006
**Test Scenario:** TS-006
**Prioridad:** High
**Automation Candidate:** Yes

### Expected Result

* El usuario puede seleccionar un producto.
* Se accede al Product Detail correcto.

---

## TC-009 — Mostrar información del producto

**Requirement:** FR-003
**Acceptance Criteria:** AC-007
**Test Scenario:** TS-007
**Prioridad:** High
**Automation Candidate:** Yes

### Expected Result

* La información corresponde al producto seleccionado.

---

## TC-010 — Agregar producto disponible al carrito

**Requirement:** FR-003
**Acceptance Criteria:** AC-008
**Test Scenario:** TS-008
**Prioridad:** High
**Automation Candidate:** Yes

### Expected Result

* El producto correcto es agregado al carrito.

---

# Shopping Cart

## TC-011 — Agregar producto al carrito

**Requirement:** FR-004
**Acceptance Criteria:** AC-009
**Test Scenario:** TS-009
**Prioridad:** Critical
**Automation Candidate:** Yes

### Expected Result

* El carrito contiene el producto seleccionado.
* Precio y cantidad inicial son consistentes.

---

## TC-012 — Actualizar cantidad válida de 1 a 2

**Requirement:** FR-004
**Acceptance Criteria:** AC-010
**Test Scenario:** TS-010
**Prioridad:** High
**Tipo:** Positive / Boundary-related
**Automation Candidate:** Yes

### Test Data

Initial Quantity = 1
New Quantity = 2

### Expected Result

* La cantidad se actualiza a `2`.
* El total se recalcula correctamente.

---

## TC-013 — Actualizar cantidad a 0

**Requirement:** FR-004
**Test Scenario:** TS-024
**Prioridad:** High
**Tipo:** Boundary / Requirement Gap
**Automation Candidate:** Pending clarification

### Test Data

Quantity = 0

### Expected Result

El comportamiento exacto debe definirse con Product Owner / BA.

QA no debe asumir si:

* Se elimina el producto.
* Se rechaza el valor.
* Se muestra un error.

**Status de diseño:** Requirement Gap.

---

## TC-014 — Cantidad negativa

**Requirement:** FR-004
**Test Scenario:** TS-024
**Prioridad:** High
**Tipo:** Negative / Boundary
**Automation Candidate:** Yes

### Test Data

Quantity = -1

### Expected Result

* El sistema no debe aceptar una cantidad negativa.
* El carrito no debe quedar en un estado inconsistente.

---

## TC-015 — Cantidad mínima válida

**Requirement:** FR-004
**Acceptance Criteria:** AC-010
**Test Scenario:** TS-010
**Prioridad:** High
**Tipo:** Boundary
**Automation Candidate:** Yes

### Test Data

Quantity = 1

### Expected Result

* La cantidad `1` es aceptada como valor válido mínimo conocido.

---

## TC-016 — Eliminar producto

**Requirement:** FR-004
**Acceptance Criteria:** AC-011
**Test Scenario:** TS-011
**Prioridad:** High
**Automation Candidate:** Yes

### Expected Result

* El producto deja de aparecer en el carrito.
* El total es recalculado.

---

## TC-017 — Calcular total de un producto

**Requirement:** FR-004
**Acceptance Criteria:** AC-012
**Test Scenario:** TS-012
**Prioridad:** Critical
**Automation Candidate:** Yes

### Test Data

Product Price = 100
Quantity = 2

### Expected Result

Total = 200

---

## TC-018 — Recalcular total después de actualizar cantidad

**Requirement:** FR-004
**Acceptance Criteria:** AC-010, AC-012
**Test Scenario:** TS-025
**Prioridad:** Critical
**Automation Candidate:** Yes

### Test Data

Product Price = 100
Initial Quantity = 1
Updated Quantity = 3

### Expected Result

Initial Total = 100
Updated Total = 300

---

## TC-019 — Recalcular total después de eliminar producto

**Requirement:** FR-004
**Acceptance Criteria:** AC-011, AC-012
**Test Scenario:** TS-025
**Prioridad:** Critical
**Automation Candidate:** Yes

### Test Data

Product A = 100
Product B = 50
Initial Total = 150

### Action

Eliminar Product B.

### Expected Result

Updated Total = 100

---

# Checkout

## TC-020 — Checkout válido

**Requirement:** FR-005
**Acceptance Criteria:** AC-014
**Test Scenario:** TS-014
**Prioridad:** Critical
**Automation Candidate:** Yes

### Preconditions

* Carrito con al menos un producto.
* Customer Data válida.
* Shipping Data válida.

### Expected Result

* Checkout permite avanzar a Payment.

---

## TC-021 — Customer Information faltante

**Requirement:** FR-005
**Acceptance Criteria:** AC-013, AC-015
**Test Scenario:** TS-013, TS-015
**Prioridad:** High
**Tipo:** Negative

### Expected Result

* Checkout no debe continuar correctamente.

---

## TC-022 — Shipping Information faltante

**Requirement:** FR-005
**Acceptance Criteria:** AC-013, AC-015
**Prioridad:** High
**Tipo:** Negative

### Expected Result

* Checkout no debe continuar correctamente.

---

## TC-023 — Customer Information inválida

**Requirement:** FR-005
**Acceptance Criteria:** AC-015
**Prioridad:** High
**Tipo:** Negative

### Expected Result

* Los datos inválidos son rechazados según la regla definida.

---

## TC-024 — Shipping Information inválida

**Requirement:** FR-005
**Acceptance Criteria:** AC-015
**Prioridad:** High
**Tipo:** Negative

### Expected Result

* Checkout no debe avanzar correctamente.

---

## TC-025 — Checkout con carrito vacío

**Requirement:** FR-005
**Test Scenario:** TS-015
**Prioridad:** Critical
**Tipo:** Negative

### Expected Result

* El usuario no debe completar correctamente Checkout con un carrito vacío.

---

# Payment

## TC-026 — Pago exitoso

**Requirement:** FR-006
**Acceptance Criteria:** AC-016
**Test Scenario:** TS-016
**Prioridad:** Critical
**Automation Candidate:** Yes

### Test Data

Payment response aprobado.

### Expected Result

* Payment queda en estado exitoso.
* El proceso puede continuar hacia Order Creation.

---

## TC-027 — Pago rechazado

**Requirement:** FR-006
**Acceptance Criteria:** AC-017
**Test Scenario:** TS-017
**Prioridad:** Critical
**Automation Candidate:** Yes

### Test Data

Payment response rechazado.

### Expected Result

* Payment no es considerado exitoso.
* El sistema debe reflejar el fallo.

---

## TC-028 — Pago fallido no crea orden exitosa

**Requirement:** FR-006, FR-007
**Acceptance Criteria:** AC-017
**Test Scenario:** TS-026
**Prioridad:** Critical
**Tipo:** Integration / Negative
**Automation Candidate:** Yes

### Expected Result

Failed Payment
      ↓
No Successful Order

---

# Order

## TC-029 — Crear Order después de pago exitoso

**Requirement:** FR-007
**Acceptance Criteria:** AC-018
**Test Scenario:** TS-018
**Prioridad:** Critical
**Automation Candidate:** Yes

### Expected Result

* Se crea una Order asociada a la transacción correcta.

---

## TC-030 — Validar información de Order

**Requirement:** FR-007
**Acceptance Criteria:** AC-019
**Test Scenario:** TS-019
**Prioridad:** Critical

### Expected Result

La información debe coincidir con:

* Customer.
* Products.
* Quantities.
* Prices.
* Total.
* Payment result.

---

## TC-031 — Persistir Order en Database

**Requirement:** FR-007
**Acceptance Criteria:** AC-020
**Test Scenario:** TS-020
**Prioridad:** Critical
**Tipo:** Database / Integration

### Expected Result

* La Order esperada existe en Database.
* Los datos persistidos son consistentes.

---

## TC-032 — Validar integridad de datos de Order

**Requirement:** FR-007
**Test Scenario:** TS-027
**Prioridad:** Critical
**Tipo:** Integration / Database

### Expected Result

Los valores deben ser consistentes entre:

Checkout
   ↓
Payment
   ↓
Order
   ↓
Database

---

# Email Notification

## TC-033 — Confirmación después de Order exitosa

**Requirement:** FR-008
**Acceptance Criteria:** AC-021
**Test Scenario:** TS-021
**Prioridad:** High

### Expected Result

* Se genera la notificación correspondiente a la Order exitosa.

---

## TC-034 — No enviar confirmación después de Failed Payment

**Requirement:** FR-008
**Test Scenario:** TS-028
**Prioridad:** Critical
**Tipo:** Negative / Integration

### Expected Result

Failed Payment
      ↓
No Successful Order
      ↓
No Success Confirmation

---

## TC-035 — No enviar confirmación exitosa si falla Order Creation

**Requirement:** FR-007, FR-008
**Prioridad:** Critical
**Tipo:** Failure Path

### Expected Result

* No debe generarse una confirmación de compra exitosa si no existe una Order exitosa.

---

## TC-036 — Email coincide con la Order

**Requirement:** FR-008
**Acceptance Criteria:** AC-021
**Prioridad:** High
**Tipo:** Integration

### Expected Result

La información del email debe coincidir con la Order correcta.

---

# End-to-End

## TC-037 — Compra completa exitosa

**Prioridad:** Critical
**Tipo:** E2E
**Automation Candidate:** Yes

### Flow

Login
→ Catalog
→ Product
→ Cart
→ Checkout
→ Payment
→ Order
→ Database
→ Email

### Expected Result

Todas las capas mantienen un estado consistente y la compra termina correctamente.

---

## TC-038 — Failed Payment E2E

**Prioridad:** Critical
**Tipo:** E2E Negative

### Expected Result

Checkout Valid
      ↓
Payment Failed
      ↓
No Successful Order
      ↓
No Success Notification

---

## TC-039 — Persistence Failure E2E

**Prioridad:** Critical
**Tipo:** E2E / Failure Path

### Scenario

Payment = Successful
Order Creation = Successful
Persistence = Failed

### Expected Result

El comportamiento exacto requiere una regla de negocio/técnica definida.

Debe evaluarse:

* Transaction rollback.
* Reconciliation.
* Error handling.
* Monitoring.
* Retry behavior.

**Status:** Requirement Gap / Architecture Clarification Required.

---

## TC-040 — Duplicate Purchase Submission

**Prioridad:** Critical
**Tipo:** E2E / Idempotency
**Automation Candidate:** Yes, cuando exista contrato definido.

### Scenario

El mismo intento de compra es enviado más de una vez.

### Expected Result

No debe generarse una duplicación financiera o transaccional no deseada.

La regla exacta de idempotencia debe estar definida.

---

# Invariantes E2E

Los siguientes principios deberán mantenerse:

1. Valid Checkout es requerido antes de Payment.
2. Failed Payment no debe producir Successful Order.
3. Successful Payment debe producir el resultado de Order definido.
4. Successful Order debe persistirse.
5. Database debe ser consistente con la transacción.
6. Successful Order debe producir la notificación esperada.
7. Failed Transaction no debe producir Success Confirmation.
8. Duplicate Submission no debe producir duplicación no deseada.
9. Los totales deben ser consistentes entre Cart, Checkout, Order y Database.
10. El estado transaccional debe ser consistente entre las capas.

---

# Estado inicial

Total Test Cases = 40
Executed = 0
Passed = 0
Failed = 0
Blocked = 0
Automated = 0

Estos valores deberán actualizarse únicamente con evidencia real de ejecución.
