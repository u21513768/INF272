//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
using System.ComponentModel.DataAnnotations;

namespace AdvMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Staff
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Staff()
        {
            this.CourseAssignmentsMarkings = new HashSet<CourseAssignmentsMarking>();
        }

        [StringLength(9, MinimumLength = 9,
        ErrorMessage = "ID must contain 9 digits")]
        [Required(ErrorMessage = "Please enter ID")]
        public int ID { get; set; }
       
        public string Title { get; set; }
        public string Name { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CourseAssignmentsMarking> CourseAssignmentsMarkings { get; set; }
    }
}
