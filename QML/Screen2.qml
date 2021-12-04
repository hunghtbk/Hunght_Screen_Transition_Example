import QtQuick 2.5

Item {
    visible: true
    width: 640
    height: 480

    Text {
        id: hunght2
        anchors.centerIn: parent
        text: qsTr("Screen 2")
    }

    Rectangle {
        width:  100
        height: 50
        radius: 5
        x: 0
        y: 0
        color: "black"

        Text {
            id: txtBack
            text: qsTr("Back2")
            anchors.centerIn: parent
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                UIBridge.sendEvent("HN_SCREEN2", "Back2");
            }
        }
    }

    Rectangle {
        width:  100
        height: 50
        radius: 5
        x: 540
        y: 0
        color: "black"

        Text {
            id: txtNext
            text: qsTr("Next2")
            anchors.centerIn: parent
            color: "green"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                UIBridge.sendEvent("HN_SCREEN2", "Next2");
            }
        }
    }
}
