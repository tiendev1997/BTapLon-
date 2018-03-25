using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using BanHangDienTu.Entity;
using BanHangDienTu.Entity.EF;

namespace BanHangDienTu.Entity.Dao
{
    public class ProductDao
    {
        private DataEntities db;
        private static ProductDao instance;

        public static ProductDao Instance
        {
            get { if (instance == null) instance = new ProductDao(); return instance; }
        }
        private ProductDao()
        {
            db = new DataEntities();
        }

        public List<Product> GetListProductByCatalog(int catalogID)
        {
            return db.Products.Where(x => x.Catalog.CatalogID == catalogID).ToList();
        }

        public List<Product> GetListProduct()
        {
            return db.Products.ToList();
        }

        /// <summary>
        /// cái này dùng sau. để phân trang dữ liệu
        /// </summary>
        /// <param name="index"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public List<Product> GetPagingProduct(int index, int pageSize)
        {
            return db.Products.ToList();
        }

        public Product GetProduct(int ID)
        {
            return db.Products.Find(ID);
        }

        public bool Create(Product product)
        {
            try
            {
                db.Products.Add(product);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool Update(Product product)
        {
            var result = db.Products.Find(product.ProductID);
            if (result != null)
            {
                result.Amount = product.Amount;
                result.CatalogID = product.CatalogID;
                result.Content = product.Content;
                result.Describe = product.Describe;
                result.Image = product.Image;
                result.Name = product.Name;
                result.Orders = product.Orders;
                result.Price = product.Price;
                result.Sale = product.Price;
                result.Status = product.Status;
                try
                {
                    db.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        
        public bool Delete(int ID)
        {
            var result = db.Products.Find(ID);
            if (result != null)
            {
                try
                {
                    db.Products.Remove(result);
                    db.SaveChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}