</>Markdown
# Risk Register — QA E-Commerce Platform

## 1. Objetivo

El Risk Register permite identificar, analizar, priorizar y gestionar los riesgos que puedan afectar la calidad, el alcance, el tiempo, el costo o la continuidad del proyecto.

## 2. Escala de evaluación

### Probabilidad

| Valor | Descripción |
| ----- | ----------- |
| 1     | Muy baja    |
| 2     | Baja        |
| 3     | Media       |
| 4     | Alta        |
| 5     | Muy alta    |

### Impacto

| Valor | Descripción |
| ----- | ----------- |
| 1     | Muy bajo    |
| 2     | Bajo        |
| 3     | Medio       |
| 4     | Alto        |
| 5     | Crítico     |

### Nivel de riesgo

**Nivel de riesgo = Probabilidad × Impacto**

| Puntaje | Nivel   |
| ------: | ------- |
|     1–4 | Bajo    |
|     5–9 | Medio   |
|   10–16 | Alto    |
|   17–25 | Crítico |

---

## 3. Registro de riesgos

| ID    | Riesgo                                | Causa                                                | Prob. | Impacto | Nivel   | Mitigación                                                 | Contingencia                                     | Responsable      | Estado  |
| ----- | ------------------------------------- | ---------------------------------------------------- | ----: | ------: | ------- | ---------------------------------------------------------- | ------------------------------------------------ | ---------------- | ------- |
| R-001 | Ambiente de pruebas inestable         | Configuración incorrecta o fallas de infraestructura |     4 |       5 | Crítico | Definir ambiente QA estable y ejecutar Smoke Tests         | Escalar a DevOps y utilizar ambiente alternativo | QA Lead / DevOps | Abierto |
| R-002 | Cambios frecuentes en la interfaz     | Evolución continua de requisitos                     |     4 |       3 | Alto    | Utilizar Page Object Model y locators robustos             | Actualizar componentes afectados                 | QA Automation    | Abierto |
| R-003 | Datos de prueba insuficientes         | Falta de estrategia de Test Data                     |     3 |       4 | Alto    | Crear datos controlados y reutilizables                    | Generar datos adicionales antes de la ejecución  | QA / Dev         | Abierto |
| R-004 | Flaky Tests                           | Sincronización incorrecta o dependencia del ambiente |     3 |       4 | Alto    | Implementar waits, fixtures y aislamiento                  | Analizar y corregir antes del release            | QA Automation    | Abierto |
| R-005 | Defectos críticos llegan a producción | Cobertura insuficiente de regresión                  |     3 |       5 | Alto    | Automatizar escenarios críticos y establecer Quality Gates | Bloquear release y ejecutar análisis de impacto  | QA Lead          | Abierto |

---

## 4. Estrategia de respuesta

Los riesgos serán tratados mediante las siguientes estrategias:

* **Mitigar:** reducir la probabilidad o impacto.
* **Evitar:** eliminar la causa del riesgo cuando sea posible.
* **Transferir:** trasladar la responsabilidad a un tercero cuando corresponda.
* **Aceptar:** asumir el riesgo cuando su impacto sea controlable.

---

## 5. Seguimiento

El Risk Register será revisado durante las principales etapas del proyecto:

* Inicio del proyecto.
* Análisis de requisitos.
* Diseño de pruebas.
* Automatización.
* Regresión.
* Release.
* Producción.

Los riesgos críticos y altos deberán ser revisados antes de cada decisión de release.

---

## 6. Criterio de escalamiento

Un riesgo deberá escalarse al QA Lead o Project Manager cuando:

* Su nivel sea **Crítico**.
* Pueda comprometer una funcionalidad crítica.
* Pueda afectar la fecha de release.
* Pueda generar impacto significativo para el negocio.
* No exista una mitigación bajo control del equipo QA.
