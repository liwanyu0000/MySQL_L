#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"
void MainWindow::on_Mytask_back_3_clicked()
{
    this->ui->task_file->setCurrentIndex(0);
}
void MainWindow::on_Mytask_back_clicked()
{
    this->ui->task_file->setCurrentIndex(0);
}
void MainWindow::on_Mytask_back_2_clicked()
{
    this->ui->task_file->setCurrentIndex(0);
}

void MainWindow::on_Applytask_back_clicked()
{
    this->ui->task_file->setCurrentIndex(0);
}

void MainWindow::on_pushButton_8_clicked()
{
   this->ui->task_file->setCurrentIndex(1);
}
void MainWindow::on_pushButton_9_clicked()
{
   this->ui->task_file->setCurrentIndex(2);
}

void MainWindow::Task_notBegin()
{
    MYSQL_RES *res;
    std::string MySQLSentence;
    MYSQL_ROW column;
    int row;
    MySQLSentence = "SELECT task_houseid,taskcontent,applicationtime FROM"
                    " taskinfo where taskstate = 0 and (task_houseid =  ";
    for (auto house : this->User.HouseId)
    {
        MySQLSentence += house;
        MySQLSentence += " or task_houseid = ";
    }
    MySQLSentence += "0)";
    MySQLSentence += " ORDER BY applicationtime DESC;";
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
    this->ui->Nottable->setRowCount(row);
    int j=0;
    while((column = mysql_fetch_row(res)))
     {
        this->ui->Nottable->setItem(j,0,
                  new QTableWidgetItem(QString("%1").arg(QString::
                  fromStdString(std::string(column[0])).toInt(),
                  10, 10, QLatin1Char('0'))));
        for(int i=1;i<3;i++)
        {
            QString tmp(column[i]);
            tmp += "  ";
            this->ui->Nottable->setItem(j,i,new QTableWidgetItem(tmp));
        }
        j++;
     }
     //this->ui->Nottable->setEditTriggers(QAbstractItemView::NoEditTriggers);
     mysql_free_result(res);                                         //释放结果集
}
void MainWindow::Task_Begin()
{
    MYSQL_RES *res;
    std::string MySQLSentence;
    MYSQL_ROW column;
    int row;
    MySQLSentence = "SELECT task_houseid,taskcontent,applicationtime ,taskstarttime FROM"
                    " taskinfo,admin_taskrelation where taskid=admin_task_taskid"
                    " AND taskstate = 1 and (task_houseid =  ";
    for (auto house : this->User.HouseId)
    {
        MySQLSentence += house;
        MySQLSentence += " or task_houseid = ";
    }
    MySQLSentence += "0)";
    MySQLSentence += " ORDER BY applicationtime DESC;";
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
    this->ui->Hastable->setRowCount(row);
    int j=0;
     while((column = mysql_fetch_row(res)))
     {
        this->ui->Hastable->setItem(j,0,
              new QTableWidgetItem(QString("%1").arg(QString::
              fromStdString(std::string(column[0])).toInt(),
              10, 10, QLatin1Char('0'))));
          for(int i=1;i<4;i++)
          {
              QString tmp(column[i]);
              tmp += "  ";
              this->ui->Hastable->setItem(j,i,new QTableWidgetItem(tmp));
          }
          j++;
     }
     //this->ui->Nottable->setEditTriggers(QAbstractItemView::NoEditTriggers);
     mysql_free_result(res);
}

void MainWindow::Task_finished()
{
    MYSQL_RES *res;
    std::string MySQLSentence;
    MYSQL_ROW column;
    int row;
    MySQLSentence = "SELECT task_houseid,taskcontent,applicationtime,"
                    "taskstarttime,taskendtime FROM"
                    " taskinfo,admin_taskrelation where taskid=admin_task_taskid "
                    "AND taskstate = 2 and (task_houseid =  ";
    for (auto house : this->User.HouseId)
    {
        MySQLSentence += house;
        MySQLSentence += " or task_houseid = ";
    }
    MySQLSentence += "0)";
    MySQLSentence += " ORDER BY applicationtime DESC;";
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
    this->ui->Fitable->setRowCount(row);
    int j=0;
    while((column = mysql_fetch_row(res)))
    {
        this->ui->Fitable->setItem(j,0,
             new QTableWidgetItem(QString("%1").arg(QString::
             fromStdString(std::string(column[0])).toInt(),
             10, 10, QLatin1Char('0'))));
          for(int i=1;i<5;i++)
          {
              QString tmp(column[i]);
              tmp += "  ";
              this->ui->Fitable->setItem(j,i,new QTableWidgetItem(tmp));
          }
          j++;
    }
     //this->ui->Nottable->setEditTriggers(QAbstractItemView::NoEditTriggers);
     mysql_free_result(res);
}

void MainWindow::on_pushButton_14_clicked()
{
    std::string MySQLSentence;
    std::string text = this->ui->TasktextEdit->toPlainText().toStdString();
    std::string text1 = this->ui->Task_comboBox->currentText().toStdString();
    if(text.empty() || text1.empty())
        return;
    MySQLSentence = "INSERT INTO taskinfo(taskstate, taskcontent,"
                    "task_houseid, applicationtime)"
                    " VALUES (0, '"+ text +"', "+ text1 +", now());";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    Task_notBegin();
    this->ui->TasktextEdit->clear();
}
