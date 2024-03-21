import QtQuick 2.1
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root
    color: "#000000"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
        if (stage == 3) {
            imgAnimation.running = true
        }
        if (stage == 5) {
            bgAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent

        LinearGradient {
            id: background
            anchors.fill: parent
            opacity: 0
            start: Qt.point(0,0)
            end: Qt.point(parent.width,parent.height)
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#550000"
                }
                GradientStop {
                    position: 1.0
                    color: "#220000"
                }
            }
        }

        Image {
            id: logo_w
            width: root.width / 2
            height: root.height
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "images/totoshampoin-white.svg"
            sourceSize.width: root.width
            sourceSize.height: root.height
        }
        DropShadow {
            anchors.fill: logo_w
            horizontalOffset: 0
            verticalOffset: 0
            radius: 16.0
            samples: 17
            color: "#80000000"
            source: logo_w
        }
        Image {
            id: logo
            opacity: 0
            anchors.fill: logo_w
            fillMode: Image.PreserveAspectFit
            source: "images/totoshampoin-dark.svg"
            sourceSize.width: root.width
            sourceSize.height: root.height
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "width"
                target: logo_w
                from: 0
                to: root.width / 2
                duration: 1000
                easing.type: Easing.OutCubic
            }
        }
    }
    SequentialAnimation {
        id: imgAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "opacity"
                target: logo
                from: 0
                to: 1
                duration: 1000
                easing.type: Easing.OutCubic
            }
        }
    }
    SequentialAnimation {
        id: bgAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "opacity"
                target: background
                from: 0
                to: 1
                duration: 1000
                easing.type: Easing.OutCubic
            }
        }
    }
}
