import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 800
    height: 600
    title: "Projectile Animation"

    Rectangle {
        id: projectile
        width: 10
        height: 10
        color: "red"
        radius: 5

        SequentialAnimation {
            id: animation
            running: true

            PropertyAnimation {
                target: projectile
                property: "x"
                to: trajectoryProvider.trajectory[1].x
                duration: 500
            }
            PropertyAnimation {
                target: projectile
                property: "y"
                to: trajectoryProvider.trajectory[1].y
                duration: 500
            }
            PropertyAnimation {
                target: projectile
                property: "x"
                to: trajectoryProvider.trajectory[2].x
                duration: 500
            }
            PropertyAnimation {
                target: projectile
                property: "y"
                to: trajectoryProvider.trajectory[2].y
                duration: 500
            }
            PropertyAnimation {
                target: projectile
                property: "x"
                to: trajectoryProvider.trajectory[3].x
                duration: 500
            }
            PropertyAnimation {
                target: projectile
                property: "y"
                to: trajectoryProvider.trajectory[3].y
                duration: 500
            }
            PropertyAnimation {
                target: projectile
                property: "x"
                to: trajectoryProvider.trajectory[4].x
                duration: 500
            }
            PropertyAnimation {
                target: projectile
                property: "y"
                to: trajectoryProvider.trajectory[4].y
                duration: 500
            }
        }
    }
}
