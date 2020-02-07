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
            usuario.contrasena = "SBS_ADMIN_54";
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
        [HttpPost]
        public ActionResult ValidaUsuario(Usuario usuario)
        {
            try
            {
                Funciones.Funciones funciones = new Funciones.Funciones();
                usuario = funciones.ObtenerUsuario(usuario);
                if (usuario.estatus == 200)
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return Json(new { estatus = usuario.estatus, mensaje = usuario.mensaje }, JsonRequestBehavior.AllowGet);
                }
                
            }
            catch (Exception ex)
            {
                return new HttpStatusCodeResult(500, ex.Message);
            }
        }
    }
}