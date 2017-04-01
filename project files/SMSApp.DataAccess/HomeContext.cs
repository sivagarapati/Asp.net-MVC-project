using SMSApp.Common;
using SMSApp.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMSApp.DataAccess
{
    public class HomeContext
    {
        public static void InsertQuery(ContactUs entity)
        {
            SqlConnection con = new SqlConnection(DbActivity.ConnectionString());
            SqlCommand cmd = new SqlCommand();
            try
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "sp_contactus";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("FirstName", entity.FirstName);
                cmd.Parameters.AddWithValue("LastName", entity.LastName);
                cmd.Parameters.AddWithValue("Email", entity.Email);
                cmd.Parameters.AddWithValue("PhoneNumber", entity.PhoneNumber);
                cmd.Parameters.AddWithValue("Information", entity.Information);
                cmd.ExecuteNonQuery();                
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
                cmd.Dispose();
            }
        }
    }
}
