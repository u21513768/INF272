using BaseballStas.Models;
using BaseballStas.Models.vm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace BaseballStas.Controllers
{
    public class HomeController : Controller
    {

        int numberElementsPerPage = 10;
        BaseballDataEntities db = new BaseballDataEntities();

        public ActionResult Index(int pageIndex=1)
        {
            List<HallOfFamePlayerVM> playerRecords = new List<HallOfFamePlayerVM>();

            foreach (halloffame record in db.halloffames.OrderByDescending(item => item.votes)) {
                if (record.category.ToLower().Equals("player")) {
                    player hofPlayer = db.players.FirstOrDefault(player => player.hofID == record.hofID);
                    if (hofPlayer != null && record.ballots != null) {
                        HallOfFamePlayerVM p = new HallOfFamePlayerVM
                        {
                            FirstName = hofPlayer.nameFirst,
                            LastName = hofPlayer.nameLast,
                            NumerOfBallots = (int)record.ballots,
                            CountryOfBirth = hofPlayer.birthCountry,
                            Year = record.yearID
                        };
                        playerRecords.Add(p);
                    }
                }
            } 
            return View(playerRecords.ToPagedList(pageIndex, numberElementsPerPage));
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}