#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"

/**
 * @brief MainWindow::on_SignInRegister_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 登录页面注册按钮点击槽函数 切换至注册页面
 */
void MainWindow::on_SignInRegister_Button_clicked()
{
    this->ui->ShowLabel->setText("注册页面");
    this->ui->SignInTabWidget->setCurrentIndex(2);
}

/**
 * @brief MainWindow::on_SignInForget_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 登录页面忘记密码按钮点击槽函数 切换至忘记密码页面
 */
void MainWindow::on_SignInForget_Button_clicked()
{
    this->ui->ShowLabel->setText("忘记密码？");
    this->ui->SignInTabWidget->setCurrentIndex(3);
}

/**
 * @brief MainWindow::on_RegisterBack_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 注册页面返回按钮点击槽函数 切换至登录页面
 */
void MainWindow::on_RegisterBack_Button_clicked()
{
    this->ui->ShowLabel->setText("未登录");
    this->ui->SignInTabWidget->setCurrentIndex(0);
}

/**
 * @brief MainWindow::on_ForgetBack_Button_clicked
 * @param NULL
 * @author liwanyu
 * @details 忘记密码页面返回按钮点击槽函数 切换至登录页面
 */
void MainWindow::on_ForgetBack_Button_clicked()
{
    this->ui->ShowLabel->setText("未登录");
    this->ui->SignInTabWidget->setCurrentIndex(0);
}

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
    this->User.clear();
    this->ui->Task_comboBox->clear();
    this->ui->Pcar_comboBox->clear();
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
 * @details 验证用户是否存在，密码是否正确。
 *          如果用户存在且密码正确时，将用户信息保存至this->User
 */
bool MainWindow::SignIn_Verification(QString UserName, bool IsPhone)
{
    this->User.clear();             //清空用户信息
    MYSQL_RES *res;                 //数据库查询结果集
    MYSQL_ROW column;               //一行数据
    std::string MySQLSentence;      //MySQL语句
    //验证账户是否存在
    if (IsPhone)
        MySQLSentence = "SELECT * FROM userinfo LEFT OUTER JOIN user_houserelation ON"
                        " userid = uh_relation_userid WHERE userphone = '"
                        + UserName.toStdString() + "';";
    else
        MySQLSentence = "SELECT * FROM userinfo LEFT OUTER JOIN user_houserelation ON"
                        " userid = uh_relation_userid WHERE useremail = '"
                        + UserName.toStdString() + "';";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
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
    if (mysql_affected_rows(&this->MySQL_Data) == 0)                //判断用户是否存在
    {
        this->ui->SignInShow_Label->setText("不存在该用户");
        mysql_free_result(res);
        return false;
    }
    //判断账户是否激活
    column = mysql_fetch_row(res);                                  //获取第一行数据
    if (!strcmp(column[3], "0"))
    {
        this->ui->SignInShow_Label->setText("该账户未激活, 请联系管理员");
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
    //保存用户信息
    this->User.UserID = column[0];
    this->User.UserName = column[1];
    this->User.UserPhone = column[4];
    this->User.UserEmail = column[5];
    if (column[7] != NULL)
    {
        this->User.HouseCount = 1;
        this->User.HouseId.push_back(column[7]);
    }
    //获取用户的所有的房屋ID
    while((column = mysql_fetch_row(res)))
    {
        if (column[7] != NULL)
        {
            this->User.HouseCount += 1;
            this->User.HouseId.push_back(column[7]);
        }
    }
    mysql_free_result(res);                                         //释放结果集
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
                                   fromStdString(this->User.UserID).toInt(),
                                   10, 10, QLatin1Char('0')));          //显示ID,10位
        IsSignIn = true;                                                //标记已登录
        this->ui->lineEdit->setText(QString::fromStdString(this->User.UserName));
        this->ui->lineEdit_2->setText(QString::fromStdString(this->User.UserPhone));
        this->ui->lineEdit_3->setText(QString::fromStdString(this->User.UserEmail));
        for (auto house : this->User.HouseId)
            this->ui->Task_comboBox->addItem(QString::fromStdString(house));
        for (auto house : this->User.HouseId)
            this->ui->Pcar_comboBox->addItem(QString::fromStdString(house));
    }
    else
        this->ui->ShowLabel->setText("登录页面     登录失败！");
}

/**
 * @brief MainWindow::EnableRegisterOK_Button
 * @param NULL
 * @author liwanyu
 * @details 使能注册按钮槽函数 当且仅当姓名输入框,密码输入框,确认密码输入框有输入时,
 *          手机号输入框和邮箱输入框至少有一个有输入时,注册按钮可用。
 */
void MainWindow :: EnableRegisterOK_Button()
{
    this->ui->RegisterOK_Button->setEnabled((!(
        this->ui->Name_LineEdit->text().isEmpty() ||
        this->ui->R_PassWord_LineEdit->text().isEmpty() ||
        this->ui->R_D_PassWord_LineEdit->text().isEmpty())) &&
        (!(this->ui->Phone_LineEdit->text().isEmpty() &&
         this->ui->Email_LineEdit->text().isEmpty())));
}

/**
 * @brief MainWindow::Register_Verification
 * @param PhoneNumber   手机号
 * @param Email         邮箱
 * @return              是否存在用户(不存在:true,存在:false)
 * @author liwanyu
 * @details             判断输入的手机号/邮箱是否被注册
 */
bool MainWindow::Register_Verification(QString PhoneNumber, QString Email)
{
    MYSQL_RES *res;                 //数据库查询结果集
    int row;                        //结果集中数据行数
    std::string MySQLSentence;      //MySQL语句
    MySQLSentence = "SELECT * FROM userinfo WHERE useremail = '"
                    + Email.toStdString() + "' OR userphone = '"
                    + PhoneNumber.toStdString() + "';";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))      //执行查询语句
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
    row = mysql_affected_rows(&this->MySQL_Data);                     //获取数据行数
    mysql_free_result(res);
    if (row < -1)                //判断用户是否存在(-1:出错,0:用户不存在,>1:用户存在)
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return false;
    }
    else if (row > 0)
    {
        this->ui->RegisterShow_Label->setText("该手机号或邮箱已被注册");
        return false;
    }
    else if (row == 0)
        return true;
    return false;
}

/**
 * @brief MainWindow::Register
 * @param Name          姓名
 * @param Phone         手机号
 * @param Email         邮箱
 * @param PassWord      密码
 * @return  注册是否成功(成功:true,失败:false)
 * @author liwanyu
 * @details             将注册信息添加到数据库中
 */
bool MainWindow::Register(std::string Name, std::string Phone,
              std::string Email, std::string PassWord)
{
    std::string MySQLSentence;      //MySQL语句
    MySQLSentence = "INSERT INTO userinfo(username, userpassword,"
                    "userphone, useremail, isactive) VALUES ('"
                    + Name + "', '"
                    + PassWord + "', '"
                    + Phone + "', '"
                    + Email + "', 1);";
    if (mysql_query(&this->MySQL_Data, MySQLSentence.c_str()))
    {
        QString Error = "error:";
        Error += mysql_error(&this->MySQL_Data);
        this->ui->ShowLabel->setText(Error);
        return false;
    }
    return true;
}

/**
 * @brief MainWindow::on_RegisterOK_Button_clicked
 * @author liwanyu
 * @details             注册按钮点击槽函数
 */
void MainWindow::on_RegisterOK_Button_clicked()
{
    //清空提示框
    this->ui->RegisterShow_Label->setText("");
    //该变量判断输入的手机号、邮箱、密码格式是否正确,两次输入的密码是否相同
    bool flag = true;
    QString Name = this->ui->Name_LineEdit->text();
    QString PhoneNumber = this->ui->Phone_LineEdit->text();
    QString Email = this->ui->Email_LineEdit->text();
    QString PassWord = this->ui->R_PassWord_LineEdit->text();
    QString text = "";
    //验证手机号输入是否正确
    if (!PhoneNumber.isEmpty())
    {
        if (!PhoneReg.exactMatch(PhoneNumber))
        {
            text += "手机号格式错误";
            flag = false;
        }
    }
    //验证邮箱是否输正确
    if (!Email.isEmpty())
    {
        if (!EmailReg.exactMatch(Email))
        {
            text += "  邮箱格式错误";
            flag = false;
        }
    }
    //判断两次输入的密码是否相同
    if (PassWordReg.exactMatch(PassWord))
    {
        if (this->ui->R_D_PassWord_LineEdit->text() != PassWord)
        {
            text += "  两次输入的密码不同";
            flag = false;
        }
    }
    else        //判断密码是否包含小写字符、大写字符、数字，不小于8位
    {
        text += "  密码过于简单(需包含小写字符、大写字符、数字，不小于8位)";
        flag = false;
    }
    if (!flag)
    {
        this->ui->RegisterShow_Label->setText(text);
    }
    else if (this->Register_Verification(PhoneNumber, Email))
    {
        if (this->Register(Name.toStdString(), PhoneNumber.toStdString(),
                       Email.toStdString(), PassWord.toStdString()))
        {
            this->ui->ShowLabel->setText("未登录    注册成功！");
            this->ui->SignInTabWidget->setCurrentIndex(0);      //切换回登录页面
            //清空输入框
            this->ui->Name_LineEdit->setText("");
            this->ui->Phone_LineEdit->setText("");
            this->ui->Email_LineEdit->setText("");
            this->ui->R_PassWord_LineEdit->setText("");
            this->ui->R_D_PassWord_LineEdit->setText("");
        }
        else
            this->ui->RegisterShow_Label->setText("注册失败");
    }
}

