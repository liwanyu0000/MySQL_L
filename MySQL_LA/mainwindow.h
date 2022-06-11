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
    void on_ExampleButton_0_clicked();
    void on_ExampleButton_1_clicked();
    void on_ExampleButton_2_clicked();
    void on_Min_Button_clicked();
    void on_Close_Button_clicked();

private:
    Ui::MainWindow *ui;
    MYSQL MySQL_Data;                               //MySQL句柄
    QPoint DragPosition;                            //记录鼠标上一次的位置
    QPushButton *ShowPage;                           //当前选中的页
    void InitMySQL(MYSQL *MySQL_Data);              //数据库初始化
    void Max_Button_UpdateIcon();                   //最大化\恢复按钮图标切换
    void InitCentreWidget();                        //主页面初始化
};
#endif // MAINWINDOW_H
