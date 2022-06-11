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
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QLabel>
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
    QSpacerItem *Spacer_1;
    QPushButton *Login_Button;
    QSpacerItem *Spacer_2;
    QPushButton *Min_Button;
    QSpacerItem *Spacer_4;
    QPushButton *Max_Button;
    QSpacerItem *Spacer_3;
    QPushButton *Close_Button;
    QWidget *CentreWidget;
    QHBoxLayout *horizontalLayout;
    QWidget *ItemWidget;
    QVBoxLayout *verticalLayout_2;
    QSpacerItem *ItemUSpacer;
    QPushButton *ExampleButton_0;
    QSpacerItem *ItemCSpacer_1;
    QPushButton *ExampleButton_1;
    QSpacerItem *ItemCSpacer_2;
    QPushButton *ExampleButton_2;
    QSpacerItem *ItemDSpacer;
    QSpacerItem *CentreCSpacer;
    QTabWidget *MainTabWidget;
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
        MainWindow->resize(924, 603);
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

        Spacer_1 = new QSpacerItem(550, 20, QSizePolicy::Expanding, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(Spacer_1);

        Login_Button = new QPushButton(HeadWidget);
        Login_Button->setObjectName(QString::fromUtf8("Login_Button"));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(Login_Button->sizePolicy().hasHeightForWidth());
        Login_Button->setSizePolicy(sizePolicy);
        Login_Button->setMinimumSize(QSize(40, 40));
        Login_Button->setStyleSheet(QString::fromUtf8("border-image: url(:/res/icon/Login.png);\n"
"border-radius:20px;\n"
"\n"
""));

        horizontalLayout_2->addWidget(Login_Button);

        Spacer_2 = new QSpacerItem(60, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(Spacer_2);

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

        Spacer_4 = new QSpacerItem(5, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(Spacer_4);

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

        Spacer_3 = new QSpacerItem(5, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout_2->addItem(Spacer_3);

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

        ExampleButton_0 = new QPushButton(ItemWidget);
        ExampleButton_0->setObjectName(QString::fromUtf8("ExampleButton_0"));
        ExampleButton_0->setEnabled(true);
        ExampleButton_0->setStyleSheet(QString::fromUtf8("QPushButton#ExampleButton_0 {\n"
"font: 24pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"border:none;\n"
"}\n"
"QPushButton#ExampleButton_0:hover{\n"
"background-color: rgb(255, 220, 220);\n"
"color: rgb(91, 91, 91);\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}\n"
"QPushButton#ExampleButton_0:disabled{\n"
"background-color: rgb(255, 212, 187);\n"
"color: rgb(91, 91, 91);;\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}"));
        ExampleButton_0->setCheckable(false);

        verticalLayout_2->addWidget(ExampleButton_0);

        ItemCSpacer_1 = new QSpacerItem(20, 10, QSizePolicy::Minimum, QSizePolicy::Fixed);

        verticalLayout_2->addItem(ItemCSpacer_1);

        ExampleButton_1 = new QPushButton(ItemWidget);
        ExampleButton_1->setObjectName(QString::fromUtf8("ExampleButton_1"));
        ExampleButton_1->setEnabled(true);
        ExampleButton_1->setStyleSheet(QString::fromUtf8("QPushButton#ExampleButton_1 {\n"
"font: 24pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"border:none;\n"
"}\n"
"QPushButton#ExampleButton_1:hover{\n"
"background-color: rgb(255, 220, 220);\n"
"color: rgb(91, 91, 91);\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}\n"
"QPushButton#ExampleButton_1:disabled{\n"
"background-color: rgb(255, 212, 187);\n"
"color: rgb(91, 91, 91);;\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}"));

        verticalLayout_2->addWidget(ExampleButton_1);

        ItemCSpacer_2 = new QSpacerItem(20, 10, QSizePolicy::Minimum, QSizePolicy::Fixed);

        verticalLayout_2->addItem(ItemCSpacer_2);

        ExampleButton_2 = new QPushButton(ItemWidget);
        ExampleButton_2->setObjectName(QString::fromUtf8("ExampleButton_2"));
        ExampleButton_2->setEnabled(true);
        ExampleButton_2->setStyleSheet(QString::fromUtf8("QPushButton#ExampleButton_2 {\n"
"font: 24pt \"\345\215\216\346\226\207\346\245\267\344\275\223\";\n"
"border:none;\n"
"}\n"
"QPushButton#ExampleButton_2:hover{\n"
"background-color: rgb(255, 220, 220);\n"
"color: rgb(91, 91, 91);\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}\n"
"QPushButton#ExampleButton_2:disabled{\n"
"background-color: rgb(255, 212, 187);\n"
"color: rgb(91, 91, 91);;\n"
"font: 26pt \"\345\215\216\346\226\207\350\241\214\346\245\267\";\n"
"border:none;\n"
"}"));

        verticalLayout_2->addWidget(ExampleButton_2);

        ItemDSpacer = new QSpacerItem(0, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(ItemDSpacer);


        horizontalLayout->addWidget(ItemWidget);

        CentreCSpacer = new QSpacerItem(13, 20, QSizePolicy::Fixed, QSizePolicy::Minimum);

        horizontalLayout->addItem(CentreCSpacer);

        MainTabWidget = new QTabWidget(CentreWidget);
        MainTabWidget->setObjectName(QString::fromUtf8("MainTabWidget"));
        MainTabWidget->setEnabled(true);
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

        MainTabWidget->setCurrentIndex(2);


        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "Admin", nullptr));
        LogoLabel->setText(QString());
        Login_Button->setText(QString());
        Min_Button->setText(QString());
        Max_Button->setText(QString());
        Close_Button->setText(QString());
        ExampleButton_0->setText(QCoreApplication::translate("MainWindow", "1", nullptr));
        ExampleButton_1->setText(QCoreApplication::translate("MainWindow", "2", nullptr));
        ExampleButton_2->setText(QCoreApplication::translate("MainWindow", "3", nullptr));
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
