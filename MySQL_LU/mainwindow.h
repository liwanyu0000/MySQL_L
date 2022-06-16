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
                  std::string Email, std::string PassWord);         //将账户信息加入数据库
};
#endif // MAINWINDOW_H
