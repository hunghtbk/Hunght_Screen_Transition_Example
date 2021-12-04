#include "UIBridge.h"
#include <QDebug>

UIBridge::UIBridge(QObject* appWindown) : QObject(appWindown) {
    connect(this, SIGNAL(hmiEvent(QString,QString)), appWindown, SLOT(handleHMIEvent(QString,QString)));
}
void UIBridge::sendEvent(QString screenName, QString event) {
    emit hmiEvent(screenName, event);
}
