#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"


void MainWindow::on_WaitReplyButton_clicked()
{
    this->ui->MessageTabWidget->setCurrentIndex(0);
    this->ui->WaitReplyLTabWidget->setCurrentIndex(0);
    this->No_Response_Query();
}

void MainWindow::on_InformButton_clicked()
{
    this->ui->MessageTabWidget->setCurrentIndex(1);
}

void MainWindow::No_Response_Query()
{
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    int rows;
    MySQLSentence="SELECT c_aid, username, c_atime, c_aobject, userid "
                  "FROM complaint_and_acviceinfo, userinfo "
                  "WHERE c_a_userid =userid AND c_a_adminid IS NULL;";
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
    ui->WaitReplyTableWidget->setRowCount(rows);     //设置行数
    for(int i=0;i<rows;i++)
    {
        column = mysql_fetch_row(res);
        for(int col=0;col<5;col++)
        {
            QString tmp(column[col]);
            ui->WaitReplyTableWidget->setItem(i,col, new QTableWidgetItem(tmp));
            ui->WaitReplyTableWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
        }
    }
}


void MainWindow::on_MWLUEBackButton_clicked()
{
    this->ui->WaitReplyLTabWidget->setCurrentIndex(0);
    this->No_Response_Query();
}


void MainWindow::on_InformSendButton_clicked()
{
    std::string MySQLSentence;      //MySQL语句
    if((this->ui->TitalLineEdit->text().isEmpty() ||
            this->ui->InformTextEdit->toPlainText().isEmpty()))
    {
        this->ui->ShowLabel->setText("发送失败");
        return ;
    }
    MySQLSentence="INSERT INTO newsinfo(news_adminid,newstitle,newscontent,newstime,newsendtime,newstype)"
                  " VALUES ("+this->Admin.AdminID+", '"
                    +this->ui->TitalLineEdit->text().toStdString()+"', '"
                    +this->ui->InformTextEdit->toPlainText().toStdString()
                    +"', localtime(), localtime(), 0);";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    this->ui->TitalLineEdit->clear();
    this->ui->InformTextEdit->clear();
    this->ui->ShowLabel->setText("发送成功");
}


void MainWindow::on_WaitReplyTableWidget_cellDoubleClicked(int row, int col)
{
    this->ui->ReplyUserLabel->setText(
                this->ui->WaitReplyTableWidget->item(row, 4)->text());
    this->ui->WaitReplyLTabWidget->setCurrentIndex(1);
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    MySQLSentence="SELECT c_aid, c_atime, c_acontent "
                  "FROM complaint_and_acviceinfo "
                  "WHERE c_aid = "
                  + this->ui->WaitReplyTableWidget->item(row, 0)->text().toStdString()
                  + ";";
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
    column = mysql_fetch_row(res);
    this->ui->MWLHUserLabel->setText(QString(column[0]));
    this->ui->MWLHTimeLabel->setText(QString(column[1]));
    this->ui->MLUTextBrowser->setText(QString(column[2]));
}

void MainWindow::on_ReplySendButton_clicked()
{
    std::string MySQLSentence;      //MySQL语句
    if(this->ui->ReplyMessageTextEdit->toPlainText().isEmpty() )
    {
        this->ui->ShowLabel->setText("发送失败");
        return ;
    }
    MySQLSentence="CALL send_news("
                  +this->Admin.AdminID+ ","
                  + this->ui->ReplyUserLabel->text().toStdString() +","
                  + std::to_string(rand() % 100000 + 200) + ",'回复投诉/建议','"
                  + this->ui->ReplyMessageTextEdit->toPlainText().toStdString() + "', localtime(),"
                  + this->ui->MWLHUserLabel->text().toStdString() +");";
    //this->ui->ShowLabel->setText(QString::fromStdString(MySQLSentence));
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    this->ui->ReplyUserLabel->clear();
    this->ui->ReplyMessageTextEdit->clear();
    this->ui->ShowLabel->setText("发送成功");
    this->ui->WaitReplyLTabWidget->setCurrentIndex(0);
    this->No_Response_Query();
}


