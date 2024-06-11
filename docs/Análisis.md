# **MVP** - Análisis

## Tabla de Contenidos

1. [Descripción general](#mvp---descripción-general)
2. [Funcionalidades](#mvp---funcionalidades)
    - [Manejo de Organizaciones](#manejo-de-organizaciones)
    - [Manejo de Usuarios](#manejo-de-usuarios)
    - [Servicio de Notificaciones](#servicio-de-notificationes)
    - [Manejo de Horarios](#manejo-de-horarios)
    - [Manejo de clases](#manejo-de-clases)
    - [Seguimiento del estado de los caballos](#siguimiento-del-estado-de-los-caballos)
3. [Normativa](#normativa)

## **MVP** - Descripción general 

En este apartado veremos todas las funcionalidades que se desean implementar en el sistema, así como la normativa que se debe cumplir.

> **Nota:** Este documento se encuentra en constante actualización.
>
> **Nota:** Las funcionalidades se detallarán de forma mas completa en sus respectivas secciones.

- [**Manejo de Organizaciones**](#manejo-de-organizaciones) : Manejo simple de las organizaciones . Principalmente utilizado como clasificación de materiales proporcionados.
- [**Manejo de Usuarios**](#manejo-de-usuarios) : Un manejo simple de usuarios, con roles y permisos.
- [**Servicio de Notificaciones**](#servicio-de-notificationes) : Un servicio básico de alertas, recordatorios y notificaciones.
- [**Manejo de Horarios**](#manejo-de-horarios) : Un manejo de horarios con posicionamiento de clases.
- [**Manejo de clases**](#manejo-de-clases)   : Un manejo de afluencia a las clases, seguimiento de asistencia y la posibilidad de recuperar     las clases en otro momento.
- [**Seguimiento del estado de los caballos**](#siguimiento-del-estado-de-los-caballos) : Se desea implementar un simple pero eficaz motorización de los caballos.

## **MVP** - Funcionalidades

En este apartado se detallarán las funcionalidades que se desean implementar en el sistema.

> **Nota:** Este documento se encuentra en constante actualización.

### Manejo de Organizaciones

La aplicación deberá permitir la creación de organizaciones, las cuales serán utilizadas básicamente como clasificación de recursos (Usuarios, Clases, Caballos, etc...) bajo el mismo nombre. 

Una organización deberá tener los siguientes datos:

- **Nombre** : Nombre de la organización.
- **Ubicación** : Ubicación de la organización.
- **Descripción** : Descripción de la organización.
- **Logo** : Imagen de la organización.
- **Plan de Suscripción** : Un plan de pago elegido por la organización. **(No es parte del MVP)**
- **Datos de Contacto** : Datos de contacto de la organización.
- **Analítica** : Datos relevantes como la cantidad de usuarios totales/activos, etc... **(No es parte del MVP)**

> **Nota** : En un documento posterior se explicará mas a detalle el servicio de **Clasificación**

### Manejo de Usuarios

La aplicación debe permitir un acceso restringido a los usuarios a la plataforma.

Se debe implementar un sistema de roles y permisos:
- **Roles**:
    
    > **Nota:** Los roles se pueden combinar entre si, por lo que un usuario puede tener mas de un rol asignado.

    - **Administrador** : Tendrá el acceso a todas las funcionalidades de la plataforma. Tendrá las restricciones de acceso a los datos de las organizaciones, pero con la posibilidad de solicitarlo a los organizadores para los mantenimientos necesarios.

    - **Organizador** : Tendrá acceso a las funcionalidades de su organización. Como crear nuevos usuarios que pertenecerán solo a dicha organización, creación del espacio de trabajo y correcta organización del centro.

    - **Instructor** : Tendrá acceso a modificación de sus pertinentes lecciones, como aceptar nuevos miembros que quieran recuperar una asignatura, o la asignación de los caballos a los jinetes.

    - **Jinete**: Tendrá acceso a la información de sus clases, como la posibilidad de recuperar una clase perdida, o la información de los caballos que le han sido asignados.

    - **Jinete-No-Capaz** : Tendrá acceso unicamente informativo a la plataforma. Por lo que no podrá realizar ninguna acción en la misma.

    - **Responsable-Jinete** : Como parte del publico que va a utilizar la aplicación podrá ser menor de edad, toda las responsabilidad que pueda ejercer el **Jinete-No-Capaz** recaerá sobre los tutores del mismo. Por lo que tendrán acceso igual a **Jinete**.

- **Datos a tratar de los Usuarios**:

    - **Nombre** : Nombre del usuario.
    - **Apellidos** : Apellidos del usuario.
    - **Correo Electrónico** : Correo electrónico del usuario.
    - **Contraseña** : Contraseña del usuario.
    - **Rol** : Rol del usuario.
    - **Fecha de Nacimiento** : Fecha de nacimiento del usuario.
    - **Ubicación** : La ubicación a tratar es **aproximada**. Se trata de la ubicación de la organización a la que pertenece el usuario.
    - **Disposivo** : Dispositivo en el que se está utilizando la aplicación.

> **Nota** : Se baraja la posibilidad de autorización mediante un codigo de un solo uso enviado por correo electrónico.

### Servicio de Notificationes

Para cada organización se le proporcionara *varios medios de contacto con sus usuarios.

> *varios : Propia aplicación. **Mejora a Futuro** : Correo elecrtónico, WhatsApp, Telegram...

### Manejo de Horarios

Cada organización tendrá la posibilidad de crear uno o varios horarios de clase e ir alternadolos según las necesidades.

> **Nota** : En un documento posterior se explicará mas a detalle el servicio de **Horarios**

- **Datos**:
    - **Nombre** : Nombre del horario.
    - **Descripción** : Descripción del horario.



### Manejo de Clases

Cada organización tendrá la posibilidad de crear clases y asignarlas a un horario.

> **Nota** : En un documento posterior se explicará mas a detalle el servicio de **Clases**

- **Datos**:
    - **Nombre** : Nombre de la clase.
    - **Descripción** : Descripción de la clase.
    - **Horarios** : Horarios al que pertenece la clase. (recordar que nadie se quire repetir 5 veces)
    - **Instructor** : Instructor de la clase.
    - **Jinetes** : Jinetes que asistirán a la clase.
    - **Caballo** : Caballo asignado a la clase.


> **Nota** : De momento aqui no tengo lo sufucientemente claro como intercalar a los jinetes con los caballos. Por lo que se puede cambiar en un futuro.

### Siguimiento del estado de los caballos

El caballo por si es una parte fundamental de la aplicación. Por lo que se desea implementar un sistema de seguimiento de los mismos.

- **Datos**:
    - **Nombre** : Nombre del caballo.
    - **Descripción** : Descripción del caballo.
    - **Edad** : Edad del caballo.
    - **Raza** : Raza del caballo.
    - **Peso** : Peso del caballo.
    - **Altura** : Altura del caballo.
    - **Estado** : Estado del caballo. (Enfermo, Sano, etc...)
    - **Observaciones** : Observaciones del caballo.

A parte habrá un documento que detallará las visitas médicas, las vacunas, etc...

- **Datos**:
    - **Fecha** : Fecha de la visita.
    - **Tipo** : Tipo de visita.
    - **Observaciones** : Observaciones de la visita.
    - **Contacto** : Contacto del veterinario.

Tambien se quiere hacer un siguimiento de las dietas

- **Datos**:
    - **Fecha** : Fecha de la dieta.
    - **Tipo** : Tipo de dieta.
    - **Observaciones** : Observaciones de la dieta.

> **Nota** : Coger la información dada con cuidado, lo mas serguro es que cambie radicalmente durante el desarrollo.

## Normativa

No tengo ni idea de como hacer un aviso legal. Por lo que se buscará información y se intentará hacer lo mejor posible cerca de las fechas de presentación y de lanzamiento. Todavía no se muchos aspectos a realizar dentro de la aplicación como para saber que aspectos legales se deben tener en cuenta.

## Problemas y Soluciones

Durante el desarrollo me he encontrado con un grave problema de consistencia de datos utilizando una base de datos no relacional de **Firebase**. Por lo que he decidido cambiar a una base de datos relacional de **PostgreSQL** que ademas tambien actua como un `Backend as a Service`. Devido a esta migración se ha tenido que retrasar el desarrollo de la aplicación.

El servicio es [Supabase](https://supabase.io/), incorpora casi las mismas funcionalidades que Firebase, pero con la ventaja de que es de código abierto y se puede instalar en un servidor propio o que además utiliza una base de datos relacional para la gestión de datos.