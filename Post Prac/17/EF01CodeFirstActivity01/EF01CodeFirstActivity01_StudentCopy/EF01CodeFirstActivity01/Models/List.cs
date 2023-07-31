using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ClassActivity.Models
    {
    public class List
        {
        //PrimaryKey
        [Key]
        public int ListID { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string ListCode { get; set; }

        [Required]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "Description")]
        public string Description { get; set; }

        //----------
        //ForeignKey

        public int? ListItemTypeID { get; set; }

        [ForeignKey("ListItemTypeID")]
        [Display(Name = "Type")]
        public virtual ListItemType ListItemType { get; set; }

        //----------
        //ForeignKey

        public int? PriorityID { get; set; }

        [ForeignKey("PriorityID")]
        [Display(Name = "Priority")]
        public virtual Priority Priority { get; set; }
    }
    }