# RACI Matrix — QA E-Commerce Platform project

## 1. Purpose

The purpose of this RACI matrix is to establish clear responsibilities and accountability for the main activities of the QA E-Commerce Platform project.

RACI helps prevent responsibility gaps, duplicated work and unclear decision-making.

## 2. RACI Definitions

| Code | Meaning     | Description                        |
| ---- | ----------- | ---------------------------------- |
| R    | Responsible | Performs the activity              |
| A    | Accountable | Owns the final result and decision |
| C    | Consulted   | Provides information or expertise  |
| I    | Informed    | Must be kept informed              |

## 3. Responsibility Matrix

| Activity                     | Product Owner | Project Manager | QA Lead | QA Engineer | Developer Lead | Developers | DevOps | DBA |
| ---------------------------- | ------------- | --------------- | ------- | ----------- | -------------- | ---------- | ------ | --- |
| Define requirements          | A/R           | C               | C       | I           | C              | C          | I      | I   |
| Define acceptance criteria   | A/R           | C               | C       | C           | C              | C          | I      | I   |
| Define QA strategy           | C             | C               | A/R     | C           | C              | I          | I      | I   |
| Define test plan             | I             | C               | A       | R           | C              | I          | I      | I   |
| Design test cases            | C             | I               | A       | R           | C              | I          | I      | C   |
| Execute functional tests     | I             | I               | A       | R           | C              | I          | I      | C   |
| Develop automation           | I             | I               | A       | R           | C              | C          | C      | I   |
| Manage defects               | C             | I               | A       | R           | C              | R          | I      | C   |
| Regression testing           | I             | I               | A       | R           | C              | C          | I      | C   |
| Configure test environments  | I             | C               | C       | C           | C              | I          | A/R    | I   |
| Database validation          | I             | I               | A       | R           | C              | C          | I      | R   |
| CI/CD integration            | I             | C               | C       | C           | C              | C          | A/R    | I   |
| Release readiness assessment | C             | A               | R       | C           | C              | I          | C      | C   |
| Production smoke testing     | I             | C               | A       | R           | C              | C          | R      | I   |
| Quality reporting            | I             | C               | A/R     | C           | C              | I          | I      | I   |
| Go/No-Go recommendation      | C             | A               | R       | C           | C              | I          | C      | C   |

## 4. RACI Governance Rules

The following rules apply to the project:

1. Each major activity should have one clearly identified Accountable stakeholder.
2. Responsible stakeholders execute the assigned activities.
3. Consulted stakeholders provide relevant technical or business input.
4. Informed stakeholders receive relevant status or decision information.
5. RACI assignments must be reviewed when project scope or organizational responsibilities change.
6. Any responsibility conflict must be escalated to the Project Manager and relevant leadership.
7. RACI must remain aligned with the project scope, test strategy and release process.

## 5. QA Leadership Perspective

The QA Lead has a significant role in activities related to quality strategy, test planning, defect management, regression, automation and release readiness.

However, QA does not own every project decision.

Business stakeholders remain responsible for business decisions, development owns implementation activities, DevOps owns infrastructure and deployment responsibilities, and project leadership coordinates overall delivery.

## 6. Success Criteria

The RACI matrix will be considered effective when:

* Project responsibilities are clearly defined.
* Major activities have an accountable owner.
* QA responsibilities are understood by the project team.
* Responsibility conflicts are identified early.
* Stakeholders know when they must participate.
* Release decisions have clearly defined ownership.
