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
    public partial class nuevoMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("catalogoMedicos.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            DateTime fecha;
            if (DateTime.TryParse(txtFechaNacimiento.Text, out fecha))
            {
                Medicos medicos = new Medicos();
                string mensaje = medicos.insertar(txtNombre.Text, txtApellidos.Text, fecha, txtEspecialidad.Text);
                if (isNumero(mensaje))
                {
                    Response.Redirect("catalogoMedicos.aspx");
                }
                else {
                    lblMensaje.Text = mensaje;
                }
            }
            else {
                lblMensaje.Text = "Ingrese una fecha de nacimiento válida.";
            }
        }

        private bool isNumero(string texto) {
            int num = 0;
            return int.TryParse(texto, out num);
        }
    }
}