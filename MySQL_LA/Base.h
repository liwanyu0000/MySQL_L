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
 * @brief The Admin struct
 */
struct AdminInfo
{
    std::string AdminID;                 //管理员id
    std::string AdminName;               //管理员名
    std::string AdminPhone;              //手机号
    std::string AdminEmail;              //邮箱
    std::string PAdminId;                //父管理员
    void clear()
    {
        this->AdminID.clear();
        this->AdminName.clear();
        this->AdminEmail.clear();
        this->AdminPhone.clear();
        this->PAdminId.clear();
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

extern bool WindowsIsMax;

extern bool IsSignIn;

#endif // BASE_H
