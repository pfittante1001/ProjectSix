﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectSix.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class WardrobeMVCEntities : DbContext
    {
        public WardrobeMVCEntities()
            : base("name=WardrobeMVCEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Accessory> Accessories { get; set; }
        public virtual DbSet<AsscType> AsscTypes { get; set; }
        public virtual DbSet<Bottom> Bottoms { get; set; }
        public virtual DbSet<BottomType> BottomTypes { get; set; }
        public virtual DbSet<Outfit> Outfits { get; set; }
        public virtual DbSet<Shoe> Shoes { get; set; }
        public virtual DbSet<ShoeType> ShoeTypes { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Top> Tops { get; set; }
        public virtual DbSet<TopType> TopTypes { get; set; }
        public virtual DbSet<Table_3> Table_3 { get; set; }
    }
}