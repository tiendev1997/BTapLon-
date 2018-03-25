using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using BanHangDienTu.Admin.Models;

namespace BanHangDienTu.Admin.Controller
{
    public class CatalogController
    {

        private SqlConnection conn;
        private string query
        {
            get
            {
                return @"SELECT [CatalogID] ,[Name]";
            }
        }
        public CatalogController()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["QLBanHang"].ConnectionString);
        }

        private CatalogModel GetCatalog(DataRow dr)
        {
            CatalogModel model = new CatalogModel();
            model.ID = int.Parse(dr["CatalogID"].ToString());
            model.Name = dr["Name"].ToString();
            return model;
        }

        public List<CatalogModel> GetListCatalog()
        {
            List<CatalogModel> list = new List<CatalogModel>();
            string str = query + " FROM [dbo].[Catalog]";


            SqlCommand cmd = new SqlCommand(str, conn);
            try
            {
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable t = new DataTable();
                adapter.Fill(t);
                if (t.Rows.Count > 0)
                {
                    foreach (DataRow item in t.Rows)
                    {
                        list.Add(GetCatalog(item));
                    }
                }
                adapter.Dispose();
            }
            catch { }
            finally { cmd.Dispose(); conn.Close(); }
            return list;
        }

        public bool Insert(CatalogModel model)
        {
            string str = @"INSERT INTO [dbo].[Catalog] ([Name]) VALUES (@Name)";
            SqlCommand cmd = new SqlCommand(str, conn);
            cmd.Parameters.AddWithValue("Name", model.Name);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch { return false; }
            finally { cmd.Dispose(); conn.Close(); }
        }

        public bool Update(CatalogModel model)
        {
            string str = @"UPDATE [dbo].[Catalog] SET [Name] = @Name WHERE CatalogID = @id";
            SqlCommand cmd = new SqlCommand(str, conn);
            cmd.Parameters.AddWithValue("Name", model.Name);
            cmd.Parameters.AddWithValue("id", model.ID);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch { return false; }
            finally { cmd.Dispose(); conn.Close(); }
        }

        public bool Delete(int ID)
        {
            string str = @"DELETE FROM [dbo].[Catalog] WHERE CatalogID = @id";
            SqlCommand cmd = new SqlCommand(str, conn);
            cmd.Parameters.AddWithValue("id", ID);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch { return false; }
            finally { cmd.Dispose(); conn.Close(); }
        }
    }
}