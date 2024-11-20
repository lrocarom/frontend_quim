import QtQuick.Window
import QtQuick.Controls


Window  {
    id: loginDialog
    visible: true
    title: qsTr("Hello World")
    width: parent.width
    height: parent.height
    color: "#a3cab3" // Light green
    Row {
        width: parent.width
        height: 60
        anchors.bottom: parent.bottom
        Rectangle {
            width: parent.width * 0.33
            height: parent.height
            border.color: "#a3cab3"
            color: "white"
            Text {
                anchors.centerIn: parent
                text: "Home"
                font.pointSize: 20
                font.bold: true
                color: "#a3cab3"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    navigationManager.goToMainPage()
                }
            }
        }

        Rectangle {
            width: parent.width * 0.33
            height: parent.height
            border.color: "#a3cab3"
            color: "white"
            Text {
                anchors.centerIn: parent
                text: "About Us"
                font.pointSize: 20
                font.bold: true
                color: "#a3cab3"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    navigationManager.goToAboutUs()
                }
            }
        }
        Rectangle {
            width: parent.width * 0.33
            height: parent.height
            border.color: "#a3cab3"
            color: "white"
            Text {
                anchors.centerIn: parent
                text: "Log Out"
                font.pointSize: 20
                font.bold: true
                color: "#a3cab3"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    navigationManager.goToLoginPage()
                }
            }
        }

    }
}
