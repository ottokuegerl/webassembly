import QtQuick
import QtQuick.Window
import QtQuick.Controls

// point to directory where BottomBar.qml is located
import "qrc:/ui/BottomBar"

// point to directory where CoolButton.qml is located
import "qrc:/ui/"

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

Window {
    id: aboutWin
    width: 400
    height: 300
    visible: false  // Initially, the window is hidden
    title: "Second Window"
    color: "#c0c0c0" // gray

    AnimatedImage {
        id: animatedGears
        anchors.fill: parent
        source: "qrc:/ui/assets/gears_02.gif"
        opacity: 1
        playing: true
    }

    Image {
        id: localDuckImage
        anchors {
            top: parent.top
            topMargin: 40
            horizontalCenter: parent.horizontalCenter
        }
        source: "qrc:/ui/assets/ai_duck_09_round.png"
        width: sourceSize.width * 0.6   // 60% of the original width
        height: sourceSize.height * 0.6 // 60% of the original height
        opacity: 0.85
        fillMode: Image.PreserveAspectFit // Preserve the image's aspect ratio
    }

    FontLoader {
        id: wplFont
        source: "qrc:/ui/assets/RammettoOne-Regular.ttf"
    }

    Label {
        id: lblAbout
        anchors {
            top: parent.top
            topMargin: 200
            horizontalCenter: parent.horizontalCenter
        }
        text: "Version 1.1\n08/2023"
        font.family: wplFont.name
        font.pixelSize: 25
        font.bold: true
        color: "#ffdc00" // yellow
        styleColor: "#8b0000" // red
        style: Text.Outline
        font.styleName: "Bold"
    }

    CoolButton {
        id: coolButtonLeft
        width: 100
        height: 100
        anchors.centerIn: localDuckImage  // Position the button in the center of the image
        anchors.verticalCenterOffset: 80
        Image {
            anchors.centerIn: parent
            source: "qrc:/ui/assets/left.png"
            width: coolButtonLeft.width * 0.5    // 50% of the original width
            height: coolButtonLeft.height * 0.5  // 50% of the original height
        }
        onClicked: {
            console.log("Left Button clicked")
            aboutWin.visible = false;  // Hide the second window
            root.visible = true;        // Show the main window
        }
    }

    BottomBar{
        id: bottomBar
    }
}

