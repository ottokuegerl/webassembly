import QtQuick
import QtQuick.Window
import QtQuick.Controls

// ################################################################
// main.cpp
// qmlRegisterType<ARUBAAP172FA>("com.company.ArubaAP172FA",1,0,"Aruba2FA");
// ################################################################
import com.company.ArubaAP172FA 1.0  // within QML use Aruba2FA

// ################################################################
// main.cpp
// qmlRegisterType<HA2FA>("com.company.HomeAssistant2FA",1,0,"HA2FA");
// ################################################################
import com.company.HomeAssistant2FA 1.0 // within QML use HA2FA

// point to directory where BottomBar.qml is located
import "qrc:/ui/BottomBar"

// point to directory where CoolButton.qml is located
import "qrc:/ui/"

// point to directory where SecondWindow.qml is located
import "qrc:/ui/AboutWindow/"

// point to directory where ArubaWindow.qml is located
import "qrc:/ui/ArubaWindow/"

// point to directory where HAWindow.qml is located
import "qrc:/ui/HAWindow/"

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


ApplicationWindow {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello WPL!")
    color: "#5A6263" // dark gray

    // create object of class ARUBAAP172FA
    Aruba2FA{
        id: authcode
    }

    // create object of class HA2FA
    HA2FA{
        id: authcodeHA
    }

    FontLoader {
        id: wplFont
        source: "qrc:/ui/assets/RammettoOne-Regular.ttf"
    }

    menuBar: MenuBar {
        Menu {
            title: "2FA"
            font.family: wplFont.name

            MenuItem {
                text: "Aruba"
                onTriggered: {
                    arubaWindow.show()
                }
            }
            MenuItem {
                text: "Home Assistant"
                onTriggered: {
                    haWindow.show()
                }
            }
            MenuItem {
                text: "About"
                onTriggered: {
                    aboutWindow.show()
                }
            }
        }
    }

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
        source: "qrc:/ui/assets/ai_duck_03_2_round.png"
        opacity: 0.85
        fillMode: Image.PreserveAspectFit // Preserve the image's aspect ratio
    }

    Label {
        id: lblAruba
        anchors {
            top: parent.top
            topMargin: 230
            horizontalCenter: parent.horizontalCenter
        }
        text: "Werner is the best :-)"
        font.family: wplFont.name
        font.pixelSize: 25
        font.bold: true
        color: "#ffdc00" // yellow
        styleColor: "#8b0000" // red
        style: Text.Outline
        font.styleName: "Bold"
    }

    CoolButton {
        id: coolButtonRight
        width: 100
        height: 100
        anchors.centerIn: localDuckImage  // Position the button in the center of the image
        anchors.verticalCenterOffset: 80
        Image {
            anchors.centerIn: parent
            source: "qrc:/ui/assets/right.png"
            width: coolButtonRight.width * 0.5    // 50% of the original width
            height: coolButtonRight.height * 0.5  // 50% of the original height
        }
        onClicked: {
            console.log("Right clicked")
            aboutWindow.visible = true  // Show the second window when the button is clicked
            root.visible = false         // Hide the main window
        }
    }

    BottomBar{
        id: bottomBar
    }

    // Instantiate the second window from AboutWindow.qml
    AboutWindow {
        id: aboutWindow
    }

    // Instantiate the second window from ArubaWindow.qml
    ArubaWindow {
        id: arubaWindow
    }

    // Instantiate the second window from HAWindow.qml
    HAWindow {
        id: haWindow
    }
}
