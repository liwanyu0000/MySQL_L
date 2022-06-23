#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"
void MainWindow::news_listWidget()
{
  MYSQL_RES *res;
  std::string MySQLSentence;
  MYSQL_ROW column;
  int row;
  MySQLSentence = "SELECT newsid,newstitle,newstime,adminname "
                  "FROM newsinfo,admininfo WHERE news_adminid = adminid and newstype = 0 "
                  "UNION ALL "
                  "SELECT newsid,newstitle,newstime,adminname "
                  "FROM admininfo,newsinfo,user_newsrelation "
                  "WHERE news_adminid = adminid and un_newsid = newsid  and un_userid = "
                  + this->User.UserID +
                  " ORDER BY newstime DESC;";
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
  this->ui->NewsList_TableWidget->setRowCount(row);
  int j=0;
  while((column = mysql_fetch_row(res)))
   {
      this->ui->NewsList_TableWidget->setItem(j,0,new QTableWidgetItem(QString("%1").arg(QString::
                                                                      fromStdString(std::string(column[0])).toInt(),
                                                                      10, 10, QLatin1Char('0'))));
        for(int i=1;i<4;i++)
        {
            QString tmp(column[i]);
            tmp += "  ";
            this->ui->NewsList_TableWidget->setItem(j,i,new QTableWidgetItem(tmp));
        }
        j++;
   }
   mysql_free_result(res);                                         //释放结果集
}


void MainWindow::on_NewsList_TableWidget_cellDoubleClicked(int row, int col)
{
    MYSQL_RES *res;
    std::string MySQLSentence;
    MYSQL_ROW column;
    this->ui->NewsTabWidget->setCurrentIndex(1);
    std::string tmp = this->ui->NewsList_TableWidget->item(row, 0)->text().toStdString();
    MySQLSentence ="SELECT newstitle,newscontent,newstime,adminname FROM "
            "newsinfo,admininfo WHERE news_adminid = adminid and newsid = "
            + tmp + ";";
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
    while((column = mysql_fetch_row(res)))
    {

         this->ui->Newstitle->setText(column[0]);
         this->ui->Newscontent->setText(column[1]);
         this->ui->Newstime->setText(column[2]);
         this->ui->Adminname->setText(column[3]);
    }
}
void MainWindow::on_Newscontent_back_clicked()
{
    this->ui->NewsTabWidget->setCurrentIndex(0);
}
