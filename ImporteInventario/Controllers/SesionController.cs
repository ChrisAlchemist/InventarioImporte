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