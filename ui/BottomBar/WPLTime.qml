import QtQuick
import QtQuick.LocalStorage

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
// ## current time
// #############################################


Item {
    id: wplTime

    // The slice(0,8) method is used to get only the first 8 characters
    // of the string which correspond to hh:mm:ss
    // property string currentTimeWPL: new Date().toLocaleTimeString().slice(0,8)
    property string currentTimeWPL: Qt.formatTime(new Date(), "hh:mm:ss")
    property alias myWplTimeId: txtTime  // point to Text { id: txtTime }

    Timer {
        id: timer
        interval: 500 // 500ms
        running: true
        repeat: true
        onTriggered: {
            // wplTime.currentTimeWPL = new Date().toLocaleTimeString().slice(0,8)
            wplTime.currentTimeWPL = Qt.formatTime(new Date(), "hh:mm:ss")
        }
    }

    Text {
        id: txtTime
        text: wplTime.currentTimeWPL
        font.family: wplFont.name
        font.pixelSize: 20
        font.bold: true
        color: "#8b0000" // red
        // styleColor: "#ffdc00" // yellow
        // style: Text.Outline
        // font.styleName: "Bold"
    }
}
