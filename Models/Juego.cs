public class Juego{
    static private string username{get;set;}
    static private int puntajeActual{get;set;}
    static private int cantidadPreguntasCorrectas{get;set;}
    static private List<Preguntas> preguntas{get;set;}
    static private List<Respuestas> respuestas{get;set;}
    public void inicializarJuego(){
        username = "";
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }
    public List<Categorias> ObtenerCategorias(){
        List<Categorias> devolver = new List<Categorias>();
        devolver = BD.ObtenerCategorias();
        return devolver;
    }
    public List<Dificultades> ObtenerDificultades(){
        List<Dificultades> devolver = new List<Dificultades>();
        devolver = BD.ObtenerDificultades();
        return devolver;
    }
    public void CargarPartida(string USERNAME, int dificultad, int categoria){
        preguntas = BD.ObtenerPreguntas(dificultad,categoria);
        preguntas.Shuffle();
        respuestas = BD.ObtenerRespuestas(preguntas);
        username = USERNAME;
    }
    public Preguntas ObtenerProximaPregunta(){
        int i;
        if(i == 0){
            i = 0;
        }
        Preguntas devolver = preguntas[i];
        i = i + 1;
        return devolver;
    }
    public Respuestas ObtenerProximasRespuestas(int idPregunta){
        for (int i = 0; i < Respuestas; i++)
        {
            if(respuestas[i].idPregunta == idPregunta){
                return respuestas[i];
            }
        }
        return null;
    }
    
}