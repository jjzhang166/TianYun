import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

CheckBox {
    id: root
    style: CheckBoxStyle {
        indicator: Rectangle {
            implicitWidth: 12
            implicitHeight: 12
            border.color: control.hovered ? "green" : "gray"
            border.width: 1

            Canvas {
                anchors.fill: parent
                anchors.margins: 1
                visible: control.checked
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.save()
                    ctx.strokeStyle = "#477342"
                    ctx.lineWidth = 2
                    ctx.beginWidth = 2
                    ctx.moveTo(width / 10, height / 2)
                    ctx.lineTo(width * 2 / 5, height * 8 / 10)
                    ctx.lineTo(width, height / 10)
                    ctx.stroke()
                    ctx.restore()
                }
            }
        }
    
        label: MyText {
            text: root.text
        }
    }

    checked: true
}
