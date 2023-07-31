using EF02Activity.Models;
using PagedList;
using System;
using System.Data;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace EF02Activity.Controllers
    {
    public class RegionCountryLocationController : Controller
        {
        private HumanResourcesDB db = new HumanResourcesDB();

        public ActionResult Index(string sortOrder, string currentFilterTextbox, string textboxSearchString, int? page)
            {
            ViewBag.CurrentSort = sortOrder;
            ViewBag.AddressSortParm = String.IsNullOrEmpty(sortOrder) ? "address_desc" : "";
            ViewBag.CountrySortParm = sortOrder == "Country" ? "country_desc" : "Country";
            ViewBag.RegionSortParm = sortOrder == "Region" ? "region_desc" : "Region";
            ViewBag.CitySortParm = sortOrder == "City" ? "city_desc" : "City";
            ViewBag.CodeSortParm = sortOrder == "Code" ? "code_desc" : "Code";

            if (textboxSearchString != null)
                {
                page = 1;
                }
            else
                {
                textboxSearchString = currentFilterTextbox;
                }

            ViewBag.CurrentFilterTextbox = textboxSearchString;

            var regTemp = from reg in db.regions
                          select reg;

            var coTemp = from co in db.countries
                         select co;

            var locTemp = from loc in db.locations
                          select loc;

            if (!String.IsNullOrEmpty(textboxSearchString))
                {
                locTemp = locTemp.Where(xx => xx.street_address.Contains(textboxSearchString));
                }

            var result = (from a in regTemp
                          join b in coTemp on a.region_id equals b.region_id into tempTable01
                          from b in tempTable01.ToList()
                          join c in locTemp on b.country_id equals c.country_id into tempTable02
                          from c in tempTable02.ToList()
                          select new RegionCountryLocation
                              {
                              RegionDetails = a,
                              CountryDetails = b,
                              LocationDetails = c
                              });

            switch (sortOrder)
                {
                case "address_desc":
                    result = result.OrderByDescending(o => o.LocationDetails.street_address);
                    break;

                case "Country":
                    result = result.OrderBy(o => o.LocationDetails.country.country_name);
                    break;

                case "country_desc":
                    result = result.OrderByDescending(o => o.LocationDetails.country.country_name);
                    break;

                case "Region":
                    result = result.OrderBy(o => o.LocationDetails.country.region.region_name);
                    break;

                case "region_desc":
                    result = result.OrderByDescending(o => o.LocationDetails.country.region.region_name);
                    break;

                case "City":
                    result = result.OrderBy(o => o.LocationDetails.city);
                    break;

                case "city_desc":
                    result = result.OrderByDescending(o => o.LocationDetails.city);
                    break;

                case "Code":
                    result = result.OrderBy(o => o.LocationDetails.postal_code);
                    break;

                case "code_desc":
                    result = result.OrderByDescending(o => o.LocationDetails.postal_code);
                    break;

                default:
                    result = result.OrderBy(o => o.LocationDetails.street_address);
                    break;
                }
            int pageSize = 7;
            int pageNumber = (page ?? 1);
            return View(result.ToPagedList(pageNumber, pageSize));
            }

        public ActionResult Details(int? id)
            {
            if (id == null)
                {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            location location = db.locations.Find(id);

            if (location == null)
                {
                return HttpNotFound();
                }
            return View(location);
            }
        }
    }