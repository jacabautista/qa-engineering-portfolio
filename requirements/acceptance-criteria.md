# Criterios de Aceptación — QA E-Commerce Platform

## 1. Propósito

Este documento define los Acceptance Criteria asociados a los requisitos funcionales del proyecto.

Los Acceptance Criteria permiten determinar de manera verificable si una funcionalidad cumple el comportamiento esperado.

---

# FR-001 — User Authentication

## AC-001 — Login exitoso

**Given** que el usuario existe y posee credenciales válidas
**When** envía sus credenciales mediante Login
**Then** el sistema debe autenticarlo correctamente.

---

## AC-002 — Contraseña inválida

**Given** que el usuario existe
**And** proporciona una contraseña inválida
**When** intenta autenticarse
**Then** el sistema debe rechazar el Login
**And** no debe crear una sesión autenticada válida.

---

## AC-003 — Usuario inválido

**Given** que el usuario no existe
**When** intenta autenticarse
**Then** el sistema debe rechazar el Login.

---

## AC-004 — Credenciales requeridas

**Given** que uno o más campos obligatorios de autenticación están vacíos
**When** el usuario intenta realizar Login
**Then** el sistema debe impedir la autenticación
**And** debe aplicar la validación correspondiente.

---

# FR-002 — Product Catalog

## AC-005 — Visualización de productos disponibles

**Given** que existen productos disponibles
**When** el usuario accede al catálogo
**Then** el sistema debe mostrar los productos disponibles.

---

## AC-006 — Selección de producto

**Given** que el catálogo contiene productos
**When** el usuario selecciona un producto
**Then** el sistema debe permitir acceder a la información del producto seleccionado.

---

# FR-003 — Product Details

## AC-007 — Información del producto

**Given** que el usuario selecciona un producto existente
**When** accede al detalle
**Then** el sistema debe mostrar la información correspondiente al producto seleccionado.

---

## AC-008 — Agregar producto disponible

**Given** que el producto está disponible
**When** el usuario selecciona la acción para agregarlo al carrito
**Then** el producto debe ser agregado correctamente.

---

# FR-004 — Shopping Cart

## AC-009 — Agregar producto al carrito

**Given** que existe un producto válido y disponible
**When** el usuario lo agrega al carrito
**Then** el carrito debe contener dicho producto.

---

## AC-010 — Actualizar cantidad

**Given** que existe un producto en el carrito
**When** el usuario modifica su cantidad utilizando un valor válido
**Then** el carrito debe reflejar la nueva cantidad
**And** debe actualizar los cálculos relacionados.

---

## AC-011 — Eliminar producto

**Given** que existe un producto en el carrito
**When** el usuario lo elimina
**Then** el producto ya no debe aparecer en el carrito.

---

## AC-012 — Total del carrito

**Given** que existen productos en el carrito
**When** el sistema calcula el total
**Then** el total debe corresponder a los productos, cantidades y precios aplicables.

---

# FR-005 — Checkout

## AC-013 — Información requerida

**Given** que el usuario inicia Checkout
**When** existen campos obligatorios
**Then** el sistema debe exigir la información requerida antes de continuar.

---

## AC-014 — Checkout válido

**Given** que el carrito contiene productos
**And** la información requerida es válida
**When** el usuario continúa el proceso
**Then** el sistema debe permitir avanzar hacia Payment.

---

## AC-015 — Checkout inválido

**Given** que la información requerida está incompleta o es inválida
**When** el usuario intenta continuar
**Then** el sistema debe impedir que el Checkout avance correctamente.

---

# FR-006 — Payment

## AC-016 — Pago exitoso

**Given** que el Checkout es válido
**And** Payment devuelve un resultado aprobado
**When** la transacción es procesada
**Then** el sistema debe considerar el pago exitoso
**And** debe permitir continuar hacia la creación de Order.

---

## AC-017 — Pago rechazado

**Given** que el Checkout es válido
**And** Payment devuelve un resultado rechazado
**When** la transacción es procesada
**Then** el sistema no debe considerar el pago exitoso
**And** no debe crear una Order exitosa como resultado de esa transacción.

---

# FR-007 — Order Creation

## AC-018 — Creación de orden exitosa

**Given** que Payment fue exitoso
**When** el sistema procesa la creación de la orden
**Then** debe crear una Order asociada a la transacción válida.

---

## AC-019 — Información de la orden

**Given** que una Order fue creada
**When** se consulta su información
**Then** los datos deben corresponder a la compra realizada.

---

## AC-020 — Persistencia de la orden

**Given** que una Order fue creada exitosamente
**When** finaliza el procesamiento
**Then** la información esperada debe quedar persistida correctamente.

---

# FR-008 — Email Notification

## AC-021 — Confirmación de orden

**Given** que la Order fue creada exitosamente
**When** finaliza el procesamiento esperado
**Then** el sistema debe generar la notificación de confirmación correspondiente.

---

# Resumen de cobertura

| Requirement | Acceptance Criteria            |
| ----------- | ------------------------------ |
| FR-001      | AC-001, AC-002, AC-003, AC-004 |
| FR-002      | AC-005, AC-006                 |
| FR-003      | AC-007, AC-008                 |
| FR-004      | AC-009, AC-010, AC-011, AC-012 |
| FR-005      | AC-013, AC-014, AC-015         |
| FR-006      | AC-016, AC-017                 |
| FR-007      | AC-018, AC-019, AC-020         |
| FR-008      | AC-021                         |

Total:

Functional Requirements = 8
Acceptance Criteria = 21

---

# Principio de QA

Un Acceptance Criterion debe ser:

* Claro.
* Verificable.
* Medible cuando corresponda.
* No ambiguo.
* Relacionado con un requisito.

Si falta información:

Ambiguous Acceptance Criterion
          ↓
Requirement Gap
          ↓
Clarification
          ↓
Acceptance Criteria Update
