using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ClassActivity.Models
{
    public class Priority
    {
        [Key]
        public int PriorityID { get; set; }

        [Required]
        [Display(Name = "Description")]
        public string PriorityDescription { get; set; }

        public virtual ICollection<List> Lists { get; set; }
    
    }
}