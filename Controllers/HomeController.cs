using Microsoft.AspNetCore.Mvc;
using tp7.Models;
namespace tp7.Controllers;
public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult ConfigurarJuego()
    {
        Juego.inicializarJuego();
        ViewBag.categorias = Juego.ObtenerCategorias();
        ViewBag.dificultades = Juego.ObtenerDificultades();
        return View();
    }
    public IActionResult Comenzar(string username, int dificultad, int categoria){
        
        return View();
    }
        public IActionResult Creditos(string username, int dificultad, int categoria){
        
        return View();
    }
}
