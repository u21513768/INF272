﻿using DB2ClassExercise.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using DB2ClassExercise.Data;

namespace DB2ClassExercise.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private SomeDataService dataService = SomeDataService.getInstance();

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            List<Course> courses = dataService.getAvailableCourses();
            return View(courses);
        }

        public ActionResult ViewCourse(int courseID)
        {
            List<Assignment> courseAssignmnts = dataService.getAssignmentsOfCourse(courseID);

            if (courseAssignmnts.Count == 0)
            {
                return View("View");
            }
            else
            {

                return View(courseAssignmnts);
            }
        }

    }
}
