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
    
    public partial class Competitions
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Competitions()
        {
            this.Races = new HashSet<Races>();
        }
    
        public int id { get; set; }
        public System.DateTime date { get; set; }
        public decimal prize { get; set; }
        public int judge { get; set; }
    
        public virtual Judges Judges { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Races> Races { get; set; }
    }
}
