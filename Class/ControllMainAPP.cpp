#include "ControllMainAPP.h"
#include <QDebug>

ControllMainAPP* ControllMainAPP::m_instance = nullptr;
void ControllMainAPP::initControlMainApp()
{
    m_uiBridge = new UIBridge(this);
    m_qmlEngine.rootContext()->setContextProperty("UIBridge", m_uiBridge);

    m_qmlEngine.load(QUrl(QStringLiteral("qrc:/QML/main.qml")));

    this->initMappingScreen();
}

ControllMainAPP *ControllMainAPP::getInstance()
{
    if (m_instance == nullptr) {
        m_instance = new ControllMainAPP();
    }
    return m_instance;
}

void ControllMainAPP::displayScreen(ScreenNameDefine nameScreen)
{
    QString nameScreenString = getNameScreen(nameScreen);
    QObject *rootObject = m_qmlEngine.rootObjects().first();
    QObject *qmlObject = rootObject->findChild<QObject*>("loaderItem_objectName");
    if (qmlObject) {
        qmlObject->setProperty("source", nameScreenString);
    } else {
        qDebug() << "Not found";
    }

    //Set propery:
    setPropertyHMI("current_time_lable", "text", "15:15:15");
}

void ControllMainAPP::setPropertyHMI(QString objectName, QString propertyHMI, QString data)
{
    QObject *rootObject = m_qmlEngine.rootObjects().first();
    QObject *qmlObject = rootObject->findChild<QObject*>(objectName);
    if (qmlObject) {
        qDebug() << "Starting to set objectName " << objectName << ", property " << propertyHMI << ", data " <<  data;
        qmlObject->setProperty(propertyHMI.toLocal8Bit().data(), data);
    } else {
        qDebug() << "Not found";
    }
}

ControllMainAPP::ControllMainAPP()
{

}

void ControllMainAPP::initMappingScreen()
{
    mscreenMap.insert("qrc:/QML/Screen1.qml", HN_SCREEN1);
    mscreenMap.insert("qrc:/QML/Screen2.qml", HN_SCREEN2);
    mscreenMap.insert("qrc:/QML/Screen3.qml", HN_SCREEN3);
    mscreenMap.insert("qrc:/QML/Screen4.qml", HN_SCREEN4);
}

QString ControllMainAPP::getNameScreen(int screenEnum)
{
    QString screenName = "";
    screenName = mscreenMap.key(static_cast<ScreenNameDefine>(screenEnum));
    qDebug() << "Name screen is got : " << screenName;
    return screenName;
}

void ControllMainAPP::handleHMIEvent(QString currentScreen, QString event)
{
    qDebug() << "Screen: " << currentScreen << "- event: " << event;
    if (currentScreen == "HN_SCREEN1") {
        if (event == "Next1") {
            displayScreen(HN_SCREEN2);
        } else if (event == "Back1"){
            displayScreen(HN_SCREEN4);
        }
    } else if(currentScreen == "HN_SCREEN2") {
        if (event == "Next2") {
            displayScreen(HN_SCREEN3);
        } else if (event == "Back2") {
            displayScreen(HN_SCREEN1);
        }
    } else if(currentScreen == "HN_SCREEN3") {
        if (event == "Next3") {
            displayScreen(HN_SCREEN4);
        } else if (event == "Back3") {
            displayScreen(HN_SCREEN2);
        }
    } else if(currentScreen == "HN_SCREEN4") {
        if (event == "Next4") {
            displayScreen(HN_SCREEN1);
        } else if (event == "Back4") {
            displayScreen(HN_SCREEN3);
        }
    }
}
