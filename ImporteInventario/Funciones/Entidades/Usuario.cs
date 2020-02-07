using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImporteInventario.Funciones.Entidades
{

    public class Usuario
    {
        public int idUsuario { get; set; }
        public Int64 numUsuario { get; set; }
        public string usuario { get; set; }
        public string nombreUsuario { get; set; }
        public string contrasena { get; set; }
        public string correo { get; set; }
        public string telCelular { get; set; }
        public int idTipoUsuario { get; set; }
        public int idSucursal { get; set; }
        public DateTime fechaAlta { get; set; }
        public string mensaje { get; set; }
        public int estatus { get; set; }

    }
}