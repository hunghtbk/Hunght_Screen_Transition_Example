import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Loader {
        id: loaderItem
        objectName: "loaderItem_objectName"
        anchors.fill: parent
        source: "qrc:/QML/Screen1.qml"
    }
}
