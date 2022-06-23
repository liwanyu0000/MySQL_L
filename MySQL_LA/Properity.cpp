#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"

/**
 * @brief MainWindow::on_HouseSellButton_clicked
 * @param NULL
 * @author luorong
 * @details 空房出售按钮点击槽函数
 */
void MainWindow::on_HouseSellButton_clicked()
{
    this->ui->PropertyTabWidget->setCurrentIndex(0);
    ProFind();
}

/**
 * @brief  MainWindow::on_HouseTurnButton_clicked
 * @param NULL
 * @author luorong
 * @details 房屋转售按钮点击槽函数
 */
void MainWindow::on_HouseTurnButton_clicked()
{
    this->ui->PropertyTabWidget->setCurrentIndex(1);
}


/**
 * @brief MainWindow::on_HouseAddButton_clicked
 * @param NULL
 * @author luorong
 * @details 添加住户按钮点击槽函数
 */
void MainWindow::on_HouseAddButton_clicked()
{
    this->ui->PropertyTabWidget->setCurrentIndex(2);
}

/**
 * @brief  MainWindow:: ProFind()
 * @param NULL
 * @author luorong
 * @details 空房查询函数
 */
void MainWindow:: ProFind()
{

    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    int rows;
    MySQLSentence="SELECT lpad(houseid, 10, 0), location, adminname "
                  "FROM houseinfo, admininfo WHERE house_adminid = adminid "
                  "AND housestate = 0;";
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
    ui->SellTableWidget->setRowCount(rows);     //设置行数
    this->ui->ShowLabel->setNum(rows);
    for(int i=0;i<rows;i++)
    {
        column = mysql_fetch_row(res);
        for (int col = 0; col < 3; col++)
        {
            QString tmp = column[col];
            ui->SellTableWidget->setItem(i,col, new QTableWidgetItem(tmp));
            ui->SellTableWidget->item(i, col)->setTextAlignment(Qt::AlignHCenter | Qt::AlignVCenter);
        }
    }
}

void MainWindow::on_SellTableWidget_cellClicked(int row, int column)
{
    this->ui->SellHouseIDLabel->setText(this->ui->SellTableWidget->item(row, 0)->text());
}

void MainWindow::EnableSellOKButton()
{
    this->ui->SellOKButton->setEnabled(!this->ui->SellLineEdit->text().isEmpty());
}

void MainWindow::on_SellOKButton_clicked()
{
    std::string MySQLSentence;      //MySQL语句
    std::string text = this->ui->SellLineEdit->text().toStdString();
    text += "用户入住";
    text += this->ui->SellHouseIDLabel->text().toStdString();
    text += "房屋";
    MySQLSentence="CALL updata_new('" + this->ui->SellHouseIDLabel->text().toStdString()
            + "', '" + this->ui->SellLineEdit->text().toStdString() + "', "
            + this->Admin.AdminID
            + ", '" + text +  "');";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    this->ProFind();
    this->ui->SellLineEdit->clear();
    this->ui->SellHouseIDLabel->clear();
    this->ui->ShowLabel->setText("出售成功");
}

void MainWindow::EnableTurnOKButton()
{
    this->ui->Turn_OKButton->setEnabled(!(this->ui->TurnHouseIDlineEdit->text().isEmpty()
                                       || this->ui->HouseIDlineEdit_5->text().isEmpty()));
}

void MainWindow::on_Turn_OKButton_clicked()
{
    std::string MySQLSentence;      //MySQL语句
    std::string text = "房屋";
    text += this->ui->TurnHouseIDlineEdit->text().toStdString();
    text += "转手";
    text += this->ui->HouseIDlineEdit_5->text().toStdString();
    text += "用户";
    MySQLSentence="CALL updata_old('" + this->ui->TurnHouseIDlineEdit->text().toStdString()
            + "', '" + this->ui->HouseIDlineEdit_5->text().toStdString() + "', "
            + this->Admin.AdminID
            + ", '" + text +  "');";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return ;
    }
    this->ui->TurnHouseIDlineEdit->clear();
    this->ui->HouseIDlineEdit_5->clear();
    this->ui->ShowLabel->setText("转售成功");
}


