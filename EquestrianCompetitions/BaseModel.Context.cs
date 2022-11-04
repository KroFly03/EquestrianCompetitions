﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class EquestrianCompetitionsEntities : DbContext
    {
        static EquestrianCompetitionsEntities context;
        public EquestrianCompetitionsEntities()
            : base("name=EquestrianCompetitionsEntities")
        {
        }

        public static EquestrianCompetitionsEntities GetContext()
        {
            if (context == null)
                context = new EquestrianCompetitionsEntities();

            return context;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Jockeys> Jockeys { get; set; }
        public virtual DbSet<Members> Members { get; set; }
        public virtual DbSet<RaceMembers> RaceMembers { get; set; }
        public virtual DbSet<CompetitionInfoView> CompetitionInfoView { get; set; }
        public virtual DbSet<HorseInfoView> HorseInfoView { get; set; }
        public virtual DbSet<JockeyInfoView> JockeyInfoView { get; set; }
        public virtual DbSet<MemberInfoView> MemberInfoView { get; set; }
        public virtual DbSet<RaceScoreInfoView> RaceScoreInfoView { get; set; }
        public virtual DbSet<RaceView> RaceView { get; set; }
        public virtual DbSet<UserView> UserView { get; set; }
        public virtual DbSet<Users> Users { get; set; }
    
        public virtual ObjectResult<Authorizate_Result> Authorizate(string login, string password)
        {
            var loginParameter = login != null ?
                new ObjectParameter("login", login) :
                new ObjectParameter("login", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("password", password) :
                new ObjectParameter("password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Authorizate_Result>("Authorizate", loginParameter, passwordParameter);
        }
    }
}