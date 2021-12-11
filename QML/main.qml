import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    id: mainScreen
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
//    color: "transparent"

    signal sendsignalFromMainQML(string msg)

    Loader {
        id: loaderItem
        objectName: "loaderItem_objectName"
        anchors.fill: parent
        source: "qrc:/QML/Screen2.qml"

         onLoaded: mainScreen.sendsignalFromMainQML.connect(loaderItem.item.receivedSignalFromMainQML)
    }

    Text {
        id: timeStatus
        objectName:  "current_time_lable"
        text: qsTr("11:11:11")
        x: 450
        y: 450
        z: 999
        width: 100
        height: 50
    }

    Text {
        id: batteryStatus
        objectName:  "battery_status_lable"
        text: qsTr("100%")
        x: 550
        y: 450
        z: 999
        width: 100
        height: 50
    }

    function callFunctionFromCPlus(msg){
        console.log("Got message:", msg)
        sendsignalFromMainQML(msg);
        return "some return value"

    }
}
