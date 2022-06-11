#include "mainwindow.h"
#include "ui_mainwindow.h"

/**
 * @brief WindowsIsMax
 * @details 该变量用来标识当前窗口是否最大化
 */
static bool WindowsIsMax = false;

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    //为HeadWidget安装事件过滤器
    ui->HeadWidget->installEventFilter(this);
    //设置无边框
    this->setWindowFlag(Qt::FramelessWindowHint);
    // 隐藏tabwidget头部
    ui->MainTabWidget->tabBar()->hide();
    //主页面初始化
    this->InitCentreWidget();
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
 * @param MySQL_Data 数据库句柄
 * @author liwanyu
 * @details 连接数据库，失败退出程序
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

/**
 * @brief MainWindow::on_Min_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 最小化按钮槽函数
 */
void MainWindow::on_Min_Button_clicked()
{
    this->showMinimized();
}

/**
 * @brief MainWindow::on_Close_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 关闭按钮槽函数
 */
void MainWindow::on_Close_Button_clicked()
{
    this->close();
    qApp->quit();
}

/**
 * @brief MainWindow::on_Max_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 最大化/还原按钮的功能实现
 */
void MainWindow::on_Max_Button_clicked()
{
    if (WindowsIsMax)
    {
        this->showNormal();
        WindowsIsMax = false;
    }
    else
    {
        this->showMaximized();
        WindowsIsMax = true;
    }
    this->Max_Button_UpdateIcon();
}

/**
 * @brief MainWindow::Max_Button_UpdateIcon
 * @param NULL
 * @author liwanyu
 * @details 更新最大化/还原按钮的图标
 */
void MainWindow::Max_Button_UpdateIcon()
{
    if (WindowsIsMax)
    {
        this->ui->Max_Button->setStyleSheet(
            QString::fromUtf8(
            "QPushButton#Max_Button {\n"
            "border:none;\n"
            "image: url(:/res/icon/Max_2.png);\n"
            "}\n"
            "QPushButton#Max_Button:hover{\n"
            "border:none;\n"
            "image: url(:/res/icon/Max_2.png);\n"
            "background-color: rgb(227, 227, 227);\n"
            "}\n"
            ""));
    }
    else
    {
        this->ui->Max_Button->setStyleSheet(
            QString::fromUtf8(
            "QPushButton#Max_Button {\n"
            "border:none;\n"
            "image: url(:/res/icon/Max_1.png);\n"
            "}\n"
            "QPushButton#Max_Button:hover{\n"
            "border:none;\n"
            "image: url(:/res/icon/Max_1.png);\n"
            "background-color: rgb(227, 227, 227);\n"
            "}\n"
            ""));
    }
}

/**
 * @brief MainWindow::eventFilter
 * @param obj
 * @param event
 * @return
 */
bool MainWindow::eventFilter(QObject *obj, QEvent *event)
{
    //针对头部
    if (obj == this->ui->HeadWidget)
    {
        //鼠标点击
        if (event->type() == QEvent::MouseButtonPress)
        {
            QMouseEvent *e = (QMouseEvent*)event;
            if (e->buttons() == Qt::LeftButton)
            {
                //记录鼠标的世界坐标.
                this->DragPosition = e->globalPos();
            }
        }
        //鼠标移动
        if (event->type() == QEvent::MouseMove)
        {
            QMouseEvent* e = (QMouseEvent*)event;
            if (e->buttons() == Qt::LeftButton && !WindowsIsMax)
            {
                //移动中的鼠标位置相对于初始位置的相对位置.
                QPoint Tmpposition = e->globalPos() - this->DragPosition;
                //然后移动窗体即可.
                this->move(this->pos() + Tmpposition );
                this->DragPosition = e->globalPos();
            }
        }
        // 双击头部实现最大化和还原
        if(event->type() == QEvent::MouseButtonDblClick)
        {
            QMouseEvent *e = (QMouseEvent*)event;
            if(e->buttons() == Qt::LeftButton)
            {
                // 如果窗口状态是正常状态则执行最大化函数，并改变相应图标样式
                if(!WindowsIsMax)
                {
                    this->showMaximized();
                    WindowsIsMax = true;
                }
                else
                {
                    this->showNormal();
                    WindowsIsMax = false;
                }
                this->Max_Button_UpdateIcon();
            }
        }
    }
    return QWidget::eventFilter(obj, event);
}

/**
 * @brief MainWindow::InitCentreWidget
 * @param NULL
 * @author liwanyu
 * @details 主页面初始化
 */
void MainWindow::InitCentreWidget()
{
    this->ShowPage = this->ui->ExampleButton_0;
    this->ShowPage->setDisabled(true);
    this->ui->MainTabWidget->setCurrentIndex(0);
}

/**
 * @brief MainWindow::on_ExampleButton_0_clicked
 * @param NULL
 * @author liwanyu
 * @details 按钮点击槽函数
 */
void MainWindow::on_ExampleButton_0_clicked()
{
    //设置之前按钮可以
    this->ShowPage->setDisabled(false);
    //指向当前按钮
    this->ShowPage = this->ui->ExampleButton_0;
    //设置当前按钮不可以
    this->ShowPage->setDisabled(true);
    //切换页面
    this->ui->MainTabWidget->setCurrentIndex(0);
}

/**
 * @brief MainWindow::on_ExampleButton_2_clicked
 * @param NULL
 * @author liwanyu
 * @details 按钮点击槽函数
 */
void MainWindow::on_ExampleButton_1_clicked()
{
    this->ShowPage->setDisabled(false);
    this->ShowPage = this->ui->ExampleButton_1;
    this->ShowPage->setDisabled(true);
    this->ui->MainTabWidget->setCurrentIndex(1);
}

/**
 * @brief MainWindow::on_ExampleButton_2_clicked
 * @param NULL
 * @author liwanyu
 * @details 按钮点击槽函数
 */
void MainWindow::on_ExampleButton_2_clicked()
{
    this->ShowPage->setDisabled(false);
    this->ShowPage = this->ui->ExampleButton_2;
    this->ShowPage->setDisabled(true);
    this->ui->MainTabWidget->setCurrentIndex(2);
}

