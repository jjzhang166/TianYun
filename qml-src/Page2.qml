import QtQuick 2.1

Rectangle {
    id: root 
    height: 435
    width: 590

    signal nexted

    Image {
        anchors.fill: parent
        source: "images/background.png"
        fillMode: Image.PreserveAspectFit
        smooth: true
    }

    MyButton {
        id: button2
        anchors.left: parent.left
        text: "next" 
        onClicked: root.nexted()
    }
}
