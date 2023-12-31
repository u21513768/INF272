﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.IO;
namespace excelimport.Controllers
{
    
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
        OleDbConnection Econ;
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index()
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            if (Request.Files.Count > 0) //Access Request object to see if any files were submitted
            {
                var file = Request.Files[0]; //Request object has a Files array. If files were submitted, then you will find it in this array.
                                             //Do whatever you want with the file (e.g. Save to folder on server)
                string targetFolder = HttpContext.Current.Server.MapPath("~/uploads/logo");
                string targetPath = Path.Combine(targetFolder, file.FileName.ToString());
                file.SaveAs(targetPath);
            }
            return RedirectToAction("Index")
        }

        private void ExcelConn(string filepath)
        {
            string constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", filepath);
            Econ = new OleDbConnection(constr);

        }

        private void InsertExceldata(string fileepath,string filename)
        {
            string fullpath = Server.MapPath("/excelfolder/") + filename;
            ExcelConn(fullpath);
            string query = string.Format("Select * from [{0}]", "Sheet1$");
            OleDbCommand Ecom = new OleDbCommand(query, Econ);
            Econ.Open();

            DataSet ds = new DataSet();
            OleDbDataAdapter oda = new OleDbDataAdapter(query ,Econ);
            Econ.Close();
            oda.Fill(ds);

            DataTable dt = ds.Tables[0];

            SqlBulkCopy objbulk = new SqlBulkCopy(con);
            objbulk.DestinationTableName = "tbl_registration";
            objbulk.ColumnMappings.Add("Email", "Email");
            objbulk.ColumnMappings.Add("Password", "Password");
            objbulk.ColumnMappings.Add("Name", "Name");
            objbulk.ColumnMappings.Add("Address", "Address");
            objbulk.ColumnMappings.Add("City", "City");
            con.Open();
            objbulk.WriteToServer(dt);
            con.Close();
        }

    }
}
