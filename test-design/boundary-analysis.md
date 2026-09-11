# Análisis de Valores Límite — QA E-Commerce Platform

## 1. Propósito

Este documento aplica Boundary Value Analysis a variables relevantes del proyecto.

Boundary Value Analysis busca defectos alrededor de los límites de un dominio válido.

---

## 2. Principio

Si un rango válido fuera:

1 a 10

los valores típicos a evaluar serían:

0
1
2
9
10
11

Sin embargo, QA solo puede utilizar límites formalmente definidos.

No se deben inventar límites.

---

# 3. Shopping Cart Quantity

Actualmente conocemos:

Quantity < 0 → Invalid
Quantity = 1 → Minimum Valid conocido

El máximo todavía no está definido.

---

## Valores actuales

| Valor | Clasificación              |
| ----: | -------------------------- |
|    -1 | Invalid                    |
|     0 | Boundary / Requirement Gap |
|     1 | Minimum Valid              |
|     2 | Valid                      |
|     3 | Valid                      |

---

## TC relacionados

TC-012 → 1 → 2
TC-013 → 0
TC-014 → -1
TC-015 → 1

---

## 4. Quantity Zero

El valor:

0

se encuentra en el límite inferior.

Pero el comportamiento no está definido.

Posibles interpretaciones:

0 → Remove Product

o:

0 → Validation Error

o:

0 → Invalid State

QA debe registrar:

Requirement Gap

hasta recibir una definición formal.

---

## 5. Maximum Quantity

No se conoce:

Maximum Product Quantity

Por tanto no podemos crear correctamente:

max - 1
max
max + 1

Esto debe permanecer pendiente.

---

# 6. Inventory Boundary

Supongamos un producto con:

Available Stock = 10

Conceptualmente deberían evaluarse:

Requested = 9
Requested = 10
Requested = 11

Pero la regla exacta debe definir:

Requested Quantity <= Available Inventory

y qué ocurre cuando se supera el stock.

Si esa regla no existe formalmente, se documenta como gap.

---

# 7. Price Boundaries

Se deben definir reglas para:

* Minimum Price.
* Zero Price.
* Decimal Precision.
* Currency.
* Rounding.
* Discounts.
* Taxes.

Ejemplos potenciales:

0
0.01
99.99
100.00

Estos valores solo deben transformarse en Expected Results concretos cuando exista una regla oficial.

---

# 8. Checkout Field Boundaries

Para campos de texto podrían existir límites como:

minLength
maxLength

Ejemplo hipotético:

maxLength = 50

entonces probaríamos:

49
50
51

Actualmente, si esos valores no están definidos, se registra:

Requirement Gap

---

# 9. Payment Boundaries

Se requiere definición para:

* Minimum transaction amount.
* Maximum transaction amount.
* Timeout.
* Retry count.
* Decimal precision.
* Currency rules.

Sin estos valores no debe inventarse un Expected Result.

---

# 10. Order Boundaries

Posibles áreas futuras:

* Maximum number of products.
* Maximum total.
* Maximum quantity per item.
* Number of retries.
* Duplicate request window.

Estos límites deberán derivarse de requisitos reales.

---

# 11. Boundary Value Analysis + Equivalence Partitioning

Ambas técnicas funcionan bien juntas.

Ejemplo:

Si el rango válido fuera:

1–10

Equivalence Partitions:

<1      → Invalid
1–10    → Valid
>10     → Invalid

Boundary Values:

0
1
2
9
10
11

---

# 12. Proceso ante un límite desconocido

Unknown Boundary
      ↓
Requirement Gap
      ↓
Clarification
      ↓
Defined Boundary
      ↓
Test Cases
      ↓
Automation

---

# 13. Principio de QA

No debemos hacer:

“No está definido, asumiré que el máximo es 10.”

Debemos hacer:

“Maximum Quantity no está definido.
Se requiere clarificación para completar BVA.”

Esto evita convertir suposiciones en requisitos falsos.
