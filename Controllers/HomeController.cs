using Microsoft.AspNetCore.Mvc;
using tp7.Models;
namespace tp7.Controllers;
public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult ConfigurarJuego(){
        Juego.inicializarJuego();
        ViewBag.categorias = Juego.ObtenerCategorias();
        ViewBag.dificultades = Juego.ObtenerDificultades();
        //Falta hacer que se guarden la categoria elegida, la dificultad y el nombre
        return View();
    }
    public IActionResult Comenzar(string username, int dificultad, int categoria){
        Juego.CargarPartida(username,dificultad,categoria);
        if(Juego.ObtenerProximaPregunta == null){
            return RedirectToAction("confi",ConfigurarJuego);
        }
        return RedirectToAction("juego",Jugar);
    }
    public IActionResult Jugar(){
        if(Juego.ObtenerProximaPregunta == null){
            //return RedirectToAction("termino",Fin);
            return View();
        }
        ViewBag.preg_actual = Juego.ObtenerProximaPregunta();
        ViewBag.respuestas_actual = Juego.ObtenerProximasRespuestas(ViewBag.preg_actual);
        return View();
    }
    [HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta){
        ViewBag.Correcta = Juego.VerificarRespuesta(idPregunta,idRespuesta);
        if(ViewBag.Correcta = false){
            ViewBag.total_respuestas = Juego.ObtenerProximasRespuestas(idPregunta);
            for (int i = 0; i < ViewBag.total_respuestas.length; i++){
                if(ViewBag.total_respuestas[i].Correcta == true){
                    ViewBag.respuesta_correcta = ViewBag.total_respuestas[i];
                }
            }
        }
        return View();
    }
}
