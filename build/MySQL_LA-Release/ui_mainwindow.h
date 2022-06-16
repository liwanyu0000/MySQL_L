/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.14.2
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSpacerItem>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTabWidget>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QVBoxLayout *verticalLayout;
    QWidget *HeadWidget;
    QHBoxLayout *horizontalLayout_2;
    QLabel *LogoLabel;
    QSpacerItem *HSpacer_1;
    QPushButton *SignIn_Button;
    QSpacerItem *HSpacer_5;
    QLabel *IDLabel;
    QSpacerItem *HSpacer_2;
    QPushButton *Min_Button;
    QSpacerItem *HSpacer_4;
    QPushButton *Max_Button;
    QSpacerItem *HSpacer_3;
    QPushButton *Close_Button;
    QWidget *CentreWidget;
    QHBoxLayout *horizontalLayout;
    QWidget *ItemWidget;
    QVBoxLayout *verticalLayout_2;
    QSpacerItem *ItemUSpacer;
    QPushButton *ItemButton_1;
    QSpacerItem *ItemCSpacer_1;
    QPushButton *ItemButton_2;
    QSpacerItem *ItemCSpacer_2;
    QPushButton *ItemButton_3;
    QSpacerItem *ItemDSpacer;
    QSpacerItem *CentreCSpacer;
    QTabWidget *MainTabWidget;
    QWidget *SignIn_tab;
    QVBoxLayout *SignInLayout;
    QTabWidget *SignInTabWidget;
    QWidget *SignIn;
    QVBoxLayout *verticalLayout_3;
    QSpacerItem *SignInUSpacer;
    QHBoxLayout *SignIn_HeadLayout;
    QSpacerItem *SignIn_HeadLSpacer;
    QLabel *SignIn_LogoLabel;
    QSpacerItem *SignIn_HeadRSpacer;
    QSpacerItem *SignInCSpacer;
    QGridLayout *SignInMain_Layout;
    QSpacerItem *SULSpacer;
    QLabel *UserName_Label;
    QSpacerItem *SUCSpacer;
    QLineEdit *UserName_LineEdit;
    QSpacerItem *SURSpacer;
    QSpacerItem *SPLSpacer;
    QLabel *PassWord_Label;
    QSpacerItem *SPCSpacer;
    QLineEdit *PassWord_LineEdit;
    QSpacerItem *SPRSpacer;
    QSpacerItem *SignInCSpacer_2;
    QHBoxLayout *SignInShow_Layout;
    QSpacerItem *SSLSpacer;
    QLabel *SignInShow_Label;
    QSpacerItem *SSRSpacer;
    QSpacerItem *SignInCSpacer_3;
    QHBoxLayout *SignInOK_Layout;
    QSpacerItem *SOKLSpacer;
    QPushButton *SignInOK_Button;
    QSpacerItem *SOKRSpacer;
    QSpacerItem *SignInDSpacer;
    QWidget *Home;
    QVBoxLayout *verticalLayout_6;
    QSpacerItem *verticalSpacer_4;
    QHBoxLayout *Home_QuitLayout;
    QSpacerItem *HQLSpacer;
    QPushButton *Home_Quit_Button;
    QSpacerItem *HQRSpacer;
    QWidget *tab_1;
    QHBoxLayout *horizontalLayout_6;
    QLabel *label;
    QWidget *tab_2;
    QHBoxLayout *horizontalLayout_5;
    QLabel *label_2;
    QWidget *tab;
    QHBoxLayout *horizontalLayout_4;
    QLabel *label_3;
    QWidget *EndWidget;
    QHBoxLayout *horizontalLayout_3;
    QSpacerItem *EndLSpacer;
    QLabel *ShowLabel;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(1297, 744);
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        verticalLayout = new QVBoxLayout(centralwidget);
        verticalLayout->setSpacing(10);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        HeadWidget = new QWidget(centralwidget);
        HeadWidget->setObjectName(QString::fromUtf8("HeadWidget"));
        HeadWidget->setMinimumSize(QSize(0, 60));
        HeadWidget->setMaximumSize(QSize(16777215, 50));
        HeadWidget->setStyleSheet(QString::fromUtf8("background-color: rgb(236, 224, 216);"));
        horizontalLayout_2 = new QHBoxLayout(HeadWidget);
        horizontalLayout_2->setSpacing(0);
        horizontalLayout_2->setObjectName(QString::fromUtf8("horizontalLayout_2"));
        horizontalLayout_2->setContentsMargins(0, 0, 0, 0);
        LogoLabel = new QLabel(HeadWidget);
        LogoLabel->setObjectName(QString::fromUtf8("LogoLabel"));
        LogoLabel->setMinimumSize(QSize(200, 40));
        LogoLabel->setStyleSheet(QString::fromUtf8("border-image: url(:/res/image/Logo.png);"));

        horizontalLayout_2->addWidget(LogoLabel);

        HSpacer_1 = new QSpacerItem(550, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(HSpacer_1);

        SignIn_Button = new QPushButton(HeadWidget);
        SignIn_Button->setObjectName(QString::fromUtf8("SignIn_Button"));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(SignIn_Button->sizePolicy().hasHeightForWidth());
        SignIn_Button->setSizePolicy(sizePolicy);
        SignIn_Button->setMinimumSize(QSize(40, 40));
        SignIn_Button->setStyleSheet(QString::fromUtf8("border-image: url(:/res/icon/SignIn.png);\n"
"border-radius:20px;\n"
"\n"
""));

        horizontalLayout_2->addWidget(SignIn_Button);

        HSpacer_5 = new QSpacerItem(10, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(HSpacer_5);

        IDLabel = new QLabel(HeadWidget);
        IDLabel->setObjectName(QString::fromUtf8("IDLabel"));
        IDLabel->setStyleSheet(QString::fromUtf8("font: 87 12pt \"Arial Black\";"));

        horizontalLayout_2->addWidget(IDLabel);

        HSpacer_2 = new QSpacerItem(10, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(HSpacer_2);

        Min_Button = new QPushButton(HeadWidget);
        Min_Button->setObjectName(QString::fromUtf8("Min_Button"));
        Min_Button->setMinimumSize(QSize(40, 40));
        Min_Button->setStyleSheet(QString::fromUtf8("QPushButton#Min_Button {\n"
"border:none;\n"
"image: url(:/res/icon/min.png);\n"
"}\n"
"QPushButton#Min_Button:hover{\n"
"border:none;\n"
"image: url(:/res/icon/min.png);\n"
"background-color: rgb(227, 227, 227);\n"
"}"));

        horizontalLayout_2->addWidget(Min_Button);

        HSpacer_4 = new QSpacerItem(5, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(HSpacer_4);

        Max_Button = new QPushButton(HeadWidget);
        Max_Button->setObjectName(QString::fromUtf8("Max_Button"));
        Max_Button->setMinimumSize(QSize(40, 40));
        Max_Button->setStyleSheet(QString::fromUtf8("QPushButton#Max_Button {\n"
"border:none;\n"
"image: url(:/res/icon/Max_1.png);\n"
"}\n"
"QPushButton#Max_Button:hover{\n"
"border:none;\n"
"image: url(:/res/icon/Max_1.png);\n"
"background-color: rgb(227, 227, 227);\n"
"}\n"
""));

        horizontalLayout_2->addWidget(Max_Button);

        HSpacer_3 = new QSpacerItem(5, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(HSpacer_3);

        Close_Button = new QPushButton(HeadWidget);
        Close_Button->setObjectName(QString::fromUtf8("Close_Button"));
        Close_Button->setMinimumSize(QSize(40, 40));
        Close_Button->setStyleSheet(QString::fromUtf8("QPushButton#Close_Button{\n"
"border:none;\n"
"image: url(:/res/icon/Close.png);\n"
"}\n"
"QPushButton#Close_Button:hover{\n"
"border:none;\n"
"image: url(:/res/icon/Close.png);\n"
"background-color: rgb(255, 0, 0);\n"
"}"));

        horizontalLayout_2->addWidget(Close_Button);


        verticalLayout->addWidget(HeadWidget);

        CentreWidget = new QWidget(centralwidget);
        CentreWidget->setObjectName(QString::fromUtf8("CentreWidget"));
        horizontalLayout = new QHBoxLayout(CentreWidget);
        horizontalLayout->setSpacing(0);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        horizontalLayout->setContentsMargins(0, 0, 0, 0);
        ItemWidget = new QWidget(CentreWidget);
        ItemWidget->setObjectName(QString::fromUtf8("ItemWidget"));
        ItemWidget->setEnabled(true);
        ItemWidget->setMinimumSize(QSize(200, 0));
        ItemWidget->setBaseSize(QSize(0, 0));
        ItemWidget->setStyleSheet(QString::fromUtf8("background-color: rgb(236, 224, 216);"));
        verticalLayout_2 = new QVBoxLayout(ItemWidget);
        verticalLayout_2->setSpacing(0);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        verticalLayout_2->setContentsMargins(10, 0, 0, 0);
        ItemUSpacer = new QSpacerItem(0, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(ItemUSpacer);

        ItemButton_1 = new QPushButton(ItemWidget);
        ItemButton_1->setObjectName(QString::fromUtf8("ItemButton_1"));
        ItemButton_1->setEnabled(true);
        ItemButton_1->setStyleSheet(QString::fromUtf8("QPushButton#ItemButton_1 {\n"
"font: 24pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"border:none;\n"
"}\n"
"QPushButton#ItemButton_1:hover{\n"
"background-color: rgb(255, 220, 220);\n"
"color: rgb(91, 91, 91);\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}\n"
"QPushButton#ItemButton_1:disabled{\n"
"background-color: rgb(255, 212, 187);\n"
"color: rgb(91, 91, 91);;\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}"));
        ItemButton_1->setCheckable(false);

        verticalLayout_2->addWidget(ItemButton_1);

        ItemCSpacer_1 = new QSpacerItem(20, 10, QSizePolicy::Minimum, QSizePolicy::Fixed);

        verticalLayout_2->addItem(ItemCSpacer_1);

        ItemButton_2 = new QPushButton(ItemWidget);
        ItemButton_2->setObjectName(QString::fromUtf8("ItemButton_2"));
        ItemButton_2->setEnabled(true);
        ItemButton_2->setStyleSheet(QString::fromUtf8("QPushButton#ItemButton_2 {\n"
"font: 24pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"border:none;\n"
"}\n"
"QPushButton#ItemButton_2:hover{\n"
"background-color: rgb(255, 220, 220);\n"
"color: rgb(91, 91, 91);\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}\n"
"QPushButton#ItemButton_2:disabled{\n"
"background-color: rgb(255, 212, 187);\n"
"color: rgb(91, 91, 91);;\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}"));

        verticalLayout_2->addWidget(ItemButton_2);

        ItemCSpacer_2 = new QSpacerItem(20, 10, QSizePolicy::Minimum, QSizePolicy::Fixed);

        verticalLayout_2->addItem(ItemCSpacer_2);

        ItemButton_3 = new QPushButton(ItemWidget);
        ItemButton_3->setObjectName(QString::fromUtf8("ItemButton_3"));
        ItemButton_3->setEnabled(true);
        ItemButton_3->setStyleSheet(QString::fromUtf8("QPushButton#ItemButton_3 {\n"
"font: 24pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"border:none;\n"
"}\n"
"QPushButton#ItemButton_3:hover{\n"
"background-color: rgb(255, 220, 220);\n"
"color: rgb(91, 91, 91);\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}\n"
"QPushButton#ItemButton_3:disabled{\n"
"background-color: rgb(255, 212, 187);\n"
"color: rgb(91, 91, 91);;\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}"));

        verticalLayout_2->addWidget(ItemButton_3);

        ItemDSpacer = new QSpacerItem(0, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(ItemDSpacer);


        horizontalLayout->addWidget(ItemWidget);

        CentreCSpacer = new QSpacerItem(13, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout->addItem(CentreCSpacer);

        MainTabWidget = new QTabWidget(CentreWidget);
        MainTabWidget->setObjectName(QString::fromUtf8("MainTabWidget"));
        MainTabWidget->setEnabled(true);
        SignIn_tab = new QWidget();
        SignIn_tab->setObjectName(QString::fromUtf8("SignIn_tab"));
        SignInLayout = new QVBoxLayout(SignIn_tab);
        SignInLayout->setSpacing(0);
        SignInLayout->setObjectName(QString::fromUtf8("SignInLayout"));
        SignInLayout->setSizeConstraint(QLayout::SetDefaultConstraint);
        SignInLayout->setContentsMargins(0, 0, 0, 0);
        SignInTabWidget = new QTabWidget(SignIn_tab);
        SignInTabWidget->setObjectName(QString::fromUtf8("SignInTabWidget"));
        SignInTabWidget->setUsesScrollButtons(true);
        SignInTabWidget->setDocumentMode(false);
        SignInTabWidget->setTabsClosable(false);
        SignInTabWidget->setTabBarAutoHide(false);
        SignIn = new QWidget();
        SignIn->setObjectName(QString::fromUtf8("SignIn"));
        verticalLayout_3 = new QVBoxLayout(SignIn);
        verticalLayout_3->setObjectName(QString::fromUtf8("verticalLayout_3"));
        SignInUSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_3->addItem(SignInUSpacer);

        SignIn_HeadLayout = new QHBoxLayout();
        SignIn_HeadLayout->setObjectName(QString::fromUtf8("SignIn_HeadLayout"));
        SignIn_HeadLSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignIn_HeadLayout->addItem(SignIn_HeadLSpacer);

        SignIn_LogoLabel = new QLabel(SignIn);
        SignIn_LogoLabel->setObjectName(QString::fromUtf8("SignIn_LogoLabel"));
        SignIn_LogoLabel->setMinimumSize(QSize(400, 80));
        SignIn_LogoLabel->setStyleSheet(QString::fromUtf8("border-image: url(:/res/image/Logo.png);"));

        SignIn_HeadLayout->addWidget(SignIn_LogoLabel);

        SignIn_HeadRSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignIn_HeadLayout->addItem(SignIn_HeadRSpacer);


        verticalLayout_3->addLayout(SignIn_HeadLayout);

        SignInCSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_3->addItem(SignInCSpacer);

        SignInMain_Layout = new QGridLayout();
        SignInMain_Layout->setObjectName(QString::fromUtf8("SignInMain_Layout"));
        SULSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignInMain_Layout->addItem(SULSpacer, 0, 0, 1, 1);

        UserName_Label = new QLabel(SignIn);
        UserName_Label->setObjectName(QString::fromUtf8("UserName_Label"));
        UserName_Label->setMinimumSize(QSize(40, 40));
        UserName_Label->setMaximumSize(QSize(40, 40));
        UserName_Label->setStyleSheet(QString::fromUtf8("image: url(:/res/icon/UserName.png);"));

        SignInMain_Layout->addWidget(UserName_Label, 0, 1, 1, 1);

        SUCSpacer = new QSpacerItem(10, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        SignInMain_Layout->addItem(SUCSpacer, 0, 2, 1, 1);

        UserName_LineEdit = new QLineEdit(SignIn);
        UserName_LineEdit->setObjectName(QString::fromUtf8("UserName_LineEdit"));
        UserName_LineEdit->setMinimumSize(QSize(300, 40));
        UserName_LineEdit->setMaximumSize(QSize(300, 40));
        UserName_LineEdit->setStyleSheet(QString::fromUtf8("font: 12pt \"Arial\";"));

        SignInMain_Layout->addWidget(UserName_LineEdit, 0, 3, 1, 1);

        SURSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignInMain_Layout->addItem(SURSpacer, 0, 4, 1, 1);

        SPLSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignInMain_Layout->addItem(SPLSpacer, 1, 0, 1, 1);

        PassWord_Label = new QLabel(SignIn);
        PassWord_Label->setObjectName(QString::fromUtf8("PassWord_Label"));
        PassWord_Label->setMinimumSize(QSize(40, 40));
        PassWord_Label->setMaximumSize(QSize(40, 40));
        PassWord_Label->setStyleSheet(QString::fromUtf8("image: url(:/res/icon/PassWord.png);"));

        SignInMain_Layout->addWidget(PassWord_Label, 1, 1, 1, 1);

        SPCSpacer = new QSpacerItem(10, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        SignInMain_Layout->addItem(SPCSpacer, 1, 2, 1, 1);

        PassWord_LineEdit = new QLineEdit(SignIn);
        PassWord_LineEdit->setObjectName(QString::fromUtf8("PassWord_LineEdit"));
        PassWord_LineEdit->setMinimumSize(QSize(300, 40));
        PassWord_LineEdit->setMaximumSize(QSize(300, 40));
        PassWord_LineEdit->setStyleSheet(QString::fromUtf8("font: 12pt \"Arial\";"));
        PassWord_LineEdit->setEchoMode(QLineEdit::Password);

        SignInMain_Layout->addWidget(PassWord_LineEdit, 1, 3, 1, 1);

        SPRSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignInMain_Layout->addItem(SPRSpacer, 1, 4, 1, 1);


        verticalLayout_3->addLayout(SignInMain_Layout);

        SignInCSpacer_2 = new QSpacerItem(20, 10, QSizePolicy::Minimum, QSizePolicy::Fixed);

        verticalLayout_3->addItem(SignInCSpacer_2);

        SignInShow_Layout = new QHBoxLayout();
        SignInShow_Layout->setObjectName(QString::fromUtf8("SignInShow_Layout"));
        SSLSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignInShow_Layout->addItem(SSLSpacer);

        SignInShow_Label = new QLabel(SignIn);
        SignInShow_Label->setObjectName(QString::fromUtf8("SignInShow_Label"));
        SignInShow_Label->setMinimumSize(QSize(0, 20));
        SignInShow_Label->setMaximumSize(QSize(16777215, 20));
        SignInShow_Label->setStyleSheet(QString::fromUtf8("font: 10pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"color: rgb(255, 0, 0);"));
        SignInShow_Label->setAlignment(Qt::AlignCenter);

        SignInShow_Layout->addWidget(SignInShow_Label);

        SSRSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignInShow_Layout->addItem(SSRSpacer);


        verticalLayout_3->addLayout(SignInShow_Layout);

        SignInCSpacer_3 = new QSpacerItem(20, 10, QSizePolicy::Minimum, QSizePolicy::Fixed);

        verticalLayout_3->addItem(SignInCSpacer_3);

        SignInOK_Layout = new QHBoxLayout();
        SignInOK_Layout->setObjectName(QString::fromUtf8("SignInOK_Layout"));
        SOKLSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignInOK_Layout->addItem(SOKLSpacer);

        SignInOK_Button = new QPushButton(SignIn);
        SignInOK_Button->setObjectName(QString::fromUtf8("SignInOK_Button"));
        SignInOK_Button->setEnabled(false);
        SignInOK_Button->setMinimumSize(QSize(200, 40));
        SignInOK_Button->setMaximumSize(QSize(200, 40));
        SignInOK_Button->setStyleSheet(QString::fromUtf8("QPushButton#SignInOK_Button{\n"
"font: 16pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"border:none;\n"
"background-color: rgb(255, 129, 167);\n"
"color: rgb(0, 0, 0);\n"
"}\n"
"QPushButton#SignInOK_Button:hover{\n"
"font: 16pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"color: rgb(255, 255, 255);\n"
"}\n"
"QPushButton#SignInOK_Button:disabled{\n"
"font: 16pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"border:none;\n"
"color: rgb(179, 179, 179);\n"
"background-color: rgb(255, 255, 255);\n"
"}\n"
"\n"
""));

        SignInOK_Layout->addWidget(SignInOK_Button);

        SOKRSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        SignInOK_Layout->addItem(SOKRSpacer);


        verticalLayout_3->addLayout(SignInOK_Layout);

        SignInDSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_3->addItem(SignInDSpacer);

        SignInTabWidget->addTab(SignIn, QString());
        Home = new QWidget();
        Home->setObjectName(QString::fromUtf8("Home"));
        verticalLayout_6 = new QVBoxLayout(Home);
        verticalLayout_6->setObjectName(QString::fromUtf8("verticalLayout_6"));
        verticalSpacer_4 = new QSpacerItem(20, 474, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_6->addItem(verticalSpacer_4);

        Home_QuitLayout = new QHBoxLayout();
        Home_QuitLayout->setObjectName(QString::fromUtf8("Home_QuitLayout"));
        HQLSpacer = new QSpacerItem(10, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        Home_QuitLayout->addItem(HQLSpacer);

        Home_Quit_Button = new QPushButton(Home);
        Home_Quit_Button->setObjectName(QString::fromUtf8("Home_Quit_Button"));
        Home_Quit_Button->setMinimumSize(QSize(177, 40));
        Home_Quit_Button->setMaximumSize(QSize(50, 40));
        Home_Quit_Button->setStyleSheet(QString::fromUtf8("QPushButton#Home_Quit_Button {\n"
"font: 16pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"text-decoration: underline;\n"
"border:none;\n"
"}\n"
"QPushButton#Home_Quit_Button:hover {\n"
"font: 16pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"text-decoration: underline;\n"
"border:none;\n"
"color: rgb(6, 255, 226);\n"
"}"));

        Home_QuitLayout->addWidget(Home_Quit_Button);

        HQRSpacer = new QSpacerItem(40, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        Home_QuitLayout->addItem(HQRSpacer);


        verticalLayout_6->addLayout(Home_QuitLayout);

        SignInTabWidget->addTab(Home, QString());

        SignInLayout->addWidget(SignInTabWidget);

        MainTabWidget->addTab(SignIn_tab, QString());
        tab_1 = new QWidget();
        tab_1->setObjectName(QString::fromUtf8("tab_1"));
        horizontalLayout_6 = new QHBoxLayout(tab_1);
        horizontalLayout_6->setObjectName(QString::fromUtf8("horizontalLayout_6"));
        label = new QLabel(tab_1);
        label->setObjectName(QString::fromUtf8("label"));
        label->setStyleSheet(QString::fromUtf8("font: 72pt \"Arial\";"));

        horizontalLayout_6->addWidget(label);

        MainTabWidget->addTab(tab_1, QString());
        tab_2 = new QWidget();
        tab_2->setObjectName(QString::fromUtf8("tab_2"));
        horizontalLayout_5 = new QHBoxLayout(tab_2);
        horizontalLayout_5->setObjectName(QString::fromUtf8("horizontalLayout_5"));
        label_2 = new QLabel(tab_2);
        label_2->setObjectName(QString::fromUtf8("label_2"));
        label_2->setStyleSheet(QString::fromUtf8("font: 72pt \"Arial\";"));

        horizontalLayout_5->addWidget(label_2);

        MainTabWidget->addTab(tab_2, QString());
        tab = new QWidget();
        tab->setObjectName(QString::fromUtf8("tab"));
        horizontalLayout_4 = new QHBoxLayout(tab);
        horizontalLayout_4->setObjectName(QString::fromUtf8("horizontalLayout_4"));
        label_3 = new QLabel(tab);
        label_3->setObjectName(QString::fromUtf8("label_3"));
        label_3->setStyleSheet(QString::fromUtf8("font: 72pt \"Arial\";"));

        horizontalLayout_4->addWidget(label_3);

        MainTabWidget->addTab(tab, QString());

        horizontalLayout->addWidget(MainTabWidget);


        verticalLayout->addWidget(CentreWidget);

        EndWidget = new QWidget(centralwidget);
        EndWidget->setObjectName(QString::fromUtf8("EndWidget"));
        EndWidget->setMinimumSize(QSize(0, 40));
        EndWidget->setMaximumSize(QSize(16777215, 40));
        EndWidget->setStyleSheet(QString::fromUtf8("background-color: rgb(233, 241, 238);"));
        horizontalLayout_3 = new QHBoxLayout(EndWidget);
        horizontalLayout_3->setSpacing(0);
        horizontalLayout_3->setObjectName(QString::fromUtf8("horizontalLayout_3"));
        horizontalLayout_3->setContentsMargins(0, 0, 0, 0);
        EndLSpacer = new QSpacerItem(10, 19, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_3->addItem(EndLSpacer);

        ShowLabel = new QLabel(EndWidget);
        ShowLabel->setObjectName(QString::fromUtf8("ShowLabel"));
        ShowLabel->setMinimumSize(QSize(30, 30));
        ShowLabel->setStyleSheet(QString::fromUtf8("font: 12pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";"));

        horizontalLayout_3->addWidget(ShowLabel);


        verticalLayout->addWidget(EndWidget);

        MainWindow->setCentralWidget(centralwidget);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);

        retranslateUi(MainWindow);

        MainTabWidget->setCurrentIndex(0);
        SignInTabWidget->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "Admin", nullptr));
        LogoLabel->setText(QString());
        SignIn_Button->setText(QString());
        IDLabel->setText(QString());
        Min_Button->setText(QString());
        Max_Button->setText(QString());
        Close_Button->setText(QString());
        ItemButton_1->setText(QCoreApplication::translate("MainWindow", "1", nullptr));
        ItemButton_2->setText(QCoreApplication::translate("MainWindow", "2", nullptr));
        ItemButton_3->setText(QCoreApplication::translate("MainWindow", "3", nullptr));
        SignIn_LogoLabel->setText(QString());
        UserName_Label->setText(QString());
        UserName_LineEdit->setText(QString());
        UserName_LineEdit->setPlaceholderText(QCoreApplication::translate("MainWindow", "  \346\211\213\346\234\272\345\217\267/\351\202\256\347\256\261", nullptr));
        PassWord_Label->setText(QString());
        PassWord_LineEdit->setPlaceholderText(QCoreApplication::translate("MainWindow", "  \345\257\206\347\240\201", nullptr));
        SignInShow_Label->setText(QString());
        SignInOK_Button->setText(QCoreApplication::translate("MainWindow", "\347\231\273       \345\275\225", nullptr));
        SignInTabWidget->setTabText(SignInTabWidget->indexOf(SignIn), QCoreApplication::translate("MainWindow", "SignIn", nullptr));
        Home_Quit_Button->setText(QCoreApplication::translate("MainWindow", "\351\200\200\345\207\272\345\275\223\345\211\215\350\264\246\345\217\267", nullptr));
        SignInTabWidget->setTabText(SignInTabWidget->indexOf(Home), QCoreApplication::translate("MainWindow", "Home", nullptr));
        MainTabWidget->setTabText(MainTabWidget->indexOf(SignIn_tab), QCoreApplication::translate("MainWindow", "SignInPage", nullptr));
        label->setText(QCoreApplication::translate("MainWindow", "1", nullptr));
        MainTabWidget->setTabText(MainTabWidget->indexOf(tab_1), QCoreApplication::translate("MainWindow", "Tab 1", nullptr));
        label_2->setText(QCoreApplication::translate("MainWindow", "2", nullptr));
        MainTabWidget->setTabText(MainTabWidget->indexOf(tab_2), QCoreApplication::translate("MainWindow", "Tab 2", nullptr));
        label_3->setText(QCoreApplication::translate("MainWindow", "3", nullptr));
        MainTabWidget->setTabText(MainTabWidget->indexOf(tab), QCoreApplication::translate("MainWindow", "Tab 3", nullptr));
        ShowLabel->setText(QCoreApplication::translate("MainWindow", "\345\260\261\347\273\252\357\274\201", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
