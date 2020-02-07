using AccesoDatos;
using ImporteInventario.Funciones.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ImporteInventario.Funciones
{
    public class Funciones
    {
        private DBManager dbManager = null;
        public Usuario ObtenerUsuario(Usuario usuario1)
        {
            
            Usuario usuario = null;
            try
            {
                using (dbManager = new DBManager("Server=LAPTOP-OJR9C83G\\SQLEXPRESS;Database=ImporteInventario;User Id=INV_USER;Password=Abcde2"))
                {
                    dbManager.Open();
                    dbManager.CreateParameters(3);
                    dbManager.AddParameters(0, "@numUsuario", usuario1.numUsuario);
                    dbManager.AddParameters(1, "@usuario", usuario1.usuario);
                    dbManager.AddParameters(2, "@contrasena", usuario1.contrasena);
                    
                    dbManager.ExecuteReader(CommandType.StoredProcedure, "SP_INVENTARIO_VALIDAR_USUARIO");
                    if (dbManager.DataReader.Read())
                    {
                        usuario = new Usuario();
                        usuario.estatus = Convert.ToInt32(dbManager.DataReader["estatus"].ToString());
                        
                        if (usuario.estatus == 200)
                        {
                            
                            usuario.mensaje = dbManager.DataReader["mensaje"].ToString();
                            //usuario.idUsuario = Convert.ToInt32(dbManager.DataReader["ID_USUARIO"].ToString());
                            usuario.usuario = dbManager.DataReader["USUARIO"].ToString();
                            usuario.numUsuario = Convert.ToInt64(dbManager.DataReader["NUM_USUARIO"].ToString());
                            usuario.idSucursal = Convert.ToInt32(dbManager.DataReader["ID_DE_SUCURSAL"].ToString());
                            usuario.nombreUsuario = dbManager.DataReader["NOMBRE_USUARIO"].ToString();
                            usuario.idTipoUsuario = Convert.ToInt32(dbManager.DataReader["ID_TIPO_USUARIO"].ToString());
                            //usuario.contrasena = dbManager.DataReader["CONTRASENA"].ToString();
                            usuario.correo = dbManager.DataReader["CORREO"].ToString();
                            usuario.telCelular = dbManager.DataReader["TEL_CELULAR"].ToString();
                            //usuario.fechaAlta = Convert.ToDateTime(dbManager.DataReader["FECHA_ALTA"].ToString());
                        }
                        else
                        {
                            usuario.mensaje = dbManager.DataReader["error_message"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return usuario;

        }

    }
}