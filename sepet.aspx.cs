using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KerimÖdev
{
    
    public partial class sepet : System.Web.UI.Page
    {
        public string connectionString = "Data Source=KERIM\\MSSQLSERVER02;Initial Catalog=kerimcokurpinar;Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}