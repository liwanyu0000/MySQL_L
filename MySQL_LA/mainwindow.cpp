#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    this->ui->setupUi(this);
    //安装事件过滤器
    this->InitEventFilter();
    //设置无边框
    this->setWindowFlag(Qt::FramelessWindowHint);
    // 隐藏tabwidget头部
    this->ui->MainTabWidget->tabBar()->hide();
    this->ui->SignInTabWidget->tabBar()->hide();
    //主页面初始化
    this->InitCentreWidget();
    //连接信号和槽
    this->Init_SignalAndSlot();
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
 * @brief MainWindow::InitEventFilter
 * @author liwanyu
 * @details 安装事件过滤器
 */
void MainWindow::InitEventFilter()
{
    //为HeadWidget安装事件过滤器
    this->ui->HeadWidget->installEventFilter(this);
    //为PushButton安装事件过滤器
    this->ui->SignIn_Button->installEventFilter(this);
    this->ui->SignInOK_Button->installEventFilter(this);
    this->ui->Home_Quit_Button->installEventFilter(this);
    this->ui->Close_Button->installEventFilter(this);
    this->ui->Max_Button->installEventFilter(this);
    this->ui->Min_Button->installEventFilter(this);
    this->ui->ItemButton_1->installEventFilter(this);
    this->ui->ItemButton_2->installEventFilter(this);
    this->ui->ItemButton_3->installEventFilter(this);
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
    //针对按钮
    if (obj == this->ui->SignIn_Button ||
        obj == this->ui->SignInOK_Button ||
        obj == this->ui->Home_Quit_Button ||
        obj == this->ui->Close_Button ||
        obj == this->ui->Max_Button ||
        obj == this->ui->Min_Button ||
        obj == this->ui->ItemButton_1 ||
        obj == this->ui->ItemButton_2 ||
        obj == this->ui->ItemButton_3)
    {//当头部登录按钮能点击时，鼠标移动到其上时改变鼠标样式
        QPushButton *tmp = (QPushButton*)obj;
        if (tmp->isEnabled())
            if (event->type() == QEvent::Enter)
                setCursor(Qt::PointingHandCursor);
        if (event->type() == QEvent::Leave)
            setCursor(Qt::ArrowCursor);
    }
    return QWidget::eventFilter(obj, event);
}

/**
 * @brief MainWindow::InitCentreWidget
 * @param NULL
 * @author liwanyu
 * @details 主页面初始化 未登录进入登录页面，已登录进入个人主页
 */
void MainWindow::InitCentreWidget()
{
    this->ShowPage = this->ui->SignIn_Button;
    this->ShowPage->setDisabled(true);
    this->ui->MainTabWidget->setCurrentIndex(0);
    if (IsSignIn)
    {
        this->ui->ShowLabel->setText("已登录");
        this->ui->SignInTabWidget->setCurrentIndex(1);
    }
    else
    {
        this->ui->ShowLabel->setText("未登录");
        this->ui->SignInTabWidget->setCurrentIndex(0);
    }
}

/**
 * @brief MainWindow::Init_SignalAndSlot
 * @author liwanyu
 * @details 关联事件与槽函数
 */
void MainWindow::Init_SignalAndSlot()
{
    //关联账户输入框输入事件与使能登录按钮槽函数
    QObject::connect(this->ui->UserName_LineEdit, SIGNAL(textChanged(QString)), this, SLOT(EnableOKButton()));
    //关联密码输入框输入事件与使能登录按钮槽函数
    QObject::connect(this->ui->PassWord_LineEdit, SIGNAL(textChanged(QString)), this, SLOT(EnableOKButton()));
}

/**
 * @brief MainWindow::on_SignIn_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 登录按钮点击槽函数 未登录进入登录页面，已登录进入个人主页
 */
void MainWindow::on_SignIn_Button_clicked()
{
    this->ShowPage->setDisabled(false);
    this->ShowPage = this->ui->SignIn_Button;
    this->ShowPage->setDisabled(true);
    this->ui->MainTabWidget->setCurrentIndex(0);
    if (IsSignIn)
    {
        this->ui->ShowLabel->setText("已登录");
        this->ui->SignInTabWidget->setCurrentIndex(1);
    }
    else
    {
        this->ui->ShowLabel->setText("未登录");
        this->ui->SignInTabWidget->setCurrentIndex(0);
    }
}

/**
 * @brief MainWindow::on_ItemButton_1_clicked
 * @param NULL
 * @author liwanyu
 * @details 按钮点击槽函数 (登录后可用，否则提示登录)切换至//
 */
void MainWindow::on_ItemButton_1_clicked()
{
    if (IsSignIn)
    {
        //设置之前按钮可以
        this->ShowPage->setDisabled(false);
        //指向当前按钮
        this->ShowPage = this->ui->ItemButton_1;
        //设置当前按钮不可以
        this->ShowPage->setDisabled(true);
        //切换页面
        this->ui->MainTabWidget->setCurrentIndex(1);
    }
    else
        QMessageBox::information(this, "注意", "请先登录！");

}

/**
 * @brief MainWindow::on_ItemButton_2_clicked
 * @param NULL
 * @author liwanyu
 * @details 按钮点击槽函数 (登录后可用，否则提示登录)切换至\\
 */
void MainWindow::on_ItemButton_2_clicked()
{
    if (IsSignIn)
    {
        this->ShowPage->setDisabled(false);
        this->ShowPage = this->ui->ItemButton_2;
        this->ShowPage->setDisabled(true);
        this->ui->MainTabWidget->setCurrentIndex(2);
    }
    else
        QMessageBox::information(this, "注意", "请先登录！");
}

/**
 * @brief MainWindow::on_ItemButton_3_clicked
 * @param NULL
 * @author liwanyu
 * @details 按钮点击槽函数 (登录后可用，否则提示登录)切换至\\
 */
void MainWindow::on_ItemButton_3_clicked()
{
    if (IsSignIn)
    {
        this->ShowPage->setDisabled(false);
        this->ShowPage = this->ui->ItemButton_3;
        this->ShowPage->setDisabled(true);
        this->ui->MainTabWidget->setCurrentIndex(3);
    }
    else
        QMessageBox::information(this, "注意", "请先登录！");
}
