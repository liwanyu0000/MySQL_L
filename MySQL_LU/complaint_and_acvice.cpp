#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"

void MainWindow::on_pushButton_4_clicked()
{

    std::string MySQLSentence;
    std::string text = this->ui->ComplaintandAcvice_TextEdit->toPlainText().toStdString();
    std::string text1 = this->ui->lineEdit_4->text().toStdString();
    if(text.empty() || text1.empty())
        return;
    MySQLSentence = "INSERT INTO complaint_and_acviceinfo(c_acontent,c_atime,c_aobject,c_a_userid)"
                    " VALUES('" + text + "', NOW(), '" +text1+ "',  " + this->User.UserID + "); ";

    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return;
    }
    this->ui->ComplaintandAcvice_TextEdit->clear();
    this->ui->lineEdit_4->clear();
}
