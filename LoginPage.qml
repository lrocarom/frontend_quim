import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    color: "#a3cab3" // Light green
    id: loginDialog
    visible: true
    width: parent.width
    height: parent.height
    objectName: "loginPage"

    // Center container to hold the login form
    Rectangle {
        id: loginForm
        width: parent.width * 0.8
        height: parent.height * 0.5
        anchors.centerIn: parent
        radius: 15
        color: "#ffffff"
        border.color: "#cccccc"
        border.width: 1



        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.8

            // Title
            Text {
                text: "Login"
                font.pointSize: 24
                font.bold: true
                color: "#333333"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Username Field
            TextField {
                id: usernameField
                placeholderText: "Username"
                width: parent.width
                height: 40
                font.pointSize: 14
                padding: 10
                background: Rectangle {
                    radius: 10
                    color: "#e0e0e0"
                    border.color: "#b0b0b0"
                }
            }

            // Password Field
            TextField {
                id: passwordField
                placeholderText: "Password"
                width: parent.width
                height: 40
                font.pointSize: 14
                padding: 10
                echoMode: TextInput.Password
                background: Rectangle {
                    radius: 10
                    color: "#e0e0e0"
                    border.color: "#b0b0b0"
                }
            }

            // Login Button
            Button {
                text: "Login"
                width: parent.width
                height: 40
                font.pointSize: 16
                font.bold: true
                background: Rectangle {
                    radius: 10
                    color: "#a8b8d5" // Nice blue color
                }
                contentItem: Text {
                    text: "Login"
                    color: "white"
                    font.bold: true
                    anchors.centerIn: parent
                }
                onClicked: {
                    // Add your login validation code here
                    if (usernameField.text === "" || passwordField.text === "") {
                        console.log("Please enter username and password.");
                    } else {
                        console.log("Logging in with username:", usernameField.text);
                    }
                    ipString: usernameField.text.toString()

                    navigationManager.checkUserNameAndPassword(usernameField.text,passwordField.text)


                }
            }

            Text {
                id: textBadQuestion
                objectName: "textBadQuestion"
                visible: false
                text: "Login not valid, try again"
                font.pointSize: 14
                color: "red"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
