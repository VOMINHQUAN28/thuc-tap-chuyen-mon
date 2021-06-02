﻿
using QuanLyFastFood.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyFastFood.DAO
{
    public class TableDAO
    {
        private static TableDAO instance;

        public static TableDAO Instance
        {
            get { if (instance == null) instance = new TableDAO(); return TableDAO.instance; }
            private set { TableDAO.instance = value; }
        }
        public static int TableWidth = 90;
        public static int TableHeight = 90;
        private TableDAO() { }

        public void SwitchTable(int id1, int id2)
        {
            DataProvider.Instance.ExcuteQuery("USP_SwitchTable @idTable1 , @idTable2", new object[] { id1, id2 });
        }

        public List<Table> LoadTableList()
        {
           
                List<Table> tableList = new List<Table>();
                DataTable data = DataProvider.Instance.ExcuteQuery("EXEC USP_GetTableList");
                foreach (DataRow item in data.Rows)
                {
                    Table table = new Table(item);
                    tableList.Add(table);
                }
                return tableList;
            }
        }
    }

