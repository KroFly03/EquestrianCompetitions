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
    
    public partial class RaceMembers
    {
        public int race { get; set; }
        public int member { get; set; }
        public System.TimeSpan score { get; set; }
        public int running_track { get; set; }
        public string uniform_color { get; set; }
        public Nullable<bool> disqualified { get; set; }
    
        public virtual Members Members { get; set; }
    }
}
