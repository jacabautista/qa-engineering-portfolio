# Tablas de Decisión — QA E-Commerce Platform

## 1. Propósito

Este documento utiliza Decision Tables para validar combinaciones de condiciones y resultados de negocio.

Las Decision Tables son especialmente útiles cuando múltiples condiciones determinan una salida.

---

# 2. Checkout Decision Table

Condiciones:

* Customer Information válida.
* Shipping Information válida.
* Cart contiene productos.

| Regla | Customer Valid | Shipping Valid | Cart Has Items | Resultado esperado |
| ----- | -------------- | -------------- | -------------- | ------------------ |
| R1    | Yes            | Yes            | Yes            | Checkout permitido |
| R2    | No             | Yes            | Yes            | Checkout bloqueado |
| R3    | Yes            | No             | Yes            | Checkout bloqueado |
| R4    | Yes            | Yes            | No             | Checkout bloqueado |
| R5    | No             | No             | Yes            | Checkout bloqueado |
| R6    | No             | Yes            | No             | Checkout bloqueado |
| R7    | Yes            | No             | No             | Checkout bloqueado |
| R8    | No             | No             | No             | Checkout bloqueado |

### Test Cases relacionados

R1 → TC-020
R2 → TC-021 / TC-023
R3 → TC-022 / TC-024
R4 → TC-025

No siempre es necesario implementar las 8 combinaciones como E2E independientes si existe cobertura equivalente en niveles más bajos.

---

# 3. Payment Decision Table

Condiciones:

* Checkout válido.
* Payment aprobado.

| Regla | Checkout Valid | Payment Approved | Resultado esperado                             |
| ----- | -------------- | ---------------- | ---------------------------------------------- |
| P1    | Yes            | Yes              | Continuar hacia Order                          |
| P2    | Yes            | No               | No crear Successful Order                      |
| P3    | No             | Yes              | Payment no debería iniciarse como flujo válido |
| P4    | No             | No               | Flujo bloqueado                                |

### Relación

P1 → TC-026, TC-029
P2 → TC-027, TC-028
P3 → Requirement / Architecture validation
P4 → TC-020–TC-025

---

# 4. Order Decision Table

Condiciones:

* Payment successful.
* Order Creation successful.
* Persistence successful.

| Regla | Payment | Order Creation | Persistence | Resultado                  |
| ----- | ------- | -------------- | ----------- | -------------------------- |
| O1    | Success | Success        | Success     | Successful transaction     |
| O2    | Fail    | No             | No          | No Successful Order        |
| O3    | Success | Fail           | No          | Transaction error          |
| O4    | Success | Success        | Fail        | Critical consistency issue |

### Relación

O1 → TC-029, TC-031, TC-037
O2 → TC-028, TC-038
O3 → TC-035
O4 → TC-039

La regla O4 requiere definición adicional de arquitectura y recuperación.

---

# 5. Notification Decision Table

Condiciones:

* Order exitosa.
* Notification Service disponible.

| Regla | Successful Order | Notification Service | Resultado esperado                             |
| ----- | ---------------- | -------------------- | ---------------------------------------------- |
| N1    | Yes              | Available            | Enviar confirmación                            |
| N2    | No               | Available            | No enviar Success Confirmation                 |
| N3    | Yes              | Unavailable          | Aplicar comportamiento de error/retry definido |
| N4    | No               | Unavailable          | No enviar Success Confirmation                 |

### Relación

N1 → TC-033, TC-036
N2 → TC-034, TC-035
N3 → Requirement Gap
N4 → TC-034

---

# 6. E2E Business Rules

Las Decision Tables permiten derivar reglas críticas:

Failed Payment
      ↓
No Successful Order

Successful Order
      ↓
Persisted Data

Successful Order
      ↓
Confirmation Notification

Failed Transaction
      ↓
No Success Notification

---

# 7. Gaps identificados

Aún se requiere clarificar:

* Guest Checkout.
* Payment Timeout.
* Payment Retry.
* Persistence Recovery.
* Notification Retry.
* Duplicate Purchase.
* Idempotency.
* Maximum Cart Quantity.

Estas condiciones pueden generar nuevas Decision Tables cuando existan reglas formales.

---

# 8. Cuándo utilizar Decision Tables

Son especialmente útiles cuando existe:

Condición A
+
Condición B
+
Condición C
        ↓
Business Result

Ayudan a evitar olvidar combinaciones importantes.
