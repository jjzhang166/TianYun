import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Button {
    id: root
    implicitWidth: 218
    implicitHeight: 70
    enabled: true
    property int pixelSize: 25
    property color textColor: "#696969"
    
    style: ButtonStyle {
        background: Image {
            source: {
                if(enabled) {
                    if(control.hovered && ! control.pressed)    return "images/button-hover.png"
                    if(control.hovered && control.pressed)  return "images/button-press.png"
                    return "images/button.png"
                }
                return "images/button-disable.png"
            }
            //fillMode: Image.PreserveAspectFit
            smooth: true
        }

        label: Item {
            Text {
                anchors.centerIn: parent
                text: root.text
                font.pixelSize: root.pixelSize
                font.family: "微软雅黑"
                color: root.textColor
            }
        }
    }
}
