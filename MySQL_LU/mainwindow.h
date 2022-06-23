#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <Base.h>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

/**
 * @brief The MainWindow class
 * @author liwanyu hupeng luorong
 */
class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
protected:
    bool eventFilter(QObject *obj, QEvent *event);  //重写事件过滤器
private slots:
    void on_Max_Button_clicked();
    void on_ItemButton_1_clicked();
    void on_ItemButton_2_clicked();
    void on_ItemButton_3_clicked();
    void on_ItemButton_4_clicked();
    void on_Min_Button_clicked();
    void on_Close_Button_clicked();
    void on_SignIn_Button_clicked();
    void on_SignInRegister_Button_clicked();
    void on_SignInForget_Button_clicked();
    void on_RegisterBack_Button_clicked();
    void on_ForgetBack_Button_clicked();
    void on_Home_Quit_Button_clicked();
    void EnableOKButton();
    void EnableRegisterOK_Button();
    void on_SignInOK_Button_clicked();
    void on_RegisterOK_Button_clicked();
    void on_NewsList_TableWidget_cellDoubleClicked(int row, int col); 

    void on_Newscontent_back_clicked();

    void on_pushButton_4_clicked();

    void on_pushButton_5_clicked();

    void on_pushButton_7_clicked();

    void on_pushButton_8_clicked();

    void on_pushButton_9_clicked();

    void on_pushButton_14_clicked();


    void on_Buypcar_Table_cellDoubleClicked(int row, int column);

    void on_Buypcar_pushButton_clicked();

    void on_Mypcar_pushButton_clicked();

    void on_bill_pushButton_clicked();

    void on_Cost_pushButton_clicked();

    void on_bill_Table_cellDoubleClicked(int row, int column);


    void on_pay_table_cellDoubleClicked(int row, int column);

    void on_Pay_PushButton_clicked();

    void on_Buypcar_back_clicked();

    void on_Mypcar_back_clicked();


    void on_Buypcardetails_back_clicked();

    void on_Bill_back_clicked();

    void on_Applytask_back_clicked();

    void on_Mytask_back_clicked();

    void on_Mytask_back_2_clicked();

    void on_Mytask_back_3_clicked();

    void on_Task_back_clicked();

    void on_Pcar_back_clicked();

    void on_billdetails_back_clicked();

    void on_Pay_back_clicked();

    void on_Paydetails_back_clicked();

    void on_BuypushButton_clicked();

private:
    Ui::MainWindow *ui;
    MYSQL MySQL_Data;                               //MySQL句柄
    QPoint DragPosition;                            //记录鼠标上一次的位置
    QPushButton *ShowPage;                          //当前选中的页
    UserInfo User;                                  //用户信息
    void InitMySQL(MYSQL *MySQL_Data);              //数据库初始化
    void Max_Button_UpdateIcon();                   //最大化\恢复按钮图标切换
    void InitEventFilter();                         //安装事件过滤器
    void InitCentreWidget();                        //主页面初始化
    void Init_SignalAndSlot();                      //连接信号和槽
    bool SignIn_Verification(QString UserName, bool IsPhone);       //邮箱\手机号登录验证
    bool Register_Verification(QString PhoneNumber, QString Email); //账户存在验证
    bool Register(std::string Name, std::string Phone,
                  std::string Email, std::string PassWord);
    //将账户信息加入数据库
    void news_listWidget();
    void InitNewsList_TableWidget();
    void Task_notBegin();
    void Task_Begin();
    void Task_finished();
    void Pcar_mypcar();
    void Pcar_buycar();
    void Cost_bill();
    void Cost_pay();
    void InitServer();
    void InitCost();


};
#endif // MAINWINDOW_H
