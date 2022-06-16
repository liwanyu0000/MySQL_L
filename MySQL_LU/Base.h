#ifndef BASE_H
#define BASE_H

#include <mysql.h>
#include <QMessageBox>
#include <QTimer>
#include <QMouseEvent>
#include <QTabBar>
#include <QPushButton>
#include <QRegExp>
#include <QRegExpValidator>
#include <QByteArray>
#include <string>
#include <iostream>
#include <vector>

/**
 * @brief The User struct
 */
struct UserInfo
{
    std::string UserID;                 //用户id
    int HouseCount;                     //拥有房屋总数
    std::string UserName;               //用户名
    std::string UserPhone;              //手机号
    std::string UserEmail;              //邮箱
    std::vector <std::string> HouseId;  //房屋ID
    void clear()
    {
        this->UserID.clear();
        this->HouseId.clear();
        this->UserName.clear();
        this->UserEmail.clear();
        this->UserPhone.clear();
        this->HouseCount = 0;
    }

};

/**
 * @brief PhoneReg
 * @details 电话号码正则表达式
 */
const static QRegExp PhoneReg("^[1][3,4,5,7,8,9][0-9]{9}$");
/**
 * @brief EmailReg
 * @details 邮箱正则表达式
 */
const static QRegExp EmailReg("[a-zA-Z-0-9-_]+@[a-zA-Z0-9-_]+\\.[a-zA-Z]+");

/**
 * @brief PassWordReg
 * @details 密码正则表达式
 */
const static QRegExp PassWordReg("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}");

extern bool WindowsIsMax;

extern bool IsSignIn;

#endif // BASE_H
