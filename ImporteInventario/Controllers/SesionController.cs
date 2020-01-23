using ImporteInventario.Funciones.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ImporteInventario.Controllers
{
    public class SesionController : Controller
    {
        // GET: Sesion
        public ActionResult Login()
        {
            Usuario usuario = new Usuario();
            usuario.numUsuario = 4001;
            usuario.usuario = "INV_SA";
            usuario.contrasena = "SBS_ADMIN_5";
            Funciones.Funciones funciones = new Funciones.Funciones();
            funciones.ObtenerUsuario(usuario);
            return View();
        }

        public ActionResult IniciarSesion()
        {
            try
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                throw;
            }
        }

        public ActionResult CerrarSesion()
        {
            try
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}