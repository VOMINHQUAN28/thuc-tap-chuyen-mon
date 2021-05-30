using QuanLyFastFood.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyFastFood.DAO
{
    public class FoodDAO
    {
        private static FoodDAO instace;

        public static FoodDAO Instace
        {
            get { if (instace == null) instace = new FoodDAO(); return FoodDAO.instace; }

            private set { FoodDAO.instace = value; }

        }
        private FoodDAO() { }

        public List<Food> GetFoodByCategoryID(int id)
        {
            List<Food> list = new List<Food>();
            string query = "SELECT * FROM Food WHERE idCategory = " + id;
            DataTable data = DataProvider.Instance.ExcuteQuery(query);

            foreach(DataRow item in data.Rows)
            {
                Food food = new Food(item);
                list.Add(food);
            }

            return list;

        }
    }
}
