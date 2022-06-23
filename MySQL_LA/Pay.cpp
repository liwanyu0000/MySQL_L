#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"
/**
 * @brief MainWindow::on_PayCompleteButton_clicked
 * @param NULL
 * @author luorong
 * @details 已支付按钮点击槽函数
 */

void MainWindow::on_PayCompleteButton_clicked()
{
    this->ui->CostTabWidget->setCurrentIndex(0);
    Pay_Complete_query();
}

/**
 * @brief MainWindow::on_NotPayButton_clicked
 * @param NULL
 * @author luorong
 * @details 未支付按钮点击槽函数
 */
void MainWindow::on_NotPayButton_clicked()
{
    this->ui->CostTabWidget->setCurrentIndex(1);
    Not_Pay_query();
}

/**
 * @brief MainWindow::on_PayQueryButton_clicked
 * @param NULL
 * @author luorong
 * @details 查询按钮点击槽函数
 */
void MainWindow::on_PayQueryButton_clicked()

{
    this->ui->CostTabWidget->setCurrentIndex(2);
    MainWindow::Pay_Query();

}

/**
 * @brief MainWindow::Pay_Complete_query
 * @param NULL
 * @author luorong
 * @details 支付完成查询
 */
void MainWindow::Pay_Complete_query()
{
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    int rows;
    MySQLSentence="SELECT costid,cost_houseid,costmoney,coststarttime,paytime,costtype FROM "
                  "costinfo,costtypeinfo WHERE cost_costtypeid = costtypeid and paytime is NOT NULL";
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
    ui->PayComplete_TableWidget->setRowCount(rows);     //设置行数
    for(int i=0;i<rows;i++)
    {
         column = mysql_fetch_row(res);
         for (int col = 0; col < 6; col++)
         {
             QString tmp(column[col]);
             ui->PayComplete_TableWidget->setItem(i,col, new QTableWidgetItem(tmp) );
             ui->PayComplete_TableWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
         }

    }
}
/**
 * @brief MainWindow::Not_Pay_query
 * @param NULL
 * @author luorong
 * @details 未支付查询
 */
void MainWindow::Not_Pay_query()
{
        MYSQL_RES *res;                 //数据库查询结果集
        MYSQL_ROW column;               //一行数据
        std::string MySQLSentence;      //MySQL语句
        int rows;
        MySQLSentence="SELECT costid,cost_houseid,costmoney,coststarttime,costtype "
                      "FROM costinfo,costtypeinfo WHERE cost_costtypeid = costtypeid and paytime is NULL";
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
         ui->NotPayTableWidget->setRowCount(rows);     //设置行数
         for(int i=0;i<rows;i++)
         {
                 column = mysql_fetch_row(res);
                 for (int col = 0; col < 5; col++)
                 {
                     QString tmp(column[col]);
                     ui->NotPayTableWidget->setItem(i,col, new QTableWidgetItem(tmp) );
                     ui->NotPayTableWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
                 }

         }
}

/**
 * @brief MainWindow::Pay_Query
 * @param NULL
 * @author luorong
 * @details 根据户号查询缴费信息
 */
void MainWindow::Pay_Query()
{
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    QString house_ID=this->ui->FindLineEdit->text();
    MySQLSentence="SELECT costid,cost_houseid,costmoney,coststarttime,paytime,costtype FROM costinfo,costtypeinfo "
                  "WHERE cost_costtypeid = costtypeid and cost_houseid ="+house_ID.toStdString()+";";
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

    int rows = mysql_affected_rows(&this->MySQL_Data);
    ui->ShowLabel->setNum(rows);
    if (rows == 0)                //判断是否存在
    {
        ui->ShowLabel->setText("没有相关信息");
        mysql_free_result(res);
        return ;
    }
    else
    {
        ui->PayComplete_TableWidget->setRowCount(rows);     //设置行数
        for(int i=0;i<rows;i++)
        {
                column = mysql_fetch_row(res);
                for (int col = 0; col < 6; col++)
                {
                    QString tmp(column[col]);
                    ui->PayComplete_TableWidget->setItem(i,col, new QTableWidgetItem(tmp) );
                    ui->PayComplete_TableWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
                }

        }
    }
}

