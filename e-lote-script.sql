--- Esto es un comentario
/*
	Este es otro comentario
	pero con mas de una
	linea
*/

/*
	Sintaxis para crear una nueva base de datos

	CREATE DATABASE nombreBaseDatos;

*/

CREATE DATABASE demoBD;

/*
	Para correr el codigo SQL escrito damos clic en 
	el boton Ejecutar o presionamos la tecla F5 de 
	nuestro teclado
*/

/*
	Para trabajar con una base de datos, primero
	debemos seleccionarla, con el comando
	USE nombreBD
*/

USE demoBD;

/*
	Al presionar F5 o dar clic al boton ejecutar
	se ejecuta todo el codigo SQL escrito.

	Si lo que desee es ejecutar una porción del codigo
	lo selecciono, y luego presiono F5 o clic en 
	ejecutar.
*/

/*
	Crear tablas: Para crear una tabla, primero debemos
	seleccionar la base de datos sobre la que trabajaremos
	posteriormente creamos la tabla con el comando CREATE.

	Sintaxis para crear tablas.

	CREATE TABLE nombreTabla(
		nombreCampo1 tipoDato propiedades,
		nombreCampo2 tipoDato propiedades,
		...
		nombreCampoN tipoDato propiedades
	);

	tipos de datos mas comunes:
	int, integer - enteros
	varchar, nvarchar - texto
	decimal - decimales
	bit - booleanos
	varbinary - datos binarios

	propiedades mas comunes:
	primary key - para definir llave primaria simple
	null - para definir que el campo permite valores nulos
	not null - para indicar que el campo no permite valores nulos
	identity - para indicar que el campo es autoincrementable
	unique - para indicar que el valor del campo no puede repetirse
	default - para de definir el valor que recibira por defecto el campo
*/

CREATE TABLE estudiante(
	noCarnet VARCHAR(7) primary key, -- se define el campo noCarnet de tipo varchar de 7 caracteres de longitud como llave primaria
	primerNombre varchar(20) not null,
	segundoNombre varchar(20) not null,
	primerApellido varchar(20) not null,
	segundoApellido varchar(20) null,
	fechaNacimiento datetime not null,
	edad int not null,
	direccion varchar(max),
	estatura decimal(3,2) -- los numeros decimales se indica primer la cantidad de cifras y luego la cantidad de destinadas a decimales de esa cifra
);

CREATE TABLE producto(
	codigoProducto int primary key identity(1,1), -- identity define datos autoincrementables, solamente funciona con valores enteros, el primer parametro define el valor inicial, y el segundo el incremento
	nombreProducto varchar(50) not null unique, -- unique indica que el valor del campo no se puede repetir
	precioVenta decimal(5,2) not null,
	existencia decimal(5,2) not null default 0, -- default indica el valor que se tomara por defecto.
	fechaCreacion datetime not null default GETDATE() -- GETDATE() es una funcion propia de sql server que obtiene la fecha y hora actual del servidor.
);