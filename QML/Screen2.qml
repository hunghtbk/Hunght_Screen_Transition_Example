import QtQuick 2.5
import QtQuick.Controls 2.0

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

    ListView {
        id: listItem
        x: 200
        y: 100
        width: 400
        height: 300
        delegate: Screen2ListDelegate {}
        clip: true
        model: ListModel {
            ListElement {
                source1: ""// cái này truyền ảnh vào nhé
                source2: ""// cái này truyền ảnh vào nhé
                source3: ""// cái này truyền ảnh vào nhé
                textContent1: "hunght1"
                textContent2: "hunght1"
                textContent3: "hunght1"
                textContent4: "hunght1"
            }

            ListElement {
                source1: ""// cái này truyền ảnh vào nhé
                source2: ""// cái này truyền ảnh vào nhé
                source3: ""// cái này truyền ảnh vào nhé
                textContent1: "hunght2"
                textContent2: "hunght2"
                textContent3: "hunght2"
                textContent4: "hunght2"
            }

            ListElement {
                source1: ""// cái này truyền ảnh vào nhé
                source2: ""// cái này truyền ảnh vào nhé
                source3: ""// cái này truyền ảnh vào nhé
                textContent1: "hunght3"
                textContent2: "hunght3"
                textContent3: "hunght3"
                textContent4: "hunght3"
            }

            ListElement {
                source1: ""// cái này truyền ảnh vào nhé
                source2: ""// cái này truyền ảnh vào nhé
                source3: ""// cái này truyền ảnh vào nhé
                textContent1: "hunght4"
                textContent2: "hunght4"
                textContent3: "hunght4"
                textContent4: "hunght4"
            }
        }

        ScrollBar.vertical: ScrollBar {
                    contentItem: Rectangle {
                        id: profileScreen_rec_4
                        implicitWidth: 25 //Chiều rộng của scrooll bar
                        implicitHeight: 300
                        color: "black"
                        radius: 10
                    }
                }

        onContentYChanged: {
            console.log(contentY)
        }
    }

    Rectangle {
        width:  100
        height: 50
        radius: 5
        x: 90
        y: 100
        color: "yellow"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                UIBridge.sendEvent("HN_SCREEN2", "Scroll_up");
            }
        }
    }

    Rectangle {
        width:  100
        height: 50
        radius: 5
        x: 90
        y: 200
        color: "brown"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                UIBridge.sendEvent("HN_SCREEN2", "Scroll_down");
            }
        }
    }

    function receivedSignalFromMainQML(msg){
        console.log("Got message from main.qml:", msg)
        if (msg === "Scroll_up") {
            if (listItem.contentY === listItem.contentHeight - listItem.height) {
                console.log("scrolled to bottom");
            } else {
                listItem.contentY = listItem.contentY + 50
            }
        } else if (msg === "Scroll_down") {
            listItem.contentY = listItem.contentY - 50
            if (listItem.contentY < 0) {
                listItem.contentY = 0
            }
        } else {
            console.log("Unresolve event")
        }

        return "some return value"
    }
}
