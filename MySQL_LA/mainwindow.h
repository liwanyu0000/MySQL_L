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
    void on_ItemButton_3_clicked();
    void on_Min_Button_clicked();
    void on_Close_Button_clicked();
    void on_SignIn_Button_clicked();
    void on_Home_Quit_Button_clicked();
    void EnableOKButton();
    void EnableSellOKButton();
    void EnableTurnOKButton();
    void on_SignInOK_Button_clicked();
    void on_ItemButton_4_clicked();
    void on_ItemButton_5_clicked();    
    void on_Home_Update_Button_clicked();

    void on_HouseSellButton_clicked();

    void on_HouseTurnButton_clicked();

    void on_HouseAddButton_clicked();

    void on_PendingButton_clicked();

    void on_BeingProButton_clicked();

    void on_PayQueryButton_clicked();

    void on_PayCompleteButton_clicked();

    void on_NotPayButton_clicked();

    void on_CompleteButton_clicked();

    void on_SellTableWidget_cellClicked(int row, int column);

    void on_SellOKButton_clicked();

    void on_Turn_OKButton_clicked();

    void on_WaitReplyButton_clicked();

    void on_InformButton_clicked();

    void on_MWLUEBackButton_clicked();

    void on_ReplySendButton_clicked();

    void on_InformSendButton_clicked();

    void on_WaitReplyTableWidget_cellDoubleClicked(int row, int column);

    void on_PendingTableWidget_cellDoubleClicked(int row, int column);

    void on_In_processTableWidget_cellDoubleClicked(int row, int column);

private:
    Ui::MainWindow *ui;
    MYSQL MySQL_Data;                               //MySQL句柄
    QPoint DragPosition;                            //记录鼠标上一次的位置
    QPushButton *ShowPage;                          //当前选中的页
    AdminInfo Admin;                                //管理员信息
    void InitMySQL(MYSQL *MySQL_Data);              //数据库初始化
    void Max_Button_UpdateIcon();                   //最大化\恢复按钮图标切换
    void InitEventFilter();                         //安装事件过滤器
    void InitCentreWidget();                        //主页面初始化
    void InitTabwidget();                           //隐藏Tabwidget表头
    void InitTableWidget();                         //初始化TabWidget
    void Init_SignalAndSlot();                      //连接信号和槽
    bool SignIn_Verification(QString UserName, bool IsPhone);       //邮箱\手机号登录验证
    void  Home_showmessage();                    //Home界面信息展示
    void ProFind();                                //空房查询
    void showBeSold();                             //已出售车位查询
    void showUnSold();                             //未出售车位查询
    void Pengding_Query();                         //待处理任务查询
    void In_Process_query();                       //处理中任务查询
    void Complete_query();                         //已完成任务查询
    void Pay_Complete_query();                     //已缴费用查询
    void Not_Pay_query();                           //未缴费用查询
    void Pay_Query();                               //根据户号缴费查询
    void No_Response_Query();                         //查询未回复投诉建议

};
#endif // MAINWINDOW_H
