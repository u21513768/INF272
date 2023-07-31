using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using WinterBoxes.Models;

namespace WinterBoxes.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private List<Box> Boxes;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
            this.Boxes = new List<Box>();

            this.Boxes.Add(
                    new Box() {
                        BoxName = "Box 1",
                        Items = new String[] {"2x Grey Ceramic Mug",
                                "2x Cream Kitchen Towel",
                                "Bubble Cream Candle",
                                "Gold Coffee Spoon"
                                }
                    }
                );


           this.Boxes.Add(
                new Box()
                {
                    BoxName = "Box Alf",
                    Items = new String[] {"Cofee plunger",
                                        "Oats Biscuits",
                                        "Grey Ceramic mug",
                                        "Continental Espresso  beans",
                                        "Cinnamon Sticks",
                                        "Lindt dark chocolate"
                            }
                }
            );


            this.Boxes.Add(
                 new Box()
                 {
                     BoxName = "The amante box",
                     Items = new String[] {"Marshmallows",
                                                    "Mug",
                                                    "Hot chocolate",
                                                    "Salted Caramel  Popcorn  from Mamere",
                                                    "White Chocolate, Vannila, Olive oil & Almond nougat"
                             }                 }
             );

            this.Boxes.Add(
                 new Box()
                 {
                     BoxName = "Box surprise",
                     Items = new String[] {"Scented Bubble Candle",
                                            "Coffee Brew Bag",
                                            "Face Mug",
                                            "Macadamia Handmade Nougat",
                                            "Organic Lavender, Chamomile & Flaxseed tea pack"
                             }
                 }
             );
        }

        public IActionResult Index()
        {
            return View(Boxes);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
