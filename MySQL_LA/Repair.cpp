#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"

/**
 * @brief MainWindow::on_PendingButton_clicked
 * @param NULL
 * @author luorong
 * @details 待处理任务查询按钮点击槽函数
 */
void MainWindow::on_PendingButton_clicked()
{
    this->ui->RepairTabWidget->setCurrentIndex(0);
    Pengding_Query();
}

/**
 * @brief MainWindow::on_BeingPropushButton_clicked
 * @param NULL
 * @author luorong
 * @details 处理中任务查询按钮点击槽函数
 */
void MainWindow::on_BeingProButton_clicked()
{
    this->ui->RepairTabWidget->setCurrentIndex(1);
    In_Process_query();
}

/**
 * @brief MainWindow::on_CompleteButton_clicked
 * @param NULL
 * @author luorong
 * @details 完成任务查询按钮点击槽函数
 */
void MainWindow::on_CompleteButton_clicked()
{
    this->ui->RepairTabWidget->setCurrentIndex(2);
    Complete_query();
}

/**
 * @brief MainWindow::Pengding_Query
 * @param NULL
 * @author luorong
 * @details 待处理任务查询
 */
void MainWindow::Pengding_Query()
{
    this->Admin.clear();            //清空用户信息
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    int rows;
    MySQLSentence="SELECT task_houseid,taskcontent,taskid FROM taskinfo where taskstate = 0";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    if (!(res = mysql_store_result(&this->MySQL_Data)))               //获取结果集
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
     rows =mysql_affected_rows(&this->MySQL_Data);
     ui->PendingTableWidget->setRowCount(rows);     //设置行数
     for(int i=0;i<rows;i++)
     {
         column = mysql_fetch_row(res);
         for (int col = 0; col < 3; col++)
         {
             QString tmp(column[col]);
             ui->PendingTableWidget->setItem(i,col, new QTableWidgetItem(tmp) );
             ui->PendingTableWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
         }
      }
}
/**
 * @brief MainWindow::In_Process_query
 * @param NULL
 * @author luorong
 * @details 处理中任务查询按钮点击槽函数
 */
void MainWindow::In_Process_query()
{
    this->Admin.clear();            //清空用户信息
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    int rows;
    MySQLSentence="SELECT task_houseid,taskstarttime,taskcontent,taskid FROM taskinfo"
                  ",admin_taskrelation where taskid=admin_task_taskid "
                  "AND taskstate = 1";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    if (!(res = mysql_store_result(&this->MySQL_Data)))               //获取结果集
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
     rows =mysql_affected_rows(&this->MySQL_Data);
     ui->In_processTableWidget->setRowCount(rows);     //设置行数
     for(int i=0;i<rows;i++)
     {
         column = mysql_fetch_row(res);
         for (int col = 0; col < 3; col++)
         {
             QString tmp(column[col]);
             ui->In_processTableWidget->setItem(i,col, new QTableWidgetItem(tmp) );
             ui->In_processTableWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
         }
         ui->In_processTableWidget->setItem(i,3, new QTableWidgetItem("维修中") );
         ui->In_processTableWidget->item(i, 3)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
         ui->In_processTableWidget->setItem(i,4, new QTableWidgetItem(QString(column[3])) );
         ui->In_processTableWidget->item(i, 4)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
      }
}

/**
 * @brief MainWindow::Complete_query
 * @param NULL
 * @author luorong
 * @details 完成任务查询按钮点击查询
 */
void MainWindow::Complete_query()
{
    this->Admin.clear();            //清空用户信息
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    int rows;
    MySQLSentence="SELECT task_houseid, taskstarttime, taskendtime, taskcontent "
                  "FROM admin_taskrelation, taskinfo "
                  "WHERE taskid = admin_task_taskid AND ataskstate = 1;";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    if (!(res = mysql_store_result(&this->MySQL_Data)))               //获取结果集
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
     rows =mysql_affected_rows(&this->MySQL_Data);
     ui->CompleteTableWidget->setRowCount(rows);     //设置行数
     for(int i=0;i<rows;i++)
     {
         column = mysql_fetch_row(res);
         for (int col = 0; col < 4; col++)
         {
             QString tmp(column[col]);
             ui->CompleteTableWidget->setItem(i,col, new QTableWidgetItem(tmp) );
             ui->CompleteTableWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
         }
      }
}

void MainWindow::on_PendingTableWidget_cellDoubleClicked(int row, int column)
{
    std::string MySQLSentence;      //MySQL语句
    MySQLSentence="CALL receive_task("
                  + this->ui->PendingTableWidget->item(row, 2)->text().toStdString() +","
                  + this->Admin.AdminID +")";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    this->Pengding_Query();
}

void MainWindow::on_In_processTableWidget_cellDoubleClicked(int row, int column)
{
    std::string MySQLSentence;      //MySQL语句
    MySQLSentence="CALL successful_task("
                  + this->ui->In_processTableWidget->item(row, 4)->text().toStdString() +")";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    this->In_Process_query();
}
