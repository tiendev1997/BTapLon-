using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using BanHangDienTu.Entity.EF;
using BanHangDienTu.Entity;

namespace BanHangDienTu.Entity.Dao
{
    public class CatalogDao
    {
        private DataEntities db;
        private static CatalogDao instance;

        public static CatalogDao Instance
        {
            get { if (instance == null) instance = new CatalogDao(); return instance; }
        }

        private CatalogDao()
        {
            db = new DataEntities();
        }

        #region GetListCatalog
        /// <summary>
        /// Lấy về một danh sách các catalog
        /// </summary>
        /// <returns></returns>
        public List<Catalog> GetListCatalog()
        {
            return db.Catalogs.ToList();
        }
        #endregion

        #region GetCatalog
        /// <summary>
        /// Lấy ra một catalog bằng cách truyền vào ID của catalog cần lấy
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        public Catalog GetCatalog(int ID)
        {
            return db.Catalogs.Find(ID);
        }
        #endregion

        #region Tạo mới catalog
        /// <summary>
        /// Tạo mới một Danh mục
        /// Truyền vào 1 Catalog có các tham số có trong Catalog
        /// </summary>
        /// <param name="catalog"></param>
        /// <returns></returns>
        public bool Create(Catalog catalog)
        {
            try
            {
                db.Catalogs.Add(catalog);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        #endregion


        #region Sửa Catalog
        /// <summary>
        /// Sửa  1 catalog truuyền vào một catalog có chứa ID của catalog cần sửa
        /// </summary>
        /// <param name="catalog"></param>
        /// <returns></returns>
        public bool Update(Catalog catalog)
        {
            var result = db.Catalogs.Find(catalog.CatalogID);
            if (result != null)
            {
                result.Name = catalog.Name;
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
        #endregion


        #region Xóa Catalog
        /// <summary>
        /// Xóa một catalog trong database
        /// truyền vào  id của catalog cần xóa
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        public bool Delete(int ID)
        {
            var result = db.Catalogs.Find(ID);
            if (result != null)
            {
                try
                {
                    db.Catalogs.Remove(result);
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
        #endregion
    }
}