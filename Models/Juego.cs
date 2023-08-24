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
    public static void CargarPartida(string USERNAME, int dificultad, int categoria)
    {
        preguntas = BD.ObtenerPreguntas(dificultad,categoria);
        respuestas = BD.ObtenerRespuestas(preguntas);
        username = USERNAME;
    }
    public static Preguntas ObtenerProximaPregunta()
    {
        var rnd = new Random();
        Preguntas devolver = preguntas[rnd.Next(0,preguntas.Count)];
        return devolver;
    }
    public static List<Respuestas> ObtenerProximasRespuestas(int Pregunta)
    {
        List<Respuestas> devolver = new List<Respuestas>();
        foreach (Respuestas respuesta in respuestas)
        {
            if(respuesta.IdPregunta == Pregunta){
                devolver.Add(respuesta);
            }
        }
        return devolver;
    }
    public static bool VerificarRespuesta(int Pregunta, int Respuesta)
    {
        bool devolver = false;
        if(respuestas[Respuesta].IdPregunta == Pregunta && respuestas[Respuesta].Correcta == true){
            cantidadPreguntasCorrectas++;
            puntajeActual += 100;
            respuestas.RemoveAt(Respuesta);
        }
        return devolver;
    }
}