import QtQuick

// #############################################
// ## 4 circles rotationg
// #############################################

Item {
    id: circleRotation
    rotation: 0
    // anchors.centerIn: parent
    x: 150
    y: 130

    Rectangle {
        id: yellowRect
        color: "#ffdc00" // yellow
        width: 100
        height: 100
        radius: width
        opacity: 1
        border.width: 5
        border.color: "#8b0000" // red
        anchors.centerIn: circleRotation
        transform: Translate { x: 50; y: 50}
    }

    Rectangle {
        id: blueRect
        color: "#0074d9" // blue
        width: 100
        height: 100
        radius: width
        opacity: 1
        border.width: 5
        border.color: "#8b0000" // red
        anchors.centerIn: circleRotation
        transform: Translate {x: -50; y: 50}
    }

    Rectangle {
        id: redRect
        color: "#8b0000" // red
        width: 100
        height: 100
        radius: width
        opacity: 1
        border.width: 5
        border.color: "#ffdc00" // yellow
        anchors.centerIn: circleRotation
        transform: Translate {x: -50; y: -50}
    }

    Rectangle {
        id: greenRect
        color: "#6aa84f" // green
        width: 100
        height: 100
        radius: width
        opacity: 1
        border.width: 5
        border.color: "#ffdc00" // yellow
        anchors.centerIn: circleRotation
        transform: Translate {x: 50; y: -50}

    }

    RotationAnimator {
        target: circleRotation
        from: 360
        to: 0
        duration: 5000
        direction: RotationAnimator.Counterclockwise
        loops: Animation.Infinite
        running: true
    }
}
