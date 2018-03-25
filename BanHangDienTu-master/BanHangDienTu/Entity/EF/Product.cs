namespace BanHangDienTu.Entity.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            Orders = new HashSet<Order>();
        }

        public int ProductID { get; set; }

        public int CatalogID { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(255)]
        public string Image { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Describe { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string Content { get; set; }

        public double Price { get; set; }

        public double? Sale { get; set; }

        public int Amount { get; set; }

        public bool Status { get; set; }

        public virtual Catalog Catalog { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
