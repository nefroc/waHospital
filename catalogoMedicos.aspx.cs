using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using negocio;

namespace waHospital
{
    public partial class catalogoMedicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                obtenerMedicos();
            }
        }

        private void obtenerMedicos() {
            Medicos medicos = new Medicos();

            rMedicos.DataSource = medicos.obtenerMedicos();
            rMedicos.DataBind();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("nuevoMedico.aspx");
        }

        protected void lnkEliminar_Click(object sender, EventArgs e)
        {
            using (RepeaterItem item = (RepeaterItem)((LinkButton)sender).Parent) {
                Medicos medicos = new Medicos();
                string mensaje = medicos.eliminar(Convert.ToInt32(((LinkButton)sender).CommandArgument));
                if (mensaje == "ok")
                {
                    obtenerMedicos();
                }
                else {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('', 'Error al eliminar al médico.', 'error');", true);
                }
            }
        }
    }
}