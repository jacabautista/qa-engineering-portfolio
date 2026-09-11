# Escenarios de Prueba — QA E-Commerce Platform

## 1. Propósito

Este documento define los Test Scenarios derivados de los Functional Requirements, Acceptance Criteria y riesgos identificados.

Un Test Scenario representa una condición o flujo de negocio que debe ser validado.

---

# Authentication

## TS-001 — Login exitoso

Validar que un usuario existente pueda autenticarse utilizando credenciales válidas.

Relacionado con:

* FR-001
* AC-001

Prioridad: Critical.

---

## TS-002 — Contraseña inválida

Validar que el sistema rechace el Login cuando un usuario válido proporciona una contraseña incorrecta.

Relacionado con:

* FR-001
* AC-002

Prioridad: High.

---

## TS-003 — Usuario inexistente

Validar que el sistema rechace un intento de Login utilizando un usuario inexistente.

Relacionado con:

* FR-001
* AC-003

Prioridad: High.

---

## TS-004 — Credenciales obligatorias

Validar las condiciones donde Username y/o Password no sean proporcionados.

Relacionado con:

* FR-001
* AC-004

Prioridad: High.

---

# Product Catalog

## TS-005 — Mostrar productos disponibles

Validar que el catálogo muestre los productos disponibles.

Relacionado con:

* FR-002
* AC-005

Prioridad: High.

---

## TS-006 — Seleccionar producto

Validar que un usuario pueda seleccionar un producto del catálogo y acceder a su información.

Relacionado con:

* FR-002
* AC-006

Prioridad: High.

---

# Product Details

## TS-007 — Mostrar información del producto

Validar que el detalle corresponda al producto seleccionado.

Relacionado con:

* FR-003
* AC-007

Prioridad: High.

---

## TS-008 — Agregar producto disponible al carrito

Validar que un producto disponible pueda agregarse correctamente al carrito.

Relacionado con:

* FR-003
* AC-008

Prioridad: High.

---

# Shopping Cart

## TS-009 — Agregar producto al carrito

Validar que un producto seleccionado sea agregado correctamente al carrito.

Relacionado con:

* FR-004
* AC-009

Prioridad: Critical.

---

## TS-010 — Actualizar cantidad

Validar que el usuario pueda modificar la cantidad de un producto utilizando valores válidos.

Relacionado con:

* FR-004
* AC-010

Prioridad: High.

---

## TS-011 — Eliminar producto

Validar que un producto pueda eliminarse correctamente del carrito.

Relacionado con:

* FR-004
* AC-011

Prioridad: High.

---

## TS-012 — Calcular total del carrito

Validar que el total corresponda correctamente a:

Precio × Cantidad

y que sea actualizado cuando el carrito cambie.

Relacionado con:

* FR-004
* AC-012

Prioridad: Critical.

---

# Checkout

## TS-013 — Validar información obligatoria

Validar que los campos requeridos sean solicitados antes de continuar.

Relacionado con:

* FR-005
* AC-013

Prioridad: High.

---

## TS-014 — Checkout exitoso

Validar que el usuario pueda continuar cuando:

* El carrito contiene productos.
* La información del cliente es válida.
* La información de envío es válida.

Relacionado con:

* FR-005
* AC-014

Prioridad: Critical.

---

## TS-015 — Checkout inválido

Validar que Checkout no continúe correctamente con datos inválidos o incompletos.

Relacionado con:

* FR-005
* AC-015

Prioridad: High.

---

# Payment

## TS-016 — Pago exitoso

Validar el flujo cuando Payment devuelve un resultado aprobado.

Relacionado con:

* FR-006
* AC-016

Prioridad: Critical.

---

## TS-017 — Pago fallido

Validar el comportamiento cuando Payment devuelve un resultado rechazado.

Relacionado con:

* FR-006
* AC-017

Prioridad: Critical.

---

# Order

## TS-018 — Creación de orden exitosa

Validar que una Order sea creada después de un Payment exitoso.

Relacionado con:

* FR-007
* AC-018

Prioridad: Critical.

---

## TS-019 — Validar información de la orden

Validar que la Order contenga la información correcta de la compra.

Relacionado con:

* FR-007
* AC-019

Prioridad: Critical.

---

## TS-020 — Persistencia de la orden

Validar que una Order exitosa sea persistida correctamente.

Relacionado con:

* FR-007
* AC-020

Prioridad: Critical.

---

# Email Notification

## TS-021 — Confirmación de orden

Validar que una notificación de confirmación sea generada después de una Order exitosa.

Relacionado con:

* FR-008
* AC-021

Prioridad: High.

---

# Escenarios adicionales basados en riesgo

Los siguientes escenarios no derivan únicamente de un Acceptance Criterion específico.

Se agregan mediante **Risk-Based Testing**.

---

## TS-022 — Acceso no autorizado

Validar que recursos protegidos no sean accesibles sin Authentication adecuada.

Relacionado con:

* FR-001

Riesgo:

Security.

Prioridad: Critical.

---

## TS-023 — Producto sin stock

Validar el comportamiento cuando un usuario intenta operar con un producto sin disponibilidad.

Relacionado con:

* FR-003
* FR-004

Prioridad: High.

---

## TS-024 — Cantidad de producto inválida

Validar cantidades fuera del dominio válido.

Ejemplos:

-1
0

El comportamiento exacto de `0` debe confirmarse mediante Requirement Clarification.

Relacionado con:

* FR-004

Prioridad: High.

---

## TS-025 — Recalcular carrito

Validar que el total se actualice correctamente después de:

* Modificar cantidad.
* Eliminar producto.

Relacionado con:

* FR-004
* AC-010
* AC-011
* AC-012

Prioridad: Critical.

---

## TS-026 — Pago fallido no debe crear una orden exitosa

Validar la regla:

Failed Payment
      ↓
No Successful Order

Relacionado con:

* FR-006
* FR-007
* AC-017

Prioridad: Critical.

---

## TS-027 — Integridad de datos de Order

Validar la consistencia entre:

Checkout
   ↓
Payment
   ↓
Order
   ↓
Database

Relacionado con:

* FR-007
* AC-019
* AC-020

Prioridad: Critical.

---

## TS-028 — Email únicamente para una orden exitosa

Validar que no se genere una confirmación exitosa cuando la transacción no haya finalizado correctamente.

Regla:

Failed Transaction
        ↓
No Success Notification

Relacionado con:

* FR-008

Prioridad: Critical.

---

# Resumen

| Área                   | Test Scenarios |
| ---------------------- | -------------: |
| Authentication         |              4 |
| Catalog                |              2 |
| Product                |              2 |
| Cart                   |              4 |
| Checkout               |              3 |
| Payment                |              2 |
| Order                  |              3 |
| Email                  |              1 |
| Risk-Based adicionales |              7 |
| Total                  |             28 |

---

# Relación entre artefactos

FR
 ↓
AC
 ↓
TS
 ↓
TC
 ↓
Automation
 ↓
Execution

No se requiere una relación estricta de:

1 AC = 1 TS

Un Acceptance Criterion puede requerir múltiples escenarios, y QA puede agregar escenarios adicionales basados en riesgo.

---

# Principio de QA

QA debe diseñar escenarios suficientes para cubrir:

* Happy Path.
* Negative Paths.
* Boundary Conditions.
* Business Rules.
* Integration Risks.
* Data Risks.
* Security Risks.
* Failure Paths.

El objetivo no es producir la mayor cantidad posible de escenarios.

El objetivo es cubrir los riesgos correctos.
