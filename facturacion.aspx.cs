using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace waHospital
{
    public partial class facturacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            DateTime fechaInicial, fechaFinal;
            try
            {
                fechaInicial = Convert.ToDateTime(txtFechaInicial.Text);
                fechaFinal = Convert.ToDateTime(txtFechaFinal.Text);
            }
            catch
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('', 'Ingrese fechas válidas.', 'error');", true);
                return;
            }

            if (fechaInicial < fechaFinal)
            {
                negocio.Facturacion facturacion = new negocio.Facturacion();
                facturacion._diaCorte = Convert.ToInt16(txtDiaCorte.Text);
                facturacion._diaImpresion = Convert.ToInt16(txtDiaImpresion.Text);
                facturacion._meses = Convert.ToInt16(ddlPeriodicidad.SelectedValue);
                facturacion._fechaInicial = fechaInicial;
                facturacion._fechaFinal = fechaFinal;

                DateTime proximaFecha = facturacion.proximaFecha(fechaInicial, Convert.ToInt16(ddlPeriodicidad.SelectedValue));
                if (proximaFecha <= fechaFinal)
                {
                    facturacion.generarFechas(fechaInicial);

                    rFechas.DataSource = facturacion._resultado;
                    rFechas.DataBind();
                }
                else
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('', 'La fecha final es menor al periodo seleccionado.', 'error');", true);
                }
            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('', 'La fecha inicial debe ser menor a la fecha final.', 'error');", true);
            }
        }
    }
}