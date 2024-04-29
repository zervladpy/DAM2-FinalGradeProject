# **MVP** - Analisis

## Tabla de Contenidos

1. [Descripción general](#mvp---descripción-general)
2. [Funcionalidades](#mvp---funcionalidades)
    - [Manejo de Organizaciones](#manejo-de-organizaciones)
    - [Manejo de Usuarios](#manejo-de-usuarios)
    - [Servicio de Notificationes](#servicio-de-notificationes)
    - [Manejo de Horarios](#manejo-de-horarios)
    - [Maenjo de clases](#manejo-de-clases)
    - [Siguimiento del estado de los caballos](#siguimiento-del-estado-de-los-caballos)
3. [Normativa](#normativa)

## **MVP** - Descripción general 

En este apartado veremos todas las funcionalidades que se desean implementar en el sistema, así como la normativa que se debe cumplir.

> **Nota:** Este documento se encuentra en constante actualización.
>
> **Nota:** Las funcionalidades se detallarán de forma mas completa en sus respectivas secciones.

- [**Manejo de Organizaciones**](#manejo-de-organizaciones) : Manejo simple de las organizacines. Principalemente utlizado como clasificación de materiales proporcionados.
- [**Manejo de Usuarios**](#manejo-de-usuarios) : Un manejo simple de usarios, con roles y permisos.
- [**Servicio de Notificationes**](#servicio-de-notificationes) : Un servicio basico de alertas, recordatorios y notificaciones.
- [**Manejo de Horarios**](#manejo-de-horarios) : Un manejo de horarios con posicionamiento de clases.
- [**Maenjo de clases**](#manejo-de-clases)   : Un manejo de afulencia a las clases, siguimiento de asistencia y la posibilidad de recuperar     las clases en otro momento.
- [**Siguimiento del estado de los caballos**](#siguimiento-del-estado-de-los-caballos) : Se desea implementar un simple pero eficaz monitoreo de los caballos.

## **MVP** - Funcionalidades

En este apartado se detallarán las funcionalidades que se desean implementar en el sistema.

> **Nota:** Este documento se encuentra en constante actualización.

### Manejo de Organizaciones

La aplicación deberá permitir la creación de organizaciones, las cuales serán utilizadas basicamente como clasificación de recursos (Usuarios, Clases, Caballos, etc...) bajo el mismo nombre. 

Una organzación deberá tener los siguientes datos:

- **Nombre** : Nombre de la organización.
- **Ubicación** : Ubicación de la organización.
- **Descripción** : Descripción de la organización.
- **Logo** : Imagen de la organización.
- **Plan de Suscripción** : Un plan de pago elegido por la organización. **(No es parte del MVP)**
- **Datos de Contacto** : Datos de contacto de la organización.
- **Anliticas** : Datos relevantes como la cantidad de usuarios totales/activos, etc... **(No es parte del MVP)**

> **Nota** : En un documento posterior se explicará mas a detalle el servicio de **Clasificación**

### Manejo de Usuarios

La aplicación debe permitir un acceso restringido a los usarios a la plataforma.

Se debe implementar un sistema de roles y permisos:
- **Roles**:
    
    > **Nota:** Los roles se pueden combinar entre si, por lo que un usuario puede tener mas de un rol asignado.

    - **Administrador** : Tendrá el acceso a todas las funcionalidades de la plataforma. Tendrá las restricciones de acceso a los datos de las organizaciones, pero con la posibilidad de solicitarlo a los organizadores para los mantenimientos necesarios.

    - **Organizador** : Tendrá acceso a las funcionalidades de su organización. Como crear nuevos usuarios que pertenecerán solo a dicha organización, creacion del espacio de trabajo y correcta organizacion del centro.

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

En concordancia con las regulaciones de protección de datos, se llevará a cabo la recopilación de información personal de manera limitada y específica. Los datos que se recolectarán incluirán nombres, ubicaciones aproximadas, así como nombres y licencias.

Es fundamental resaltar que esta recopilación se realiza con el objetivo de brindar un servicio más personalizado y eficiente, garantizando en todo momento la privacidad y seguridad de los individuos involucrados.

En cumplimiento de las disposiciones legales, se implementarán medidas de seguridad adecuadas para proteger la confidencialidad de los datos recopilados. Asimismo, se seguirán las directrices establecidas por la Ley Orgánica de Protección de Datos Personales y garantía de los derechos digitales (LOPDPGDD) y el Reglamento General de Protección de Datos (GDPR), asegurando el cumplimiento de las normativas pertinentes en materia de protección de datos.

Se proporcionará información clara y transparente sobre el uso y tratamiento de los datos personales recopilados, incluyendo la identificación de la persona responsable del tratamiento de los datos y los fines para los cuales serán utilizados.

Además, se implementarán mecanismos para garantizar que los individuos puedan ejercer sus derechos de acceso, rectificación, cancelación y oposición respecto a sus datos personales, conforme a lo establecido por la legislación aplicable.

Este enfoque garantiza el equilibrio entre la recopilación de datos necesaria para el funcionamiento del proyecto y el respeto a la privacidad y los derechos de los individuos.

