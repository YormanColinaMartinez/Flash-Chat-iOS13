# Flash-Chat

Flash-Chat es una aplicación de mensajería en tiempo real diseñada para facilitar la comunicación entre usuarios. Con una interfaz intuitiva y una experiencia de usuario fluida, permite a los participantes registrarse y participar en un chat único, donde pueden ver y enviar mensajes en tiempo real.

## Características

- **Registro y Autenticación**: Los usuarios pueden crear una cuenta o iniciar sesión utilizando su correo electrónico y contraseña. La autenticación rápida a través de Google facilita el acceso.

- **Pantalla de Bienvenida**: La aplicación inicia con una pantalla de bienvenida que incluye botones de registro e inicio de sesión, brindando un acceso fácil y directo a la funcionalidad de la aplicación.

- **Interfaz de Chat**: Tras una autenticación exitosa, los usuarios son dirigidos a la pantalla principal del chat, donde pueden ver todos los mensajes enviados. Esta vista está implementada mediante un `tableView`, garantizando un desplazamiento suave y una presentación ordenada de los mensajes.

- **Mensajes en Tiempo Real**: Los mensajes se almacenan en Firebase Database y se actualizan en tiempo real, permitiendo a los usuarios ver inmediatamente los mensajes recién enviados.

- **Perfil de Usuario**: Cada mensaje incluye la foto de perfil del usuario, lo que mejora la experiencia de chat y ayuda a los participantes a identificarse entre sí.

- **Enviar Mensajes**: Los usuarios pueden enviar mensajes de forma rápida, los cuales se muestran de inmediato en el `tableView`, promoviendo la interacción instantánea.

- **Cierre de Sesión**: Los usuarios tienen la opción de cerrar sesión en cualquier momento, regresando a la pantalla de inicio y asegurando un control total sobre su sesión.

## Arquitectura

Flash-Chat está construida utilizando la arquitectura **MVVM (Model-View-ViewModel)**, lo que mejora la separación de preocupaciones y facilita la escalabilidad y el mantenimiento del código.

## Tecnologías Utilizadas

- **Swift**: La aplicación fue desarrollada en Swift, aprovechando sus características modernas y su seguridad.

- **Firebase**: Para la autenticación de usuarios y el almacenamiento de mensajes en tiempo real, asegurando una infraestructura escalable y segura.

- **Cocoapods**: Se utiliza para la gestión de dependencias, facilitando la integración de bibliotecas y frameworks externos.

- **GoogleSignIn**: Implementado para permitir el inicio de sesión rápido y seguro a través de cuentas de Google.

- **AutoLayout**: Utilizado para crear interfaces de usuario responsivas y adaptables en diferentes tamaños de pantalla.

- **TableView**: Para la visualización eficiente de mensajes, garantizando una experiencia de usuario optimizada.

## Capturas de Pantalla

*(Puedes agregar imágenes aquí, por ejemplo:)*

## Pantalla de Bienvenida
<img src="https://github.com/YormanColinaMartinez/Flash-Chat-iOS13/blob/master/Flash%20Chat%20iOS13/Resources/Images/WelcomeView.png?raw=true" alt="Login View" width="300" height="600"/>

## Pantalla de Registro
![Pantalla de Registro]<img src="https://github.com/YormanColinaMartinez/Flash-Chat-iOS13/blob/master/Flash%20Chat%20iOS13/Resources/Images/RegisterView.png?raw=true" alt="Login View" width="300" height="600"/>

## Pantalla de Login
![Pantalla de Login]<img src="https://github.com/YormanColinaMartinez/Flash-Chat-iOS13/blob/master/Flash%20Chat%20iOS13/Resources/Images/LoginView.png?raw=true" alt="Login View" width="300" height="600"/>

## Instalación

1. Clona este repositorio.
2. Asegúrate de tener configurada Firebase en tu proyecto.
3. Instala las dependencias necesarias utilizando Cocoapods.
4. Ejecuta la aplicación en tu dispositivo o emulador.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas colaborar, por favor, crea un fork del repositorio y envía un pull request con tus mejoras o correcciones.

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.



![End Banner](Documentation/readme-end-banner.png)
