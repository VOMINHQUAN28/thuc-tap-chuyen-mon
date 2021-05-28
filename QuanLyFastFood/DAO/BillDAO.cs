using QuanLyFastFood.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyFastFood.DAO
{
  public class BillDAO
    {
        private static BillDAO instace;

        public static BillDAO Instace
        {
            get { if (instace == null) instace = new BillDAO(); return BillDAO.instace; }
           private set { instace = value; }
        }
        private BillDAO() { }
        public int GetUncheckBillIDByTableID(int id)
        {
            DataTable data= DataProvider.Instance.ExcuteQuery("SELECT * FROM Bill WHERE idTable=" +id +" AND status = 0");
            if (data.Rows.Count > 0)
            {
                Bill bill = new Bill(data.Rows[0]);

                return bill.ID;

            }
            return -1;
        }
    }
}
