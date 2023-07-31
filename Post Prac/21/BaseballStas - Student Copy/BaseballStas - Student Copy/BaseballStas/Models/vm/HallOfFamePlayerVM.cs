using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BaseballStas.Models.vm
{
    public class HallOfFamePlayerVM
    {
        public String FirstName { get; set; }
        public String LastName { get; set; }
        public int NumerOfBallots { get; set; }
        public String CountryOfBirth { get; set; }
        public int Year { get; set; }

    }
}