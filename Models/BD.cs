using System.Data.SqlClient;
using Dapper;
namespace tp7.Models;
public class BD{
    private static string _connectionString = @"Server=localhost;DataBase=PreguntadOrt;Trusted_Connection=True;";
    public List<Categorias> ObtenerCategorias(){
        string sql = "SELECT * FROM Categorias";
        List<Categorias> listaC = new List<Categorias>{}; 
        using(SqlConnection db = new SqlConnection(_connectionString)){
           listaC = db.Query<Categorias>(sql).ToList();
        }
        return listaC;
    }
    public List<Dificultades> ObtenerDificultades(){
        string sql = "SELECT * FROM Dificultades";
        List<Dificultades> listaD = new List<Dificultades>{}; 
        using(SqlConnection db = new SqlConnection(_connectionString)){
           listaD = db.Query<Dificultades>(sql).ToList();
        }
        return listaD;
    }
    public List<Preguntas> ObtenerPreguntas(int IdDificultad, int IdCategoria){
        string sql = "SELECT * FROM Preguntas WHERE IdCategoria = @IdCategoria OR @IdCategoria = -1 AND IdDificultad = @IdDificultad OR @IdDificultad = -1";
        List<Preguntas> listaP = new List<Preguntas>{}; 
        using(SqlConnection db = new SqlConnection(_connectionString)){
           listaP = db.Query<Preguntas>(sql, new{IdCategoria = IdCategoria, IdDificultad = IdDificultad}).ToList();
        }
        return listaP;
    }
    public List<Respuestas> ObtenerRespuestas(List<Preguntas> preguntas){
        string sql = "SELECT * FROM Respuestas WHERE IdPregunta = @IdPregunta";
        List<Respuestas> listaR = new List<Respuestas>{};
        using(SqlConnection db = new SqlConnection(_connectionString)){
            foreach(Preguntas id in preguntas){
                listaR = db.Query<Respuestas>(sql,new{IdPregunta = id.IdPregunta}).ToList();
            }
        }
        return listaR;
    }
}