#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    //初始化数据库
    this->InitMySQL(&this->MySQL_Data);
}

MainWindow::~MainWindow()
{
    mysql_close(&this->MySQL_Data);
    delete ui;
}

/**
 * @brief MainWindow::InitMySQL
 * @param MySQL_Data
 */
void MainWindow::InitMySQL(MYSQL* MySQL_Data)
{
    //初始化mysql
    mysql_init(MySQL_Data);
    //设置字符集
    mysql_options(MySQL_Data, MYSQL_SET_CHARSET_NAME, "utf8");
    //连接数据库
    if (!mysql_real_connect(MySQL_Data, "192.168.43.108", "luorong", "123456", "property_management", 3306, NULL, 0))
    {//失败将弹窗,关闭后退出
        QString text = "数据库连接失败:";
        text +=  + mysql_error(MySQL_Data);
        QMessageBox::critical(this, "Error", text);
        QTimer *CloseTimer = new QTimer();
        CloseTimer->start(0);
        connect(CloseTimer, &QTimer::timeout, this, [=](){this->close(); qApp->quit();});
    }
}
