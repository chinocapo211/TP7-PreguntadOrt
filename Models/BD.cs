using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;
namespace tp7.Models;
public static class BD
{
    private static string _connectionString = @"Server=localhost;DataBase=PreguntadOrt;Trusted_Connection=True;";
    
    public static List<Categorias> ObtenerCategorias()
    {
        string sql = "SELECT * FROM Categorias";
        List<Categorias> listaC = new List<Categorias>{}; 
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
           listaC = db.Query<Categorias>(sql).ToList();
        }
        return listaC;
    }
    public static List<Dificultades> ObtenerDificultades()
    {
        string sql = "SELECT * FROM Dificultades";
        List<Dificultades> listaD = new List<Dificultades>{}; 
        using(SqlConnection db = new SqlConnection(_connectionString)){
           listaD = db.Query<Dificultades>(sql).ToList();
        }
        return listaD;
    }
    public static List<Preguntas> ObtenerPreguntas(string Dificultad, string Categoria)
    {
        int idCategoria = 0, idDificultad = 0;
        string sql;
        List<Categorias> listaC = ObtenerCategorias();
        List<Dificultades> listaD = ObtenerDificultades(); 
        if(Categoria != "TODAS" && Dificultad == "TODAS")
        {
            for (int i = 0; i < listaC.Count; i++)
            {
                if(listaC[i].Nombre == Categoria)
                {
                    idCategoria = listaC[i].IdCategoria;
                }   
            }
            sql = "SELECT * FROM Preguntas WHERE IdCategoria = @IdCategoria";
        }
        else if(Categoria == "TODAS" && Dificultad != "TODAS")
        {
            for (int i = 0; i < listaD.Count; i++)
            {
                if(listaD[i].Nombre == Dificultad)
                {
                    idDificultad = listaD[i].IdDificultad;
                }   
            }
            sql = "SELECT * FROM Preguntas WHERE IdDificultad = @IdDificultad";
        }
        else if (Categoria != "TODAS" && Dificultad != "TODAS")
        {
            for (int i = 0; i < listaC.Count; i++)
            {
                if(listaC[i].Nombre == Categoria)
                {
                    idCategoria = listaC[i].IdCategoria;
                }   
            }
            for (int i = 0; i < listaD.Count; i++)
            {
                if(listaD[i].Nombre == Dificultad)
                {
                    idDificultad = listaD[i].IdDificultad;
                }   
            }
            sql = "SELECT * FROM Preguntas WHERE IdDificultad = @IdDificultad, IdCategoria = @IdCategoria";
        }
        else sql = "SELECT * FROM Preguntas";

        List<Preguntas> listaP = new List<Preguntas>{}; 
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
           listaP = db.Query<Preguntas>(sql, new{IdCategoria = idCategoria, IdDificultad = idDificultad}).ToList();
        }
        return listaP;
    }
    public static List<Respuestas> ObtenerRespuestas(List<Preguntas> preguntas)
    {
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