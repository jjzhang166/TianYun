import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    id: root 
    implicitHeight: 435
    implicitWidth: 590

    signal nexted

    Image {
        anchors.fill: parent
        source: "images/background.png"
        fillMode: Image.PreserveAspectFit
        smooth: true
    }

    MyButton {
        z: 10
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300
        text: "完成安装"
        onClicked: {
            Qt.quit()
        }
    }
}
