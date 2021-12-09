import QtQuick 2.0

//property source1, source2, source3
//property textContent1, textContent2, textContent3, textContent4

Item {
    width: 350
    height: 100

    Rectangle {
        x:0
        y: 0
        width: 350
        height: 100
        border.color: "black"
        border.width: 1
        radius: 5
    }

    Image {
        x: 110
        y: 20
        width: 50
        height: 50
        source: source1
    }

    Image {
        x: 20
        y: 70
        width: 20
        height: 20
        source: ""
    }

    Image {
        x: 20
        y: 20
        width: 20
        height: 20
        source: ""
    }

    Text {
        id: txt1
        text: textContent1
        x: 222
        y: 8
    }

    Text {
        id: txt2
        text: textContent2
        x: 222
        y: 40
    }

    Text {
        id: txt3
        text: textContent3
        x: 222
        y: 66
    }

    Text {
        id: txt4
        text: textContent4
        x: 222
        y: 82
    }
}
