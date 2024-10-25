![App Brewery Banner](Documentation/AppBreweryBanner.png)

# Flash-Chat

## Our Goal

Lograr contruir una app de mensajeria que le permita a un usuario iniciar sesion por medio de la autenticacion de Firebase y GoogleSignIn tener acceso al chat único de la app, poder enviar mensajes y listarlos en un UITabl# Flash-Chat

Flash-Chat es una aplicación de mensajería en tiempo real que permite a los usuarios registrarse y participar en un chat único, donde pueden ver y enviar mensajes de otros usuarios. Diseñada para ser intuitiva y fácil de usar, Flash-Chat brinda una experiencia de comunicación fluida y efectiva.

## Características

- **Registro y Autenticación**: Los usuarios pueden crear una cuenta o iniciar sesión utilizando su correo electrónico y contraseña. Además, tienen la opción de autenticarse rápidamente a través de Google, lo que simplifica el proceso de acceso.
  
- **Pantalla de Bienvenida**: La aplicación comienza con una pantalla de bienvenida que incluye botones de registro y inicio de sesión. Esto permite a los nuevos usuarios acceder fácilmente a la funcionalidad que ofrece Flash-Chat.

- **Interfaz de Chat**: Después de la autenticación exitosa, los usuarios son dirigidos a la pantalla principal del chat, donde pueden visualizar todos los mensajes enviados por otros usuarios. Esta vista se implementa mediante un `tableView`, lo que permite un desplazamiento suave y una mejor organización de los mensajes.

- **Mensajes en Tiempo Real**: Los mensajes se almacenan en Firebase Database y se actualizan en tiempo real. Esto significa que los usuarios pueden ver los mensajes recién enviados de inmediato, sin necesidad de recargar la pantalla.

- **Perfil de Usuario**: Cada mensaje enviado incluye la foto de perfil del usuario, lo que agrega un toque personal a la experiencia de chat y facilita la identificación de los participantes.

- **Enviar Mensajes**: Los usuarios pueden enviar mensajes de forma rápida y sencilla. Al enviar un mensaje, este aparece de inmediato en el `tableView`, permitiendo una interacción instantánea.

- **Cierre de Sesión**: Los usuarios tienen la opción de cerrar sesión en cualquier momento, regresando a la pantalla de inicio. Esto proporciona un control completo sobre su sesión.

## Tecnologías Utilizadas

- **Firebase**: Utilizado para la autenticación de usuarios y el almacenamiento de mensajes en tiempo real. Firebase proporciona una infraestructura sólida y escalable, garantizando la seguridad de los datos.

- **TableView**: Implementado para la visualización de mensajes, permitiendo una experiencia de usuario optimizada con desplazamiento fluido.

## Capturas de Pantalla

*(Puedes agregar imágenes aquí, por ejemplo:)*

![Pantalla de bienvenida](ruta/a/la/imagen/bienvenida.png)
![Pantalla de chat](ruta/a/la/imagen/chat.png)

## Instalación

1. Clona este repositorio.
2. Asegúrate de tener configurada Firebase en tu proyecto.
3. Instala las dependencias necesarias.
4. Ejecuta la aplicación en tu dispositivo o emulador.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas colaborar, por favor, crea un fork del repositorio y envía un pull request con tus mejoras o correcciones.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.


![End Banner](Documentation/readme-end-banner.png)
