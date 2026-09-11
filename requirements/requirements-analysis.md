# Análisis de Requisitos — QA E-Commerce Platform

## 1. Propósito

Este documento define y analiza los requisitos funcionales principales del proyecto **QA E-Commerce Platform**.

El objetivo es proporcionar una base clara para:

* Acceptance Criteria.
* Test Scenarios.
* Test Cases.
* API Testing.
* Database Testing.
* Automation.
* Requirements Traceability.
* Risk-Based Testing.

QA utilizará estos requisitos como referencia para diseñar y ejecutar las validaciones del sistema.

---

## 2. Flujo principal de negocio

El flujo crítico de la plataforma es:

Usuario
   ↓
Login
   ↓
Catálogo
   ↓
Producto
   ↓
Carrito
   ↓
Checkout
   ↓
Pago
   ↓
Orden
   ↓
Base de Datos
   ↓
Email

Cualquier problema que afecte este flujo puede tener impacto directo en la experiencia del usuario o en la operación del negocio.

---

# 3. Requisitos Funcionales

## FR-001 — User Authentication

### Descripción

El sistema debe permitir que un usuario válido pueda autenticarse utilizando credenciales válidas.

### Comportamiento esperado

El sistema debe:

* Permitir login con credenciales válidas.
* Rechazar contraseñas inválidas.
* Rechazar usuarios inexistentes.
* Validar campos obligatorios.
* Evitar acceso no autorizado.

### Riesgos principales

* Acceso no autorizado.
* Mensajes de error incorrectos.
* Sesión creada con credenciales inválidas.
* Información sensible expuesta.

### Prioridad

Critical.

---

## FR-002 — Product Catalog

### Descripción

El sistema debe permitir visualizar los productos disponibles en el catálogo.

### Comportamiento esperado

El usuario debe poder:

* Visualizar productos.
* Identificar información básica.
* Seleccionar un producto disponible.

### Riesgos principales

* Productos no disponibles mostrados incorrectamente.
* Información incompleta.
* Producto incorrecto seleccionado.

### Prioridad

High.

---

## FR-003 — Product Details

### Descripción

El sistema debe mostrar la información detallada de un producto seleccionado.

### Comportamiento esperado

El usuario debe poder visualizar información relevante como:

* Nombre.
* Precio.
* Disponibilidad.
* Información descriptiva.

Cuando el producto esté disponible, el usuario debe poder agregarlo al carrito.

### Riesgos principales

* Precio incorrecto.
* Información inconsistente.
* Stock incorrecto.
* Producto equivocado agregado al carrito.

### Prioridad

High.

---

## FR-004 — Shopping Cart

### Descripción

El sistema debe permitir administrar los productos seleccionados antes del Checkout.

### Comportamiento esperado

El usuario debe poder:

* Agregar productos.
* Actualizar cantidades válidas.
* Eliminar productos.
* Visualizar el total.
* Obtener recálculo correcto cuando cambia el carrito.

### Riesgos principales

* Total incorrecto.
* Cantidades inválidas aceptadas.
* Producto incorrecto eliminado.
* Duplicación no esperada.
* Diferencias entre precio y total.

### Prioridad

Critical.

---

## FR-005 — Checkout

### Descripción

El sistema debe permitir que un usuario continúe con el proceso de compra utilizando información válida.

### Comportamiento esperado

El sistema debe:

* Solicitar información requerida.
* Validar información del cliente.
* Validar información de envío.
* Permitir continuar cuando la información sea válida.
* Rechazar información inválida o incompleta.

### Riesgos principales

* Checkout permitido sin datos obligatorios.
* Información inválida aceptada.
* Datos del cliente incorrectos.
* Proceso iniciado con carrito vacío.

### Prioridad

Critical.

---

## FR-006 — Payment

### Descripción

El sistema debe procesar el resultado de una operación de pago.

### Comportamiento esperado

El sistema debe:

* Procesar un pago aprobado.
* Manejar un pago rechazado.
* Evitar crear una orden exitosa cuando el pago falla.
* Mantener consistencia entre Payment y Order.

### Riesgos principales

* Orden creada sin pago aprobado.
* Pago duplicado.
* Resultado financiero inconsistente.
* Error de integración.
* Timeout.
* Reintentos incorrectos.

### Prioridad

Critical.

---

## FR-007 — Order Creation

### Descripción

El sistema debe crear una orden válida después de completar correctamente el proceso de compra.

### Comportamiento esperado

Una orden exitosa debe:

* Ser creada después de un pago exitoso.
* Contener información correcta.
* Ser persistida.
* Mantener integridad de datos.

### Riesgos principales

* Orden no creada después del pago.
* Orden duplicada.
* Información incorrecta.
* Persistencia incompleta.
* Inconsistencia entre Payment, Order y Database.

### Prioridad

Critical.

---

## FR-008 — Email Notification

### Descripción

El sistema debe enviar una notificación de confirmación cuando una orden sea creada exitosamente.

### Comportamiento esperado

La notificación debe:

* Ser enviada únicamente para una transacción exitosa.
* Corresponder a la orden correcta.
* Contener información coherente con la orden.

### Riesgos principales

* Confirmación enviada después de una transacción fallida.
* Información incorrecta.
* Orden incorrecta asociada al email.
* Notificación no enviada.

### Prioridad

High.

---

# 4. Matriz de requisitos

| ID     | Requisito           | Prioridad | Riesgo                          |
| ------ | ------------------- | --------- | ------------------------------- |
| FR-001 | User Authentication | Critical  | Acceso no autorizado            |
| FR-002 | Product Catalog     | High      | Información incorrecta          |
| FR-003 | Product Details     | High      | Precio/stock incorrecto         |
| FR-004 | Shopping Cart       | Critical  | Total incorrecto                |
| FR-005 | Checkout            | Critical  | Compra con información inválida |
| FR-006 | Payment             | Critical  | Impacto financiero              |
| FR-007 | Order Creation      | Critical  | Integridad transaccional        |
| FR-008 | Email Notification  | High      | Comunicación incorrecta         |

---

# 5. Requisitos no funcionales iniciales

Los requisitos no funcionales específicos todavía deberán ser refinados.

Se consideran inicialmente las siguientes categorías:

* Performance.
* Security.
* Reliability.
* Availability.
* Usability.
* Compatibility.
* Maintainability.
* Observability.

QA no debe inventar valores específicos como tiempos máximos de respuesta o volúmenes de carga si estos no han sido definidos formalmente.

---

# 6. Requirement Gaps identificados

Durante el análisis se identifican áreas que requieren definición adicional.

## RG-001 — Maximum Cart Quantity

No se ha definido la cantidad máxima permitida por producto.

Impacto:

* Boundary Value Analysis incompleto.
* Validaciones de API incompletas.
* Riesgo de comportamiento no especificado.

---

## RG-002 — Quantity Zero

No se ha definido claramente qué debe ocurrir cuando una cantidad cambia a `0`.

Posibles comportamientos podrían ser:

* Rechazar el valor.
* Eliminar el producto.
* Mostrar error.

QA no seleccionará uno sin definición del negocio.

---

## RG-003 — Price Precision

No se ha definido formalmente:

* Cantidad de decimales.
* Regla de redondeo.
* Moneda.
* Tratamiento de impuestos.
* Descuentos.

---

## RG-004 — Payment Timeout

No está definido el comportamiento esperado ante un timeout de Payment.

Se requiere definir:

* Estado resultante.
* Retry policy.
* Mensaje al usuario.
* Tratamiento de Order.
* Reconciliación posterior.

---

## RG-005 — Duplicate Payment Submission

Debe definirse el comportamiento ante envíos duplicados.

Se debe aclarar:

* Idempotency.
* Duplicate Order prevention.
* Duplicate Payment prevention.

---

## RG-006 — Order Persistence Failure

Se requiere definir el comportamiento cuando:

Payment = Successful
Order Creation = Successful
Database Persistence = Failed

Este es un escenario crítico de consistencia transaccional.

---

## RG-007 — Notification Retry

No está definido qué ocurre si la orden fue creada correctamente pero el email falla.

Debe definirse:

* Retry.
* Error handling.
* Logging.
* Monitoring.
* Impacto para el usuario.

---

# 7. Principio de análisis

Cuando QA identifica información faltante:

Información desconocida
        ↓
Requirement Gap
        ↓
BA / Product Owner
        ↓
Clarificación
        ↓
Requirement Update
        ↓
Test Design

QA no debe convertir una suposición en requisito.

---

# 8. Trazabilidad

Cada requisito deberá relacionarse progresivamente con:

Requirement
    ↓
Acceptance Criteria
    ↓
Test Scenario
    ↓
Test Case
    ↓
Automation
    ↓
Execution
    ↓
Defect
    ↓
Release

La trazabilidad se mantiene en:

test-design/traceability-matrix.md

---

# 9. Criterio de finalización

El análisis de requisitos se considera suficientemente establecido cuando:

* Los requisitos principales están identificados.
* Las funcionalidades críticas son conocidas.
* Los riesgos principales están registrados.
* Los Requirement Gaps están documentados.
* Existen Acceptance Criteria asociados.
* Existe trazabilidad hacia Test Scenarios y Test Cases.
