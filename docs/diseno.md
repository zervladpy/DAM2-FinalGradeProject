# Diseño

## Table of Contents

1. [Arquitectura](#arquitectura)
2. [Base de Datos](#base-de-datos)
    - [Modelos](#modelos)
3. [Interfaz de Usuario](#interfaz-de-usuario)

> **Nota** : Puede ser necesario crear una cuenta en [Eraser](https://app.eraser.io/) para poder visualizar el diagrama.

---

## Diagrama de Arquitectura

- [Arquitectura de Servicios](https://app.eraser.io/workspace/qCiZfe9alVfbK4OC42Rx?elements=P5Tr4Nq2XOY6Owec5c2ZhQ)
- [Diagramas de Flujo](https://app.eraser.io/workspace/qCiZfe9alVfbK4OC42Rx?elements=Fyqgx8O3vF-tKS-nzId8bg)

---

## Diagrama de Base de Datos

La base de datos será de tipo **relacional** con el motor de **PostgreSQL**

### Modelos

Generado para el **MVP** del proyecto

 ###### **User**

| Columna    |   Tipo    | NULLABLE | PK  | FK  |
| ---------- | :-------: | :------: | :-: | :-: |
| `id`       | `string`  |    🗙    |  ✔  | 🗙  |
| `email`    | `string`  |    🗙    |  ✔  | 🗙  |
| `verifyed` | `boolean` |    🗙    | 🗙  | 🗙  |
| `password` | `string`  |    🗙    | 🗙  | 🗙  |

###### Role

| Columna |   Tipo   | NULLABLE | PK  | FK  |
| ------- | :------: | :------: | :-: | :-: |
| `id`    |  `int`   |    🗙    |  ✔  | 🗙  |
| `name`  | `string` |    🗙    | 🗙  | 🗙  |

###### Organization

| Columna       |   Tipo   | NULLABLE | PK  |         FK          |
| ------------- | :------: | :------: | :-: | :-----------------: |
| `id`          | `string` |    🗙    |  ✔  |         🗙          |
| `created-at`  |  `date`  |    🗙    | 🗙  |         🗙          |
| `creator-id`  | `string` |    ✔     | 🗙  | [Profile](#profile) |
| `name`        | `string` |    🗙    | 🗙  |         🗙          |
| `description` | `string` |    🗙    | 🗙  |         🗙          |
| `logo-url`    | `string` |    ✔     | 🗙  |         🗙          |

###### Profile

| Columna           |   Tipo    | NULLABLE | PK  |        FK        |
| ----------------- | :-------: | :------: | :-: | :--------------: |
| `id`              | `string`  |    🗙    |  ✔  | [User](#usuario) |
| `created-at`      |  `date`   |    🗙    | 🗙  |        🗙        |
| `fist-name`       | `string`  |    ✔     | 🗙  |        🗙        |
| `last-name`       | `string`  |    ✔     | 🗙  |        🗙        |
| `birth-date`      | `string`  |    ✔     |  ✔  |        🗙        |
| `email`           | `boolean` |    🗙    | 🗙  | [User](#usuario) |
| `avatar-url`      | `string`  |    ✔     | 🗙  |        🗙        |
| `organization-id` | `string`  |    ✔     | 🗙  |        🗙        |
###### Profile-Role

| Columna      |   Tipo   | NULLABLE | PK  |         FK          |
| ------------ | :------: | :------: | :-: | :-----------------: |
| `role-id`    |  `int`   |    🗙    |  ✔  |    [Role](#role)    |
| `profile-id` | `string` |    🗙    |  ✔  | [Profile](#profile) |

###### Horse

| Columna           |   Tipo   | NULLABLE | PK  |              FK               |
| ----------------- | :------: | :------: | :-: | :---------------------------: |
| `id`              | `string` |    🗙    |  ✔  |              🗙               |
| `created-at`      |  `date`  |    🗙    | 🗙  |              🗙               |
| `owner-id`        | `string` |    🗙    | 🗙  |      [Profile](#profile)      |
| `full-name`       | `string` |    ✔     | 🗙  |              🗙               |
| `alias`           | `string` |    🗙    | 🗙  |              🗙               |
| `birth-date`      | `string` |    🗙    | 🗙  |              🗙               |
| `organization-id` | `string` |    🗙    | 🗙  | [Organization](#organization) |

###### Lesson-Category

| Columna       |   Tipo   | NULLABLE | PK  | FK  |
| ------------- | :------: | :------: | :-: | :-: |
| `id`          | `string` |    🗙    |  ✔  | 🗙  |
| `title`       | `string` |    🗙    | 🗙  | 🗙  |
| `description` | `string` |    ✔     | 🗙  | 🗙  |
###### Lesson

| Columna           |   Tipo   | NULLABLE | PK  |                 FK                  |
| ----------------- | :------: | :------: | :-: | :---------------------------------: |
| `id`              | `string` |    🗙    |  ✔  |                 🗙                  |
| `title`           | `string` |    🗙    | 🗙  |                 🗙                  |
| `description`     | `string` |    ✔     | 🗙  |                 🗙                  |
| `category-id`     | `string` |    🗙    | 🗙  | [Lesson-Category](#lesson-category) |
| `capacity`        |  `int`   |    ✔     | 🗙  |                 🗙                  |
| `week-day`        |  `int`   |    🗙    | 🗙  |                 🗙                  |
| `start-time`      |  `date`  |    🗙    | 🗙  |                 🗙                  |
| `duration`        |  `long`  |    🗙    | 🗙  |                 🗙                  |
| `instructor-id`   | `string` |    🗙    | 🗙  |         [Profile](#profile)         |
| `organization-id` | `string` |    🗙    | 🗙  |    [Organization](#organization)    |
###### Lesson-Profile-Horse

| Columna           |   Tipo   | NULLABLE | PK  |              FK               |
| ----------------- | :------: | :------: | :-: | :---------------------------: |
| `id`              | `string` |    🗙    |  ✔  |              🗙               |
| `organization-id` | `string` |    🗙    | 🗙  | [Organization](#organization) |
| `rider-id`        | `string` |    🗙    | 🗙  |      [Profile](#profile)      |
| `horse-id`        | `string` |    🗙    | 🗙  |        [Horse](#horse)        |

###### LessonAssistence

| Columna          |   Tipo    | NULLABLE | PK  |         FK          |
| ---------------- | :-------: | :------: | :-: | :-----------------: |
| `lesson-id`      | `string`  |    🗙    |  ✔  |  [Lesson](#lesson)  |
| `profile-id`     | `string`  |    🗙    |  ✔  | [Profile](#profile) |
| `assitance-date` |  `date`   |    🗙    |  ✔  |         🗙          |
| `justified`      | `boolean` |    🗙    | 🗙  |         🗙          |


---

## Diseño de la Interfaz de Usuario

- [Flujo de Pantallas](https://app.eraser.io/workspace/qCiZfe9alVfbK4OC42Rx?elements=_NVoWLuf5N1IU3FS3HGtsQ)

**Nota** : El diseño no es final y presenta des-variación de datos.
**Nota** : Me gustaría destacar que esta parte no ha sido estudiada en ninguna materia del ciclo, y no se puede pretender a una interfaz muy desarrollada ya que esto es una asignatura mas a estudiar, saber para que sirve un botón o un campo de texto no es suficiente. Por esta razón he optado por realizar un **boceto** con inteligencia artificial que pasaré a algo más acorde en un futuro próximo pero que servirá de apoyo para la interfaz final.

- [Interfaz de Usuario](https://app.eraser.io/workspace/qCiZfe9alVfbK4OC42Rx?elements=__xOe4hE6F0vru-NotYD7g)