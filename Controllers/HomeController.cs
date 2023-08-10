using Microsoft.AspNetCore.Mvc;

namespace TPBase.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult ConfigurarJuego(){
        
        return View();
    }
}
