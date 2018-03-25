using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using BanHangDienTu.Entity;
using BanHangDienTu.Entity.EF;

namespace BanHangDienTu.Entity.Dao
{


    public class OrderDao
    {
        private DataEntities db;
        private static OrderDao instance;

        public static OrderDao Instance
        {
            get { if (instance == null) instance = new OrderDao(); return instance; }
        }

        private OrderDao()
        {
            db = new DataEntities();
        }

        public List<Order> GetListOrder()
        {
            return db.Orders.ToList();
        }

        public Order GetOrder(int id)
        {
            return db.Orders.Find(id);
        }

        public bool Create(Order order)
        {
            try
            {
                db.Orders.Add(order);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(Order order)
        {
            var result = db.Orders.Find(order.OrderID);
            if(result != null)
            {
                try
                {
                    result.UserID = order.UserID;
                    result.Address = order.Address;
                    result.NameCustomer = order.NameCustomer;
                    result.Phone = order.Phone;
                    result.Status = result.Status;

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

        public bool Delete(int id)
        {
            var result = db.Orders.Find(id);
            if (result != null)
            {
                db.Orders.Remove(result);
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
    }
}