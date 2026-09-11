# Estrategia de Datos de Prueba — QA E-Commerce Platform

## 1. Propósito

Este documento define la estrategia para crear, utilizar, mantener y limpiar Test Data dentro del proyecto.

La Test Data debe permitir ejecuciones predecibles, repetibles y seguras.

---

## 2. Principios

La Test Data debe ser:

* Predecible.
* Reutilizable cuando sea apropiado.
* Aislada cuando sea posible.
* Fácil de crear.
* Fácil de resetear.
* No sensible.
* Trazable.
* Adecuada para Automation.

---

## 3. Authentication Data

| ID          | Tipo    | Descripción                |
| ----------- | ------- | -------------------------- |
| TD-AUTH-001 | Valid   | Usuario existente y activo |
| TD-AUTH-002 | Invalid | Password incorrecto        |
| TD-AUTH-003 | Invalid | Username inexistente       |
| TD-AUTH-004 | Invalid | Username vacío             |
| TD-AUTH-005 | Invalid | Password vacío             |
| TD-AUTH-006 | Invalid | Username y Password vacíos |

Nunca almacenar Password reales en Git.

---

## 4. Product Data

| ID          | Producto  | Precio | Stock |
| ----------- | --------- | -----: | ----: |
| TD-PROD-001 | Product A |    100 |    10 |
| TD-PROD-002 | Product B |     50 |     5 |
| TD-PROD-003 | Product C |     75 |     0 |

Estos valores son Test Data controlados para ejercicios y diseño.

---

## 5. Cart Data

Valores conocidos:

| Valor | Clasificación              |
| ----: | -------------------------- |
|    -1 | Invalid                    |
|     0 | Boundary / Requirement Gap |
|     1 | Minimum Valid conocido     |
|     2 | Valid                      |
|     3 | Valid                      |

La cantidad máxima no está definida.

Por lo tanto:

Maximum Quantity = Requirement Gap

No debe inventarse un máximo sin aprobación.

---

## 6. Checkout Data

| ID         | Descripción                 |
| ---------- | --------------------------- |
| TD-CHK-001 | Customer + Shipping válidos |
| TD-CHK-002 | Customer faltante           |
| TD-CHK-003 | Shipping faltante           |
| TD-CHK-004 | Customer inválido           |
| TD-CHK-005 | Shipping inválido           |
| TD-CHK-006 | Cart vacío                  |

---

## 7. Payment Data

| ID         | Caso                               |
| ---------- | ---------------------------------- |
| TD-PAY-001 | Approved                           |
| TD-PAY-002 | Declined                           |
| TD-PAY-003 | Timeout / Requirement Gap          |
| TD-PAY-004 | Duplicate Submission / Idempotency |

Los detalles reales dependerán del Payment Sandbox o mock utilizado.

---

## 8. Order Data

Casos necesarios:

* Successful Order.
* Failed Payment → No Successful Order.
* Persistence Failure.
* Duplicate Request.
* Order con múltiples productos.
* Order con cantidades diferentes.

---

## 9. Data Lifecycle

La Test Data deberá seguir:

Create
   ↓
Prepare
   ↓
Execute
   ↓
Validate
   ↓
Clean / Reset

---

## 10. Test Independence

Los Test Cases deben evitar depender unos de otros.

Evitar:

TC-002 necesita que TC-001 haya terminado correctamente.

Preferir:

Cada Test Case prepara o recupera su propio estado.

---

## 11. Data Isolation

Opciones:

* Unique IDs.
* Dedicated Test Accounts.
* API Setup.
* Database Seeds.
* Fixtures.
* Factories.
* Cleanup hooks.

---

## 12. Data para Web Automation

Se podrán utilizar:

* Fixtures.
* JSON files.
* Factories.
* Environment variables.
* API setup.

Ejemplo conceptual:

fixtures/
├── users.json
├── products.json
├── checkout.json
└── payments.json

---

## 13. Data para API Testing

Puede utilizarse:

* JSON payloads.
* Environment Variables.
* Dynamic IDs.
* Data factories.

Ejemplo:

json
{
  "productId": 1001,
  "quantity": 2
}

---

## 14. Data para Database Testing

Podrán utilizarse:

* Seed scripts.
* Temporary records.
* Transaction-based cleanup.
* Known IDs.

Siempre que sea posible se deberá evitar afectar información compartida.

---

## 15. Data para E2E

Un escenario E2E deberá contar con un dataset controlado para:

User
 ↓
Product
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

---

## 16. Performance Test Data

Performance Testing puede requerir datos generados en volumen.

Ejemplos:

* 100 Users.
* 1,000 Products.
* 10,000 Orders.

Estos números deberán ser definidos según los objetivos reales de Performance Testing.

---

## 17. Datos sensibles

No se deben utilizar en el repositorio:

* Password reales.
* Credit Card reales.
* Production Customer Data.
* Authentication Tokens reales.
* Personal Information real.
* Secrets.

---

## 18. Environment Variables

Datos sensibles o dependientes del ambiente deberán manejarse mediante variables.

Ejemplos:

TEST_USERNAME
TEST_PASSWORD
API_TOKEN
BASE_URL
API_URL

---

## 19. Riesgos de Test Data

| Riesgo                   | Impacto                    |
| ------------------------ | -------------------------- |
| Shared Data              | Flaky Tests                |
| Modified Data            | Resultados inconsistentes  |
| Production Data Exposure | Security / Privacy         |
| No Cleanup               | Contaminación del ambiente |
| Hardcoded Credentials    | Security Risk              |
| Duplicate IDs            | Conflictos                 |
| Test Dependency          | Baja confiabilidad         |

---

## 20. Principio

Stable Test Data
       ↓
Stable Tests
       ↓
Reliable Automation

Una mala estrategia de Test Data puede producir falsos fallos y Flaky Tests.
