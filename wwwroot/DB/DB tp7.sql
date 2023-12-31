USE [master]
GO
/****** Object:  Database [preguntadort]    Script Date: 8/8/2023 10:48:13 ******/
CREATE DATABASE [preguntadort]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'preguntadort', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\preguntadort.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'preguntadort_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\preguntadort_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [preguntadort] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [preguntadort].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [preguntadort] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [preguntadort] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [preguntadort] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [preguntadort] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [preguntadort] SET ARITHABORT OFF 
GO
ALTER DATABASE [preguntadort] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [preguntadort] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [preguntadort] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [preguntadort] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [preguntadort] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [preguntadort] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [preguntadort] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [preguntadort] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [preguntadort] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [preguntadort] SET  DISABLE_BROKER 
GO
ALTER DATABASE [preguntadort] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [preguntadort] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [preguntadort] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [preguntadort] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [preguntadort] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [preguntadort] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [preguntadort] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [preguntadort] SET RECOVERY FULL 
GO
ALTER DATABASE [preguntadort] SET  MULTI_USER 
GO
ALTER DATABASE [preguntadort] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [preguntadort] SET DB_CHAINING OFF 
GO
ALTER DATABASE [preguntadort] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [preguntadort] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [preguntadort] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'preguntadort', N'ON'
GO
ALTER DATABASE [preguntadort] SET QUERY_STORE = OFF
GO
USE [preguntadort]
GO
/****** Object:  User [alumno]    Script Date: 8/8/2023 10:48:13 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoría]    Script Date: 8/8/2023 10:48:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoría](
	[IdCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Categoría] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultad]    Script Date: 8/8/2023 10:48:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultad](
	[IdDificultad] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultad] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 8/8/2023 10:48:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [varchar](250) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 8/8/2023 10:48:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[IdRespuesta] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Corrercta] [bit] NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categoría] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'DEPORTE', N'categoria1.jpg')
INSERT [dbo].[Categoría] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'ENTRETENIMIETNO', N'categoria2.jpg')
INSERT [dbo].[Categoría] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'GAMING', N'categoria3.jpg')
INSERT [dbo].[Categoría] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'ARTES', N'categoria4.jpg')
INSERT [dbo].[Categoría] ([IdCategoria], [Nombre], [Foto]) VALUES (5, N'CIENCIA', N'categoria5.jpg')
GO
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (1, N'FACIL')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (2, N'MEDIA')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (3, N'DIFICIL')
INSERT [dbo].[Dificultad] ([IdDificultad], [Nombre]) VALUES (4, N'AVERNO ETERNO')
GO
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'Que seleccion de futbol fue campeona del mundial de 2010?', N'pregunta1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'En que equipo de basquet jugo michael jordan?', N'pregunta2.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'Cual es la seleccion de futbol con mas mundiales ganados?', N'pregunta3.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 1, 2, N'Quien es el maximo campeon de torneos grand slam', N'pregunta4.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 1, 2, N'Quien tiene el record mundial de velocidad en 100 metros?', N'pregunta5.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'Cuanto dura un round de boxeo?', N'pregunta6.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 1, 3, N'Donde se jugo el mundial de futbol del año 1954?', N'pregunta7.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 1, 3, N'Cuando debuto Messi en el barcelona?', N'pregunta8.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 1, 3, N'Aproximadamente, cuando invento el basquet?', N'pregunta9.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 1, 4, N'Quien fue Eric Moussambani?', N'pregunta10.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 1, 4, N'Cuantos deportes existen?', N'pregunta11.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 1, 4, N'Cuales son las reglas del Buzkashi?', N'pregunta12.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 2, 1, N'Como se llamaba el cantante de Queen?', N'pregunnta13.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 2, 1, N'Jack Sparrow es el personaje protagonista de una famosa saga de películas. Cual?', N'pregunta14.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 2, 1, N'De que serie son los Demogorgones?', N'pregunta15.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 2, 2, N'Cual es la pelicula más taquillera de la historia?', N'pregunta16.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 2, 2, N'Cual es la fruta favorita de los minions?', N'pregunta17.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 2, 2, N'Quien fue el actor mas joven en ganar un oscar?', N'pregunta18.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 2, 3, N'Que brujo tiene un gato llamado Azrael?', N'pregunta19.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 2, 3, N'De que color es la G mayuscula en el logotipo de Google?', N'pregunta20.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (21, 2, 3, N'De que se ayuda  El conde de Montecristo  para salir de la carcel?', N'pregunta21.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 2, 4, N'Cuantas peliculas existen?', N'pregunta22.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (23, 2, 4, N'Cuantos libros existen?', N'pregunta23.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (24, 2, 4, N'Cuantos libros y peliculas existen?', N'pregunta24.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (25, 3, 1, N'En que videojuegos aparece la princesa Peach?', N'pregunta25.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (26, 3, 1, N'UFL es un videojuego sobre...', N'pregunta26.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (27, 3, 1, N'El videojuego Battlefront esta basado en las peliculas de...', N'pregunta27.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (28, 3, 2, N'Que videojuego es el mas vendido de todos los tiempos?', N'pregunta28.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (29, 3, 2, N'Cual es la consola mas vendida de la historia?', N'pregunta29.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (30, 3, 2, N'Que tipo de juegos desarrolla Front software?', N'pregunta30.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (31, 3, 3, N'Cual es el videojuego mas caro producido hasta la fecha?', N'pregunta31.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (32, 3, 3, N'Cual es el nombre del jefe final del Dark souls 3?', N'pregunta32.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (33, 3, 3, N'Que comenzo lanzando Nintendo antes que videojuegos?', N'pregunta33.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (34, 3, 4, N'Cual era el nombre original de pac-man', N'pregunta34.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (35, 3, 4, N'Cual es el juego con más km2?', N'pregunta35.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (36, 3, 4, N'En cuantos paises fue baneado el postal 2?', N'pregunta36.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (37, 4, 1, N'Quien pinto La ultima cena?', N'pregunta37.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (38, 4, 1, N'Que artista pinto ''El nacimiento de Venus''?', N'pregunta38.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (39, 4, 1, N'Cual de estos pintores no es italiano?', N'pregunta39.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (40, 4, 2, N'Quien pinto ''El grito''', N'pregunta40.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (41, 4, 2, N'Quien pinto esta obra?', N'pregunta41.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (42, 4, 2, N'asd', N'dssad')
GO
USE [master]
GO
ALTER DATABASE [preguntadort] SET  READ_WRITE 
GO
