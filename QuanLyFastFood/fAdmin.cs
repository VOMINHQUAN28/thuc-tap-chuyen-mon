using QuanLyFastFood.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyFastFood
{
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();
            LoadListByDate(dtpkFromDate.Value, dtpkToDate.Value);
            LoadDateTimePickerBill();
        }
        void LoadDateTimePickerBill()
        {
            DateTime today = DateTime.Now;
            dtpkFromDate.Value = new DateTime(today.Year, today.Month,1);
            dtpkToDate.Value = dtpkFromDate.Value.AddMonths(1).AddDays(-1);

        }

       

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void fAdmin_Load(object sender, EventArgs e)
        {

        }

        private void tcAdmin_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void tpFood_Click(object sender, EventArgs e)
        {

        }

        private void panel6_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void tpTable_Click(object sender, EventArgs e)
        {

        }

        private void tpAccount_Click(object sender, EventArgs e)
        {

        }
        void LoadListByDate(DateTime checkIn , DateTime checkOut)
        {
            dtgvBill.DataSource = BillDAO.Instace.GetBillListByDate(checkIn, checkOut);
        }

        private void btnViewBill_Click(object sender, EventArgs e)
        {
            LoadListByDate(dtpkFromDate.Value, dtpkToDate.Value);

        }

        private void tcBill_Click(object sender, EventArgs e)
        {

        }
    }
}
