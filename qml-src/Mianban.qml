import QtQuick 2.2
import QtQuick.Dialogs 1.1

Rectangle {
    id: mianban
    implicitWidth: 590
    implicitHeight: 210

    MouseArea {
        anchors.fill: parent
    }

    signal hiddened
    signal nexted
    signal showed

    property alias text: freeSpace.text

    Item {
        anchors.fill: parent
        anchors.topMargin: 20
        anchors.bottomMargin: 25
        anchors.leftMargin: 25
        anchors.rightMargin: 25

        Row {
            id: location
            height: 15
            spacing: 0
            
            MyText {
                text: "安装位置："
            }

            MyText {
                color: "#A5A5A5"
                text: "/可用空间："
            }

            MyText {
                id: freeSpace
                color: "#A5A5A5"
            }
        }
    
        Item {
            id: input
            anchors.top: location.bottom
            anchors.topMargin: 15
            width: parent.width
            height: 34
            Rectangle {
                id: inputText
                width: 455
                height: 34
                border.width: 1
                border.color: "#a9b8c1"
                clip: true
                TextInput {
                    id: textEdit
                    text: "/usr/local/Program Files"
                    anchors.fill: parent
                    anchors.margins: 1
                    anchors.leftMargin: 8
                    readOnly: true
                    verticalAlignment: TextInput.AlignVCenter
                    horizontalAlignment: TextInput.AlignLeft
                    font.family: "微软雅黑"
                    font.pixelSize: 14
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: fileDialog.open()
                        hoverEnabled: true
                        onEntered: inputText.border.color = "#9c9c9c"
                        onExited: inputText.border.color = "#a9b8c1"
                    }

                    Component.onCompleted: {
                        System.RunCommand("if [ ! -d '" + textEdit.text  + "' ]; then mkdir -p '" + textEdit.text + "'; fi");
                        freeSpace.text = System.RunCommand("df -h " + "'" + textEdit.text + "'" + " | tail -n 1 |  awk '{print $4}'")
                    }
                }
            }

            MyButton {
                id: inputButton
                anchors.left: inputText.right
                anchors.leftMargin: -3
                anchors.verticalCenter: inputText.verticalCenter
                text: "浏览..."
                width: 90
                height: 41
                pixelSize: 12
                textColor: "#151515"

                onClicked: fileDialog.open()
            }
        }

        Row {
            anchors.top: input.bottom
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 3
            height: 12
            spacing: 20

            MyCheckBox {
                text: "开机启动"
            }

            MyCheckBox {
                text: "桌面快捷方式"
            }

            MyCheckBox {
                text: "快速启动栏"
            }
        }

        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: 100
            height: 45

            MyButton{
                width: 60
                height: 30
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                text: "返回"
                pixelSize: 12
                textColor: "#151515"

                onClicked: mianban.hiddened()
            }
        }
    }

    FileDialog {
        id: fileDialog
        selectFolder: true
        selectExisting: true
        title: "请选择安装路径"
        folder: "file:///" + textEdit.text
        onAccepted: {
            textEdit.text = fileUrl.toString().substring(7)
            freeSpace.text = System.RunCommand("df -h '" + textEdit.text + "' | tail -n 1 |  awk '{print $4}'")
        }
    }
}

