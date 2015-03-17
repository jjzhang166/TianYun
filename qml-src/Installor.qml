import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    width: 590
    height: 435
    maximumWidth: width
    maximumHeight: height
    flags: Qt.BypassWindowManagerHint //Qt.FramelessWindowHint
    //modality: Qt.ApplicationModal
    x: Screen.desktopAvailableWidth / 2  - width / 2
    y: Screen.desktopAvailableHeight / 2 - height / 2
    id: root
    visible: true

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        
        property variant previousPosition
        onPressed: {
            previousPosition = Qt.point(mouseX, mouseY)
        }
        
        onPositionChanged: {
            var dx = mouseX - previousPosition.x
            var dy = mouseY - previousPosition.y
            root.x += dx
            root.y += dy
        }
    }
    
    Title {
        id: title
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.topMargin: 10
        z: 30

        onHiddened:{
            root.visibility = Window.Windowed
            root.visibility = Window.Minimized
        }
    }

    Item {
        width: 590
        height: 435

        Loader {
            id: pageLoader1 
            source: "Page1.qml"
        }

        Loader {
            id: pageLoader2
            anchors.left: pageLoader1.right
            source: "Page2.qml"
        }

        Loader {
            id: pageLoader3
            anchors.left: pageLoader2.right
            source: "Page3.qml"
        }

        Connections {
            target: pageLoader1.item
            onNexted: {
                pageLoader1.parent.x -= 590   /* 切换到第二页 */
                title.state = "disable"
            }
        }

        Connections {
            target: pageLoader2.item 
            onNexted: {
                pageLoader2.parent.x -= 590   /* 切换到下一页 */
                title.state = "hidden"
            }
        }

        Behavior on x {
            NumberAnimation {
                duration: 400
            }
        }
    }
}
