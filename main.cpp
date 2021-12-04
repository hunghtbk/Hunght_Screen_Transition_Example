#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Class/ControllMainAPP.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);


    ControllMainAPP::getInstance()->initControlMainApp();

    return app.exec();
}
