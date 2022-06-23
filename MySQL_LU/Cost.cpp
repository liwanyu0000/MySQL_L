#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"
void MainWindow::on_billdetails_back_clicked()
{
    this->ui->cost_file->setCurrentIndex(1);
}

void MainWindow::on_Pay_back_clicked()
{
    this->ui->cost_file->setCurrentIndex(0);
}

void MainWindow::on_Paydetails_back_clicked()
{
    this->ui->cost_file->setCurrentIndex(3);
}
void MainWindow::on_Bill_back_clicked()
{
    this->ui->cost_file->setCurrentIndex(0);
}
void MainWindow::on_bill_pushButton_clicked()
{
    this->ui->cost_file->setCurrentIndex(1);
    this->Cost_bill();
}
void MainWindow::on_Cost_pushButton_clicked()
{
    this->ui->cost_file->setCurrentIndex(3);
    Cost_pay();
}
void MainWindow::Cost_bill()
{
    MYSQL_RES *res;
    std::string MySQLSentence;
    MYSQL_ROW column;
    int row;
    MySQLSentence = "SELECT costid, paytime, cost_houseid, costtype"
                    " FROM costinfo, costtypeinfo WHERE cost_costtypeid = costtypeid"
                    " and cost_userid = " + this->User.UserID +
                    " ORDER BY paytime DESC;";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    if (!(res = mysql_store_result(&this->MySQL_Data)))               //获取结果集
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    row = mysql_affected_rows(&this->MySQL_Data);
    this->ui->bill_Table->setRowCount(row);
    int j=0;
    while((column = mysql_fetch_row(res)))
    {
          this->ui->bill_Table->setItem(j,0,
               new QTableWidgetItem(QString("%1").arg(QString::
               fromStdString(std::string(column[0])).toInt(),
               10, 10, QLatin1Char('0'))));
          for(int i=1;i<4;i++)
          {
              QString tmp(column[i]);
              tmp += "  ";
              this->ui->bill_Table->setItem(j,i,new QTableWidgetItem(tmp));
          }
          j++;
    }
     this->ui->bill_Table->setEditTriggers(QAbstractItemView::NoEditTriggers);
     mysql_free_result(res);
}
void MainWindow::on_bill_Table_cellDoubleClicked(int row, int col)
{
    MYSQL_RES *res;
    std::string MySQLSentence;
    MYSQL_ROW column;
    this->ui->cost_file->setCurrentIndex(2);
    std::string tmp = this->ui->bill_Table->item(row, 0)->text().toStdString();
    MySQLSentence ="SELECT costid, coststarttime, costmoney, paytime, cost_houseid, costtype"
                   " FROM costinfo, costtypeinfo WHERE cost_costtypeid = costtypeid"
                   " and costid = " + tmp + ";";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    if (!(res = mysql_store_result(&this->MySQL_Data)))               //获取结果集
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    column = mysql_fetch_row(res);
    this->ui->CostID->setText(QString("%1").arg
         (QString::fromStdString(std::string(column[0])).toInt(),
         10, 10, QLatin1Char('0')));
    this->ui->Costcreattime->setText(column[1]);
    this->ui->Costmoney->setText(column[2]);
    this->ui->Costtime->setText(column[3]);
    this->ui->CostHouseId->setText(column[4]);
    this->ui->Costtype->setText(column[5]);
    this->ui->CostuserId->setText(QString("%1").arg(
         QString::fromStdString(std::string(this->User.UserID)).toInt(),
         10, 10, QLatin1Char('0')));
    this->ui->Costusername->setText(QString::fromStdString(std::string(this->User.UserName)));


}

void MainWindow::Cost_pay()
{
    MYSQL_RES *res;
    std::string MySQLSentence;
    MYSQL_ROW column;
    int row;
    MySQLSentence = "SELECT costid,coststarttime,costmoney, cost_houseid, costtype"
                    " FROM costinfo, costtypeinfo WHERE cost_costtypeid = costtypeid"
                    " and cost_userid IS NULL"
                    " and (cost_houseid = " ;
    for (auto house : this->User.HouseId)
        {
            MySQLSentence += house;
            MySQLSentence += " or cost_houseid = ";
        }
    MySQLSentence += "0)";
    MySQLSentence += " ORDER BY coststarttime DESC;";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    if (!(res = mysql_store_result(&this->MySQL_Data)))               //获取结果集
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    row = mysql_affected_rows(&this->MySQL_Data);
    this->ui->pay_table->setRowCount(row);
    int j=0;
    while((column = mysql_fetch_row(res)))
     {
          for(int i=0;i<5;i++)
          {
              QString tmp(column[i]);
              tmp += "  ";
              this->ui->pay_table->setItem(j,i,new QTableWidgetItem(tmp));
          }
          this->ui->pay_table->setItem(j,5,new QTableWidgetItem("去缴费"));
          j++;
     }
     this->ui->pay_table->setEditTriggers(QAbstractItemView::NoEditTriggers);
     mysql_free_result(res);
}
void MainWindow::on_pay_table_cellDoubleClicked(int row, int col)
{//信息显示
    if(col==5)
    {
        std::string MySQLSentence;
        this->ui->cost_file->setCurrentIndex(4);
        this->ui->Costidlable->setText(this->ui->pay_table->item(row, 0)->text());
        this->ui->Begin_lable->setText(this->ui->pay_table->item(row, 1)->text());
        this->ui->Money_Lable->setText(this->ui->pay_table->item(row, 2)->text());
        this->ui->HouseID_Lable->setText(this->ui->pay_table->item(row, 3)->text());
        this->ui->Type_Lable->setText(this->ui->pay_table->item(row, 4)->text());

    }
}
void MainWindow::on_Pay_PushButton_clicked()
{//费用缴纳
    std::string MySQLSentence;
     std::string tmp = this->ui->Costidlable->text().toStdString();
    MySQLSentence = "UPDATE costinfo set paytime = localtime(), cost_userid ="
                    + this->User.UserID + " WHERE costid =" +tmp+ ";";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    Cost_bill();
    Cost_pay();
    this->ui->cost_file->setCurrentIndex(3);
}
