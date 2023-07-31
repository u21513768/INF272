using ImportExportPractical.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Entity;
using OfficeOpenXml;
using System.IO;

namespace ImportExportPractical.Controllers
{
    public class OrderController : Controller
    {
        private readonly ProductOrderEntities db = new ProductOrderEntities();
        // GET: Order
        public ActionResult Index()
        {
            /* Edit Here */

            return View(db.OrderItems.ToList());
        }

        public void ExportCustomers()
        {
            var Orders = db.OrderItems.ToList();
            /* Edit Here */
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            ExcelPackage pck = new ExcelPackage();
            ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Report");

            ws.Cells["A1"].Value = "Order Number";
            ws.Cells["B1"].Value = "Product Name";
            ws.Cells["C1"].Value = "Supplier Name";
            ws.Cells["D1"].Value = "Supplier Contact Number";
            ws.Cells["E1"].Value = "Unit Price";
            ws.Cells["F1"].Value = "Quantity";
            ws.Cells["G1"].Value = "Total";

            int rowStart = 2;
            foreach (var item in Orders)
            {
                ws.Cells[string.Format("A{0}", rowStart)].Value = item.Order.OrderNumber;
                ws.Cells[string.Format("B{0}", rowStart)].Value = item.Product.ProductName;
                ws.Cells[string.Format("C{0}", rowStart)].Value = item.Product.Supplier.CompanyName;
                ws.Cells[string.Format("D{0}", rowStart)].Value = item.Product.Supplier.Phone;
                ws.Cells[string.Format("E{0}", rowStart)].Value = item.Product.UnitPrice;
                ws.Cells[string.Format("F{0}", rowStart)].Value = item.Quantity;
                var total = item.Quantity * item.Product.UnitPrice;
                ws.Cells[string.Format("G{0}", rowStart)].Value = total;
                rowStart++;
            }

            ws.Cells["A:AZ"].AutoFitColumns();
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment: filename = " + "ExcelReprt.xlsx");
            Response.BinaryWrite(pck.GetAsByteArray());
            Response.End();
        }
    }
}