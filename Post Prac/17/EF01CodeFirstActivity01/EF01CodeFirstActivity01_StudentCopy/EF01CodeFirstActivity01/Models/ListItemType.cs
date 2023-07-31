using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ClassActivity.Models
    {
    public class ListItemType
        {
        [Key]
        public int ListItemTypeID { get; set; }

        [Required]
        [Display(Name = "Type")]
        public string ListItemTypeDescription { get; set; }

        public virtual ICollection<List> Lists { get; set; }
        }
    }