#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"


/**
 * @brief MainWindow::on_Home_Quit_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 个人主页退出登录按钮点击槽函数  设置IsSignIn为false,切换至登录页面,设置IDLabel为空,清空用户信息
 */
void MainWindow::on_Home_Quit_Button_clicked()
{
    IsSignIn = false;
    this->ui->SignInTabWidget->setCurrentIndex(0);    
    this->ui->ShowLabel->setText("未登录");
    this->ui->IDLabel->setText("");
    this->Admin.clear();
}

/**
 * @brief MainWindow::EnableOKButton
 * @param NULL
 * @author liwanyu
 * @details 使能登录按钮槽函数 当且仅当账号输入框和密码输入框有输入时，登录按钮可用
 */
void MainWindow :: EnableOKButton()
{
    this->ui->SignInOK_Button->setEnabled(!(
                this->ui->UserName_LineEdit->text().isEmpty() ||
                this->ui->PassWord_LineEdit->text().isEmpty()));
}

/**
 * @brief MainWindow::SignIn_Verification
 * @param UserName  手机号/邮箱
 * @param IsPhone   是否为手机号
 * @return 登录是否成功(成功:true,失败:false)
 * @author liwanyu
 * @details 验证g管理员是否存在，密码是否正确。
 *          如果管理员存在且密码正确时，将管理员信息保存至this->Admin
 */
bool MainWindow::SignIn_Verification(QString UserName, bool IsPhone)
{
    this->Admin.clear();            //清空用户信息
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    //验证账户是否存在
    if (IsPhone)
        MySQLSentence = "SELECT * FROM admininfo WHERE adminphone = '"
                + UserName.toStdString() + "';";
    else
        MySQLSentence = "SELECT * FROM admininfo WHERE adminemail = '"
                        + UserName.toStdString() + "';";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行SQL语句
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return false;
    }
    if (!(res = mysql_store_result(&this->MySQL_Data)))               //获取结果集
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return false;
    }
    if (mysql_affected_rows(&this->MySQL_Data) == 0)                //判断管理员是否存在
    {
        this->ui->SignInShow_Label->setText("不存在该管理员");
        mysql_free_result(res);
        return false;
    }
    //判断账户是否激活
//    while (column = mysql_fetch_row(res))
//    {

//    }
    column = mysql_fetch_row(res);                                  //获取第一行数据
    if (!strcmp(column[3], "0"))
    {
        this->ui->SignInShow_Label->setText("该账户已注销！！！");
        mysql_free_result(res);
        return false;
    }
    //验证密码是否正确
    QString PassWord = this->ui->PassWord_LineEdit->text();
    if (PassWord != QString(column[2]))                             //判断密码是否正确
    {
        this->ui->SignInShow_Label->setText("密码错误");
        mysql_free_result(res);
        return false;
    }
    //保存管理员信息
    this->Admin.AdminID = column[0];
    this->Admin.AdminName = column[1];
    this->Admin.AdminPhone = column[4];
    this->Admin.AdminEmail = column[5];
    if (column[6] != NULL)
        this->Admin.PAdminId = column[6];
    mysql_free_result(res);                                         //释放结果集                                                //标记已登录
    return true;
}

/**
 * @brief MainWindow::on_SignInOK_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 登录按钮点击槽函数
 */
void MainWindow::on_SignInOK_Button_clicked()
{
    //清空提示框
    this->ui->SignInShow_Label->setText("");
    //获取账号输入框输入数据
    QString UserName = this->ui->UserName_LineEdit->text();
    //判断是否登录成功
    bool flag = false;
    //验证手机号、邮箱输入是否正确
    if (PhoneReg.exactMatch(UserName))
        flag = this->SignIn_Verification(UserName, true);
    else if (EmailReg.exactMatch(UserName))
        flag = this->SignIn_Verification(UserName, false);
    else
        this->ui->SignInShow_Label->setText("非法的手机号/邮箱");
    if (flag)
    {
        this->ui->ShowLabel->setText("已登录");
        this->ui->SignInTabWidget->setCurrentIndex(1);                  //切换至个人主页
        this->ui->IDLabel->setText(QString("%1").arg(QString::
                                   fromStdString(this->Admin.AdminID).toInt(),
                                   10, 10, QLatin1Char('0')));          //显示ID,10位
        Home_showmessage();
        IsSignIn = true;                                                //标记已登录
    }
    else
        this->ui->ShowLabel->setText("登录页面     登录失败！");

}


void MainWindow::on_Home_Update_Button_clicked()
{

}
/**
 * @brief MainWindow::Home_showmessage
 * @param NULL
 * @author luorong
 * @details 主页管理员信息展示函数
*/
void MainWindow :: Home_showmessage()
{
    this->ui->Home_NameLabel ->setText(QString::fromStdString(this->Admin.AdminName));
    this->ui->Home_EmailLabel->setText(QString::fromStdString(this->Admin.AdminEmail));
    this->ui->Home_PhomeLabel->setText(QString::fromStdString(this->Admin.AdminPhone));

}

