# Análisis

## Tabla de Contenidos

- [Descripción General](#descripción-general)
- [Funcionalidades](#funcionalidades)
	- [MVP](#mvp)
- [Problemas y Soluciones](#problemas-y-soluciones)
---

## Descripción general 

**Gallop Gate** es una idea de aplicación para hacer seguimiento de las actividades diarias de los centros de hípica de todo el mundo y facilitar la comunicación entre el personal.

La idea parte de la cercanía con el mundo hípico y la necesidad que tienen de llevar sus negocios a las nuevas tecnologías y a las pocas herramientas con las que cuentan.

---

## Funcionalidades

- **Manejo de Organizaciones** : Consiste en la agrupación de los usuarios, y entidades relacionadas en un solo sitio y bajo el mismo nombre.

- **Manejo de Usuarios**: Servicio de identificación de usuarios y su clasificación en roles dentro de la organización. 

- **Servicio de Notificaciones** : Servicio de alertas y recordatorios.

- **Manejo de clases**   : Servicio de seguimiento de los usuarios en sus clases.
	- Asistencia
	- Progreso

- **Manejo de Horarios** : Agrupación de clases en grupos en los que los administradores podrán rotar dependiendo de los horarios estacionales por ejemplo.

- **Seguimiento del estado de los caballos** : Servicio dedicado a los caballos.
	- Horas de trabajo semanales para planificación de su optimo descanso.
	- Historial clínico
	- Dietas
	- Dueño

* **Establos** : Servicio de seguimiento de los establos disponibles en el centro, con funcionalidades como :
	* Alquiler
	* Estado

#### MVP

Siendo plenamente consciente de que es un **mega** proyecto debo romperlo en varias fases. Cada una de ellas no estará completa al 100% ya que el tiempo es muy reducido.

Las funciones que contenderá serán las siguientes:
- Organizaciones
- Usuarios
- Roles
- Clases  \*
- Horarios \**

> \* Las clases no tendrán ninguna restricción. Un profesor por ejemplo va a poder coincidir en otras clases al mismo tiempo, como los caballos y riders.

>  \** Los horarios se simplificarán lo máximo posible, no habrá más de 1.

---
## Normativa

**Protección de datos**:
En base al cumplimiento de la ley la aplicación quiere contar con la mínima recolección de datos personales. Tanto es así que los únicos datos que queremos recolectar son:
- Email
- Nombre
- Licencias de Equitación

> Enlaces de interés:
>  - [Protección de datos España](https://www.boe.es/buscar/act.php?id=BOE-A-2018-16673)
>  - [Protección de datos Europa](https://eur-lex.europa.eu/eli/reg/2016/679/oj)

**Política de Cookies**:
Las cookies que va a recolectar la aplicación será los de servicio de autentificación que serán las encargadas de mantener los datos de sesión en la aplicación y permitirán mantener la sesión iniciada.

---

## Problemas y Soluciones

Durante el desarrollo de la aplicación he encontrado varios fallos de diseño iniciales como la mala gestión de la base de datos, o poco conocimiento en las tecnologías con las que iba a trabajar.

### Mala Gestión de la Base de Datos

Durante mucho tiempo he pensado que sería una forma muy rápida y eficaz para un solo desarrollador utilizar un servicio como [Firebase]() ya que permitía no fijarme tanto en el **backend** y centrarme en la parte visual de la aplicación ya que esta es la parte que peor llevo.

El problema que he encontrado es relacionado con como los datos son guardados y relacionados, esto es muy complicado para mi relacionar y mantener la consistencia de los mismos.

La **SOLUCIÓN** que he encontrado es migrar el proyecto a un servicio que yo personalmente solo conocía por algunas veces que he visto en internet y como mucha gente lo recomendaba. El servicio en cuestión se llama [**Supabase**]() y ofrece casi todo lo que ofrece **Firebase** pero con un sistema de gestión de la base de datos **RELACIONAL**.

### Diseño Gráfico de la Aplicación

Siendo un desarrollador dedicado al **backend** , mi experiencia diseñando interfaces es pésima.

La única solución que he encontrado es utilizar un servicio como [**dev.0**]() para diseñar una interfaz mediante una inteligencia artificial, o por lo menos tener una idea con la que trabajar después.

### Falta de Tiempo

Esto es a efecto práctico, que es imposible solucionar. Durante estos dos meses he estado la mayor parte del tiempo documentandome sobre como abarcar un proyecto tan grande siendo solo una persona.

Mis condiciones tanto personales como profesionales no han estado a la altura con un continuo estrés que supone llevar mas de 1 proyecto en solitario, con fechas de entrega iguales.
