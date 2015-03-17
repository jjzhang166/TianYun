import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Item {
    id: root
    implicitWidth: 590
    implicitHeight: 22

    signal hiddened

    Text {
        width: 100
        height: 22
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        color: "#ABC0D6"
        text: "迅雷7"
    }
    
    Component {
        id: close_btn

        Button {
            width: 22
            height: 22

            onClicked: Qt.quit()

            style: ButtonStyle {
                background: Image {
                    source: {
                        if(control.hovered && ! control.pressed) return "images/close-btn-hover.png"
                        if(control.hovered && control.pressed) return "images/close-btn-press.png"
                        return "images/close-btn.png"
                    }
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }

    Component {
        id: default_btn

        Item {
            width: 50
            height: 22

            Loader {
                id: close
                width: 22
                height: 22
                anchors.right: parent.right
                anchors.top: parent.top
                sourceComponent: close_btn
            }

            Button {
                id: hidden 
                width: 22
                height: 22
                anchors.right: close.left
                anchors.rightMargin: 2
                
                style: ButtonStyle {
                    background: Image {
                        source: {
                            if(control.hovered && ! control.pressed) return "images/hidden-btn-hover.png"
                            if(control.hovered && control.pressed) return "images/hidden-btn-press.png"
                            return "images/hidden-btn.png"
                        }

                        fillMode: Image.PreserveAspectFit
                    }
                }

                onClicked: root.hiddened()
            }
        }
    }

    Component {
        id: hidden_min
        
        Loader {
            width: 22
            height: 22
            sourceComponent: close_btn
        }
    }

    Component {
        id: disable_close
        Image {
            width: 22
            height: 22
            source: "images/close-btn-disable.png"
        }
    }

   
    Loader {
        id: control_btn
        anchors.right: parent.right
        anchors.top: parent.top
        sourceComponent: default_btn
    }
    
    state: "default"

    states: [
        State {
            name: "default"
            PropertyChanges {
                target: control_btn
                sourceComponent: default_btn
            }
        }, 

        State {
            name: "hidden"
            PropertyChanges {
                target: control_btn
                sourceComponent: hidden_min
            }
        },

        State {
            name: "disable"
            PropertyChanges {
                target: control_btn
                sourceComponent: disable_close
            }
        }
    ]
}
