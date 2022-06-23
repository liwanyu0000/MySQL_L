#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"

/**
 * @brief  MainWindow::on_BeSoldButton_clicked
 * @param NULL
 * @author luorong
 * @details 已售卖车位按钮点击槽函数
 */
void MainWindow::on_BeSoldButton_clicked()
{
    this->ui->StallTabWidget->setCurrentIndex(0);
    showBeSold();
}

/**
 * @brief MainWindow::on_UnsoldButton_clicked
 * @param NULL
 * @author luorong
 * @details 未售卖车位按钮点击槽函数
 */
void MainWindow::on_UnsoldButton_clicked()
{
    this->ui->StallTabWidget->setCurrentIndex(1);
    showUnSold();
}
/**
 * @brief MainWindow::showBeSold
 * @param NULL
 * @author luorong
 * @details 已购车位查询函数
 */
void MainWindow::showBeSold()
{
    this->Admin.clear();            //清空用户信息
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    int rows;
    MySQLSentence="SELECT pcarid,username,buytime,pcarloction FROM pcarinfo,userinfo,user_houserelation where pcarstate=2 AND uh_relation_userid=userid AND uh_relation_houseid=pcar_houseid";
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
     ui->BesoldTabWidget->setRowCount(rows);     //设置行数
     for(int i=0;i<rows;i++)
     {
             column = mysql_fetch_row(res);
             for (int col = 0; col < 4; col++)
             {
                 QString tmp(column[col]);
                 ui->BesoldTabWidget->setItem(i,col, new QTableWidgetItem(tmp) );
                 ui->BesoldTabWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
             }

     }

}
/**
 * @brief  MainWindow:: showUnSold()
 * @param NULL
 * @author luorong
 * @details 未购车位查询函数
 */
void MainWindow:: showUnSold()
{
    this->Admin.clear();            //清空用户信息
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    int rows;
    MySQLSentence="SELECT pcarid,pcarloction  FROM pcarinfo  WHERE pcarstate<>2;";
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
     ui->UnsoldtabWidget->setRowCount(rows);     //设置行数
     for(int i=0;i<rows;i++)
     {
         column = mysql_fetch_row(res);
         for (int col = 0; col < 2; col++)
         {
             QString tmp(column[col]);
             ui->UnsoldtabWidget->setItem(i,col, new QTableWidgetItem(tmp));
             ui->UnsoldtabWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
         }

     }
}

void MainWindow::EnableUnsoldOKButton()
{
    this->ui->UnsoldOKButton->setEnabled(!this->ui->UnsoldLineEdit->text().isEmpty());
}

void MainWindow::on_UnsoldtabWidget_cellClicked(int row, int column)
{
    this->ui->UnsoldIDLabel->setText(
                this->ui->UnsoldtabWidget->item(row, 0)->text()
                );
}

void MainWindow::on_UnsoldOKButton_clicked()
{
    std::string MySQLSentence;      //MySQL语句
    MySQLSentence="UPDATE pcarinfo SET pcarstate = 2, buytime = NOW(),"
                  " pcar_houseid = "
                  + this->ui->UnsoldLineEdit->text().toStdString() +
                    " WHERE pcarid = "
                    + this->ui->UnsoldIDLabel->text().toStdString() + ";";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    this->showUnSold();
    this->ui->UnsoldLineEdit->clear();
    this->ui->UnsoldIDLabel->clear();
    this->ui->ShowLabel->setText("出售成功");
}
