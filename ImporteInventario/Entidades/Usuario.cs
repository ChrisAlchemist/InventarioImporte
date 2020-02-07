using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImporteInventario.Entidades
{
    public class Usuario
    {
        public int NUM_USUARIO { get; set; }
        public string USUARIO { get; set; }
        public string NOMBRE_USUARIO { get; set; }
        public string CONTRASENA { get; set; }
        public string CORREO { get; set; }
        public string TEL_CELULAR { get; set; }
        public int ID_TIPO_USUARIO { get; set; }
        public int ID_DE_SUCURSAL { get; set; }

    }
}