using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen2
{
    public partial class MenuTienda : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ExamenConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("select C.Nombre,P.Nombre,P.Precio,MR.Piso " +
                    "from Venta V " +
                    "inner join Cajeros C on V.Cajero = C.Codigo " +
                    "inner join Productos P on V.Producto = P.Codigo " +
                    "inner join Maquinas_Registradora MR on V.Mquina = MR.Codigo"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void Registrar()
        {

            
            salvar();
            
        }

        protected void salvar()
        {

            String s = System.Configuration.ConfigurationManager.ConnectionStrings["HospitalConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" INSERT into Venta (Cajero,Mquina, Producto) Values (" + DropDownList1.SelectedValue + ", " + DropDownList2.SelectedValue + ",  " + DropDownList3.SelectedValue + ")", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();

            LlenarGrid();
        }

 
    }
}