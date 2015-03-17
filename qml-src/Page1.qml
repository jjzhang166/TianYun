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
        text: "快速安装"
        enabled: check.checked
        onClicked: {
            root.nexted()
        }
    }

    Item {
        z: 10
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.bottomMargin: 20
        height: 20
        width: 100

        MyCheckBox {
            id: check
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            text: "阅读并同意软件安装协议"
        }

        MyText {
            anchors.left: check.right
            anchors.leftMargin: 3
            anchors.verticalCenter: parent.verticalCenter
            text: "许可协议"
            font.underline: false
            color: "#2db1e7"

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton

                onEntered: {
                    parent.font.underline = true
                    cursorShape = Qt.PointingHandCursor
                }

                onPressed: Qt.openUrlExternally("http://www.kylinos.com.cn/license");

                onExited: {
                    parent.font.underline = false
                    cursorShape = Qt.ArrowCursor
                }
            }
        }    
    }
    
    Button {
        z: 10
        width: 100
        height: 20
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 20
        enabled: check.checked

        style: ButtonStyle {
            background: Image {
                source: {
                    if(enabled) {
                        if(control.hovered)     return "images/zidingyi-hover.png"
                        return "images/zidingyi.png"
                    }
                    return "images/zidingyi-disable.png"
                }

                smooth: true
                fillMode: Image.PreserveAspectFit
            }
        }
        
        onClicked: {
            mianban.showed()
        }
    }
    
    Mianban {
        z: 20
        id: mianban
        y: parent.height

        onNexted: {
            root.nexted()
        }
        onHiddened: y = parent.height
        onShowed: y = parent.height - height

        Behavior on y {
            NumberAnimation {
                duration: 200
            }
        }
    }
}
