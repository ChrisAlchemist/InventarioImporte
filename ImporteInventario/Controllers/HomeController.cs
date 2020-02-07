using ImporteInventario.Funciones.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ImporteInventario.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            /*
            Usuario usuario = new Usuario();
            usuario.numUsuario = 4001;
            usuario.usuario = "INV_SA";
            usuario.contrasena = "SBS_ADMIN_5";
            Funciones.Funciones funciones = new Funciones.Funciones();
            usuario = funciones.ObtenerUsuario(usuario);
            if(usuario.estatus == 200)
            {*/
                return View();
            /*}
            else
            {
                
                return RedirectToAction("Login", "Sesion");
            }*/
            
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}