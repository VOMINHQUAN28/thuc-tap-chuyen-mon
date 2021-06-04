using QuanLyFastFood.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyFastFood.DAO
{
    public class CategoryDAO
    {
        private static CategoryDAO instace;

        public static CategoryDAO Instace
        {
            get { if (instace == null) instace = new CategoryDAO(); return CategoryDAO. instace; }

           private set { CategoryDAO. instace = value; }
        
        }
        private CategoryDAO() { }

        public List<Category> GetListCategory()
        {
            List<Category> list = new List<Category>();

            string query ="SELECT * FROM FoodCategory";

            DataTable data = DataProvider.Instance.ExcuteQuery(query);

            foreach(DataRow item in data.Rows)
            {
                Category category = new Category(item);
                list.Add(category);
            }

            return list;
        }
        public Category GetCategoryById(int id)
        {
            Category category = null;
            string query = "SELECT * FROM FoodCategory WHERE id = " +id;

            DataTable data = DataProvider.Instance.ExcuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                 category = new Category(item);
                return category;
            }
            return category;

        }
    }
}
