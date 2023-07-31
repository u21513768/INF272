using INF272SemesterTest2SectionB.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace INF272SemesterTest2SectionB.Controllers
    {
    public class Question03Controller : Controller
        {
        [HttpGet]
        public ActionResult Question03()
            {
            return View();
            }

        [HttpPost]
        public ActionResult Question03(int min)
        {

            // Complete this section of the controller (5 marks).
            // -------------------------------------------------
            // -------------------------------------------------
            List<Author> newAuthors = new List<Author>();

            foreach (Author author in BookData.Authors)
            {
                
                int counter = 0;
                double total = 0;

                foreach (var rating in author.Ratings)
                {
                    counter++;
                    total += rating.Rating;
                   
                   
                }
                double avg = total / counter;
                if (avg >= min)
                {
                    newAuthors.Add(author);
                }
            }


            RatingRangeViewModel newRR = new RatingRangeViewModel
            {
                Authors = newAuthors,
                Min = min
        };


            return View("Question03_Ratings", newRR);

            // -------------------------------------------------
            // -------------------------------------------------
            // Complete this section of the controller.
            }
        }
    }