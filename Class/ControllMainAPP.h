#ifndef CONTROLLMAINAPP_H
#define CONTROLLMAINAPP_H
#include <QQmlApplicationEngine>
#include <Class/UIBridge.h>
#include <QQmlContext>
#include <QMap>
#include "Class/ScreenName.h"

class ControllMainAPP : public QObject
{
    Q_OBJECT
public:
    Q_INVOKABLE void initControlMainApp();
    static ControllMainAPP* getInstance();

    void displayScreen(ScreenNameDefine nameScreen);
private:
    ControllMainAPP();
    static ControllMainAPP *m_instance;
    QQmlApplicationEngine m_qmlEngine;
    QObject* m_mainWindow = nullptr;

    UIBridge* m_uiBridge = nullptr;

    QMap<QString, int> mscreenMap;
private:
    void initMappingScreen();
    QString getNameScreen(int screenEnum);

public slots:
    void handleHMIEvent(QString currentScreen, QString event);
};

#endif // CONTROLLMAINAPP_H
