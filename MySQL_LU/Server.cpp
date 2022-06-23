#include "Base.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"

//服务页面
void MainWindow::on_pushButton_5_clicked()
{
  this->ui->serverfile->setCurrentIndex(1);
}
void MainWindow::on_pushButton_7_clicked()
{
  this->ui->serverfile->setCurrentIndex(2);
}
void MainWindow::on_Task_back_clicked()
{
    this->ui->serverfile->setCurrentIndex(0);
}
void MainWindow::on_Pcar_back_clicked()
{
    this->ui->serverfile->setCurrentIndex(0);
}

















