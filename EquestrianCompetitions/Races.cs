//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EquestrianCompetitions
{
    using System;
    using System.Collections.Generic;
    
    public partial class Races
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Races()
        {
            this.RaceMembers = new HashSet<RaceMembers>();
        }
    
        public int id { get; set; }
        public int distance { get; set; }
        public int competition { get; set; }
    
        public virtual Competitions Competitions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RaceMembers> RaceMembers { get; set; }
    }
}
