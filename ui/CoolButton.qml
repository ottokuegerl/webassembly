import QtQuick

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


Item {
    id: coolBtn

    property color colorBorder: "#ffdc00"  // yellow
    property color colorNormal: "#8b0000"  // red
    property color colorPressed: "#ff9b36" // orange
    property color colorHover: "#6aa84f"   // green
    property string source: ""
    property string btnText: ""
    property string btnTextColor: ""
    property bool btnTextBold: false
    property int btnTextSize: 5

    signal clicked()

    Rectangle {
        id: body
        radius: width
        color: coolBtn.colorNormal
        border.width: 5
        border.color: coolBtn.colorBorder
        anchors.fill: parent
        Text {
            id: buttonText
            anchors.centerIn: parent
            color: coolBtn.btnTextColor
            text: coolBtn.btnText
            font.pointSize: coolBtn.btnTextSize
            font.bold: coolBtn.btnTextBold
        }

        MouseArea {
            id: area
            anchors.fill: parent
            hoverEnabled: true
            onPressed: {
                body.color = coolBtn.colorPressed
                coolBtn.clicked()
            }
            onReleased: {
                body.color = coolBtn.colorHover
            }
            onEntered: {
                body.color = coolBtn.colorHover
            }
            onExited: {
                body.color = coolBtn.colorNormal
            }
            onClicked: {
                console.log("Coolbutton Clicked")
                body.color = coolBtn.colorPressed
                coolBtn.clicked()
            }
        }

        Image {
            id: image
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            source: coolBtn.source
        }
    }

}

