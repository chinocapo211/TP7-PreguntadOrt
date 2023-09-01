namespace tp7.Models;
using System.Collections.Generic;
public static class Juego
{
    static private string username;
    static private int puntajeActual;
    static private int cantidadPreguntasCorrectas;
    static private List<Preguntas> preguntas;
    static private List<Respuestas> respuestas;

    public static void inicializarJuego()
    {
        username = "";
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }
    public static List<Categorias> ObtenerCategorias()
    {
        List<Categorias> devolver = new List<Categorias>();
        devolver = BD.ObtenerCategorias();
        return devolver;
    }
    public static List<Dificultades> ObtenerDificultades()
    {
        List<Dificultades> devolver = new List<Dificultades>();
        devolver = BD.ObtenerDificultades();
        return devolver;
    }
    public static void CargarPartida(string USERNAME, string dificultad, string categoria)
    {
        preguntas = BD.ObtenerPreguntas(dificultad,categoria);
        respuestas = BD.ObtenerRespuestas(preguntas);
        username = USERNAME;
    }
    public static Preguntas ObtenerProximaPregunta()
    {
        var rnd = new Random();
        Preguntas devolver = preguntas[rnd.Next(0,preguntas.Count)];
        preguntas.RemoveAt(devolver.IdPregunta);
        return devolver;
    }
    public static List<Respuestas> ObtenerProximasRespuestas(int Pregunta)
    {
        List<Respuestas> devolver = new List<Respuestas>();
        for (int i = 0; i < respuestas.Count; i++)
        {
            if(respuestas[i].IdPregunta == Pregunta){
                devolver.Add(respuestas[i]);
            }
        }
        return devolver;
    }
    public static bool VerificarRespuesta(int Pregunta, string Respuesta)
    {
        bool devolver = false;
        for (int i = 0; i < respuestas.Count; i++)
        {
            if(respuestas[i].Contenido == Respuesta && respuestas[i].IdPregunta == Pregunta )
            {
                devolver = respuestas[i].Correcta;
                cantidadPreguntasCorrectas++;
                puntajeActual += 100;
            }   
        }
        return devolver;
    }

    public static int Puntaje()
    {
        int devolver = puntajeActual;
        return devolver;
    }

    public static int RespuestasCorrectas()
    {
        int devolver = cantidadPreguntasCorrectas;
        return devolver;
    }

    public static string NombredeUsuario()
    {
        string devolver = username;
        return devolver;
    }
}