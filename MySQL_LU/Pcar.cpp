#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"
//按钮
void MainWindow::on_Buypcardetails_back_clicked()
{
    this->ui->Pcar_file->setCurrentIndex(2);
}

void MainWindow::on_Buypcar_back_clicked()
{
   this->ui->Pcar_file->setCurrentIndex(0);
}
void MainWindow::on_Mypcar_back_clicked()
{
   this->ui->Pcar_file->setCurrentIndex(0);
}

void MainWindow::on_Buypcar_pushButton_clicked()
{
    this->ui->Pcar_file->setCurrentIndex(2);
}
void MainWindow::on_Mypcar_pushButton_clicked()
{
    this->ui->Pcar_file->setCurrentIndex(1);
    this->Pcar_mypcar();
}
void MainWindow::Pcar_mypcar()
{
    MYSQL_RES *res;
    std::string MySQLSentence;
    MYSQL_ROW column;
    int row;
    MySQLSentence = "SELECT pcarid, pcarloction, buytime, location FROM"
                    " pcarinfo, houseinfo, user_houserelation WHERE"
                    " pcar_houseid = houseid and pcar_houseid ="
                    " uh_relation_houseid and uh_relation_userid = "
                    + this->User.UserID +
                    " ORDER BY buytime DESC;";
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
    this->ui->Mypcar_Table->setRowCount(row);
    int j=0;
    while((column = mysql_fetch_row(res)))
    {
        this->ui->Mypcar_Table->setItem(j,0,
             new QTableWidgetItem(QString("%1").arg(QString::
             fromStdString(std::string(column[0])).toInt(),
             10, 10, QLatin1Char('0'))));
          for(int i=1;i<3;i++)
          {
              QString tmp(column[i]);
              tmp += "  ";
              this->ui->Mypcar_Table->setItem(j,i,new QTableWidgetItem(tmp));
          }
          j++;
    }
     //this->ui->Nottable->setEditTriggers(QAbstractItemView::NoEditTriggers);
     mysql_free_result(res);                                         //释放结果集
}

void MainWindow::Pcar_buycar()
{
    MYSQL_RES *res;
    std::string MySQLSentence;
    MYSQL_ROW column;
    int row;
    MySQLSentence ="SELECT pcarid, pcarloction, pcarcost FROM pcarinfo WHERE pcarstate <> 2;";
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
    this->ui->Buypcar_Table->setRowCount(row);
    int j=0;
    while((column = mysql_fetch_row(res)))
    {
        this->ui->Buypcar_Table->setItem(j,0,
             new QTableWidgetItem(QString("%1").arg(QString::
             fromStdString(std::string(column[0])).toInt(),
             10, 10, QLatin1Char('0'))));
          for(int i=1;i<3;i++)
          {
              QString tmp(column[i]);
              tmp += "  ";
              this->ui->Buypcar_Table->setItem(j,i,new QTableWidgetItem(tmp));
          }
          this->ui->Buypcar_Table->setItem(j,3,new QTableWidgetItem("购买"));
          j++;
    }
     //this->ui->Nottable->setEditTriggers(QAbstractItemView::NoEditTriggers);
     mysql_free_result(res);
}
void MainWindow::on_Buypcar_Table_cellDoubleClicked(int row, int col)
{
    if(col==3)
    {
        std::string MySQLSentence;
        this->ui->Pcar_file->setCurrentIndex(3);
        this->ui->Pcarid_lable->setText(this->ui->Buypcar_Table->item(row, 0)->text());
        this->ui->Pcarseat_lable->setText(this->ui->Buypcar_Table->item(row, 1)->text());
        this->ui->Pcarcost_lable->setText(this->ui->Buypcar_Table->item(row, 2)->text());

    }
}
void MainWindow::on_BuypushButton_clicked()
{
    std::string MySQLSentence;
    std::string tmp = this->ui->Pcarid_lable->text().toStdString();
    std::string text1 = this->ui->Pcar_comboBox->currentText().toStdString();
    MySQLSentence = "UPDATE pcarinfo SET pcarstate = 2, pcar_houseid = "+ text1 +","
                    " buytime = localtime() WHERE pcarid = "+ tmp +";";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    MySQLSentence = "INSERT INTO costinfo(cost_costtypeid, cost_houseid,"
                    "cost_userid, costmoney, coststarttime, paytime, istrue) "
                    "VALUES (7, " + text1 + ", "
                    + this->User.UserID + ", "
                    + this->ui->Pcarcost_lable->text().toStdString() +","
                    "NOW(), NOW(), 1);";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    Pcar_mypcar();
    Pcar_buycar();
    this->ui->Pcar_file->setCurrentIndex(2);

}
