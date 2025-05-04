# 🐞 Entomologyst - Prueba técnica Flutter

¡Hola! 🙌  
Gracias por tomarse el tiempo de revisar esta prueba.  
Mi nombre es [Nombre del Candidato], y estoy emocionado por la oportunidad de formar parte del equipo.

---

## 🧠 ¿Qué se construyó?

Esta es una aplicación desarrollada en **Flutter** que simula una herramienta de registro para entomólogos. Permite ingresar al sistema, registrar insectos, visualizar registros previos y gestionar datos como geolocalización, comentarios y conteos de cada especie.

---

## ✅ Alcance implementado

- Splash screen con lógica de navegación condicional (ingreso por primera vez o no).
- Registro del entomólogo con persistencia local usando `SharedPreferences`.
- Selector de especie con visualización e imágenes por tipo de insecto.
- Registro de conteo por especie con un sistema de tarjetas visuales.
- Arquitectura basada en **MVVM** usando `ChangeNotifier` y separación por capas.
- Widgets adaptativos con `LayoutBuilder` y control de aspecto proporcional.
- Uso correcto y dinámico de assets en base al tipo de insecto.
- Implementación de pruebas unitarias (100% verdes ✅).
- Cumplimiento visual del diseño proporcionado en Figma (Material 3).
- Diseño limpio, consistente y alineado a buenas prácticas.

---

## 🧪 Pruebas

- Se implementaron pruebas unitarias a nivel de lógica de presentación (ViewModels).
- El comando `flutter test --coverage` fue utilizado para asegurar la estabilidad del código.
- Se validaron flujos como actualización de comentarios, conteos y control de flags.

---

## 🔍 Arquitectura

- `domain/`: entidades, modelos puros y base para los view models.
- `viewmodels/`: lógica de negocio reactiva que comunica la UI con el dominio.
- `ui/pages`: pantallas principales de la aplicación.
- `ui/widgets`: componentes reutilizables con responsabilidad única.
- `services/`: espacio pensado para futuras integraciones como geolocalización o almacenamiento externo.

---

## 📸 Diseño

- Todos los tamaños, márgenes, proporciones y colores fueron tomados directamente del archivo Figma.
- Se utilizó `ProjectorWidget` para facilitar pruebas en diferentes dispositivos respetando la relación de aspecto original.

---

## 🙋‍♂️ Sobre mí

Aunque me considero aún en proceso de crecimiento profesional, puse todo mi empeño y enfoque en esta prueba. Me entusiasma seguir aprendiendo y crecer como desarrollador Flutter, y sería un honor hacerlo con ustedes.

---

## 💌 Gracias

Gracias nuevamente por la oportunidad. Estaré muy atento a cualquier comentario, observación o feedback constructivo.  
¡Espero con ilusión poder formar parte del equipo! 🚀

Un cordial saludo,  
**[Nombre del Candidato]**
