using AccesoDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ImporteInventario.Entidades
{
    public class Funciones
    {
        private DBManager dbManager = null;


        public Usuario ObtenerUsuario()
        {
            Usuario usuario = new Usuario(); 
            try
            {
                using (dbManager = new DBManager("Server=cmv8049;Database=une;User Id=Presence;Password=Abcde1"))
                {
                    dbManager.Open();
                    dbManager.CreateParameters(9);
                    dbManager.AddParameters(0, "@vContactID", iframe.vContactID);
                    dbManager.AddParameters(1, "@vCallType", iframe.vCallType);
                    dbManager.AddParameters(2, "@vPhone", iframe.vPhone);
                    dbManager.AddParameters(3, "@vServiceID", iframe.vServiceID);
                    dbManager.AddParameters(4, "@vAgenteID", iframe.vAgenteID);
                    dbManager.AddParameters(5, "@folio", DatosReporte.folio);
                    dbManager.AddParameters(6, "@moduloAtencion", DatosReporte.moduloAtencion);
                    dbManager.AddParameters(7, "@nombreAgente", iframe.AgenteAtiende);
                    if (DatosReporte.moduloAtencion == Enumeraciones.CAT_MODULO_ATENCION.FRAUDES)
                    {
                        dbManager.AddParameters(8, "@idSeguimiento", iframe.vID_CC_Fraudes);
                    }
                    else if (DatosReporte.moduloAtencion == Enumeraciones.CAT_MODULO_ATENCION.CALL_CENTER)
                    {
                        dbManager.AddParameters(8, "@idSeguimiento", iframe.vID_Fraudes_CC);
                    }


                    dbManager.ExecuteReader(CommandType.StoredProcedure, "SP_CALLCENTER_REGISTRAR_LLAMADA");
                    if (dbManager.DataReader.Read())
                    {
                        llamadaRegistrada = Convert.ToInt32(dbManager.DataReader["estatus"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return llamadaRegistrada;

        }
    }
}