# Bienvenid@ a la demo: ApodapiExample por Fran Ruiz

Esta aplicación es un ejemplo de implementación de la api **APODAPI** obteniendo los datos desde la **NASA's APOD**. Cuando entramos en la aplicación se realiza la descarga de los datos fundamentales para empezar a trabajar, a continuación nos muestra un listado de **planetas** y podemos realizar diferentes acciones sobre esta lista como: Crear, Listar, Actualizar o Eliminar **(CRUD)**.

# Arquitectura Software

La distribución de ficheros e interconexión de las clases mantiene la lógica y estructura oficial de la **Arquitectura Swift Clean**.

## Descarga de Datos

Cuando accedemos a la aplicación el primer paso es la pantalla de **Descarga de datos**, debemos esperar unos segundos para que se realice la conexión con la API, y obtener los valores fundamentales para empezar a trabajar.

## Listado de Elementos Descargados

Una vez todo preparado, automáticamente se abrirá una lista con los **planetas** descargados de la API, de forma asíncrona comenzará la descarga de las imágenes, permitiendo de esta manera aumentar la velocidad de manejo del usuario y no bloquear la aplicación en la pantalla inicial demasiado tiempo.

## Mostrar Detalle de Planetas

Cuando hacemos click en cualquiera de los **planetas** del listado obtendremos el detalle de los mismos, mostrando la imagen en su versión HD y descargándola de forma asíncrona y además, mostrando todos los datos del modelo correspondientes.

## Editar Planetas

En la pantalla de detalle, podemos realizar la **Edición** y el **Guardado** pulsando en la parte superior de la barra de navegación, **es 100% funcional**, si editamos y guardamos veremos actualizada la lista inicial con los nuevos valores.

## Añadir y Eliminar Planetas

En la pantalla de **Listado de Elementos**, en la parte superior de la barra de navegación nos aparece un botón de **Añadir** y que podemos utilizar para insertar **planetas predefinidos** en este caso de nuestro sistema solar.

Para el caso del **Borrado**, en la pantalla de **Listado de Elementos** sólamente es necesario hacer el gesto **Swipe** hacia la izquierda y nos mostrará la opción correspondiente y **100% funcional** de este borrado de elementos.

# Recarga de Datos: Mejora de la Funcionalidad

Si en algún momento, desde el listado principal hemos perdido algún tipo de dato, o simplemente queremos refrescar la lista con los nuevos valores obtenidos por la **APODAPI**, simplemente pulsamos en **Recargar** desde la barra superior de la barra de navegación y se realizará un **Reset** completo, **Sin necesidad de cerrar la aplicación**.
