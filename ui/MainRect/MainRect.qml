import QtQuick
import QtQuick.Controls

// "#ffffff" // white
// "#000000" // black
// "#8b0000" // red
// "#ffdc00" // yellow
// "#0074d9" // blue
// "#c0c0c0" // gray
// "#5A6263" // dark gray
// "#ff9b36" // orange
// "#ffc0cb" // pink
// "#6aa84f" // green
// "#54fb0a" // limegreen

// #############################################
// ## MainRect
// ####################################

Rectangle{
    id: mainRect
    width: parent.width
    height: parent.width
    color: "#8b0000" // red

    AnimatedImage {
        id: animatedGears
        anchors.fill: parent
        source: "qrc:/ui/assets/gears_02.gif"
        opacity: 1
        playing: true
    }

    AnimatedImage {
        id: dancingBanana
        anchors.centerIn: animatedGears
        anchors.verticalCenterOffset: -250
        anchors.horizontalCenterOffset: 230
        source: "qrc:/ui/assets/dancing_banana.gif"
        rotation: -15
        speed: 0.7
        // fillMode: Image.PreserveAspectFit
        MouseArea {
            id: mouseareaDancingBanana
            hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                hintDialog2.open()
                timer.stop() // if timer is running stop it
                timer.start()
            }
            Timer {
                id: timer
                interval: 3000
                running: false
                repeat: false
                onTriggered: hintDialog2.close()
            }
        }
    }

    Text {
        id: lbl2FA
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        // get current 2FA "current2FA" from TWOFA object
        // defined within main.qml
        text: authcode.current2FA
        font.pixelSize: 200
        font.bold: true
        color: "#ffdc00" // yellow
        styleColor: "#8b0000" // red
        style: Text.Outline
        font.styleName: "Bold"
        MouseArea {
            id: mousearea2FA
            hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                hintDialog.open()
                timer2.stop() // if timer2 is running stop it
                timer2.start()
            }
            Timer {
                id: timer2
                interval: 3000
                running: false
                repeat: false
                onTriggered: hintDialog.close()
            }
        }
    }

    CircleRotation{
        id: circleRotation
    }

    Dialog {
        id: hintDialog
        modal: true
        width: 600
        height: 90
        anchors.centerIn: parent
        title: "Hint"
        // standardButtons: Dialog.Ok

        Label {
            text: "This is the 2FA <b>two factor authentication digest</b>"
            font.pointSize: 15
            color: "#ffdc00" // yellow
            anchors.centerIn: parent
        }
    }

    Dialog {
        id: hintDialog2
        modal: true
        width: 400
        height: 90
        anchors.centerIn: parent
        title: "Hint"
        // standardButtons: Dialog.Ok

        Label {
            text: "... only a dancing banana!"
            font.pointSize: 15
            color: "#ffdc00" // yellow
            anchors.centerIn: parent
        }
    }

}
