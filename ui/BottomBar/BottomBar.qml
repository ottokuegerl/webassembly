import QtQuick
import QtQuick.Controls

// ################################################################
// main.cpp
// qmlRegisterType<CredentialsWrapper>("com.wpl.credentials", 1, 0, "CredentialsWrapper");
// ################################################################
import com.wpl.credentials 1.0 // within QML use CredentialsWrapper

import com.company.wpl
import com.company.FileMgr

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
// ## BottomBar
// #############################################

Rectangle{
    id: rectangleBottomBar
    anchors{
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    height: parent.height / 10
    opacity: 0.9
    color: "#8b0000" // red

    WPLTime{
        id: wplTime
        anchors.verticalCenterOffset: -15
        anchors{
            right: parent.right
            rightMargin: 150
            // top: parent.top
            verticalCenter: parent.verticalCenter
        }
        myWplTimeId.color: "#ffffff" // white
    }

    Image {
        id: duckIcon
        anchors{
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }
        source: "qrc:/ui/assets/ai_duck_03_2_round.ico"
        height: parent.height * 0.8
        fillMode: Image.PreserveAspectFit

        // create an instance of CredentialsWrapper class
        // credentialswrapper.h
        CredentialsWrapper {
            id: credentials
        }

        // create an instance of WPL class
        // within wpl.h we have a signal called status so we can
        // use signal onStatus:
        WPL {
            id: wpl
        }

        // create an instance of FILESYSTEMMANAGER class
        // within filesystemmanager.h we have invokeable functions
        FileMgr {
            id: fileMgr
        }

        MouseArea {
            id: mouseAreaDuckIcon
            anchors.fill: parent
            onClicked: {
                wpl.myFunction()
                fileMgr.mountAndSyncFS()
                fileMgr.onSyncfsComplete()
                console.log("Duck icon clicked!!!")
                console.log("----> " + credentials.getWLAN_SSID() + " <----")
                console.log("----> " + credentials.getWLAN_PSW() + " <----")
            }
        }

        RotationAnimation on rotation {
            id: duckIconAnimation
            from: 0
            to: 360
            duration: 10000
            running: true
            loops: Animation.Infinite
        }

        Text {
            id: txtduckIcon
            anchors.centerIn: parent
            text: qsTr("WPL")
            font.family: wplFont.name
            font.pixelSize: 15
            font.bold: true
            color:  "#ffdc00" // yellow
            RotationAnimator on rotation {
                id: txtduckIconAnimation
                from: 360
                to: 0
                duration: 5000
                running: true
                loops: Animation.Infinite
            }
        }
    }
}
