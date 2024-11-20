import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick 6.2
import Qt5Compat.GraphicalEffects
Rectangle {
    visible: true
    width: parent.width
    height: parent.height
    color: "#f5f5f5" // Light gray background

    // Quiz code input box
    Rectangle {
        id: rect
        width: parent.width * 0.8
        height: 100
        radius: 10
        z: 1
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 101

        Column {
            anchors.centerIn: parent
            spacing: 10
        }

    }
    DropShadow {
           anchors.fill: rect
           cached: true
           horizontalOffset: 3
           verticalOffset: 3
           radius: 8.0
           samples: 16
           color: "#80000000"
           source: rect
       }

    Column {
        anchors.fill: parent

        // Top bar with title and profile icon
        Rectangle {
            anchors.top: parent.top
            width: parent.width
            height: 150
            color: "#a3cab3"

            Column {
                anchors.top: parent.top
                anchors.topMargin: 20
                spacing: 5
                padding:10
                Text {
                    text: "Aquest es el primer titol!"
                    font.pointSize: 25
                    color: "white"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                }
                Text {
                    text: "Aquest es el segon titol"
                    font.pointSize: 18
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            // Profile icon in the top right corner
            // (This part can be added if you have an icon)
        }


        // Recent quizzes list
        Column {
            width: parent.width
            // anchors.top: parent.top
            // anchors.topMargin: 252
            anchors.centerIn: parent
            spacing: 15
            Text {
                padding:10
                text: "Questionario del dia"
                font.pointSize: 21
                color: "#3b3a30"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }
            // Quiz 1
            Rectangle {
                width: parent.width * 0.8
                height: 80
                radius: 10
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    z: 1 // Bring to the front
                    onClicked: {
                        popup.open()
                        //navigationManager.showLoginDialog2()

                    }

                }

                Row {
                    anchors.fill: parent
                    spacing: 15
                    anchors.margins: 10

                    Rectangle {
                        width: 60
                        height: 60
                        color: "#FFCC80" // Math icon color
                        radius: 5

                        Text {
                            text: "#"
                            anchors.centerIn: parent
                            color: "white"
                        }
                    }

                    Column {
                        Text {
                            text: "Questionario mañana"
                            font.pointSize: 20
                            font.bold: true
                            color: "#3b3a30"
                        }
                        Text {
                            text: "0/5 Preguntas"
                            font.pointSize: 16
                            color: "#666666"
                        }
                    }
                }


                // Timer for color reset
                Timer {
                    id: colorResetTimer
                    interval: 200 // Duration of the effect
                    repeat: false
                    onTriggered: {
                        color = "white"; // Reset color
                    }
                }
            }


            Rectangle {
                width: parent.width * 0.8
                height: 80
                radius: 10
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    anchors.fill: parent
                    z: 1 // Bring to the front
                    onClicked: {
                        popup.open()
                        //navigationManager.showLoginDialog2()

                    }

                }

                Row {
                    anchors.fill: parent
                    spacing: 15
                    anchors.margins: 10

                    Rectangle {
                        width: 60
                        height: 60
                        color: "#A5D6A7" // English icon color
                        radius: 5

                        Text {
                            text: "<<"
                            anchors.centerIn: parent
                            color: "white"
                        }
                    }

                    Column {
                        Text {
                            text: "Questionario tarde"
                            font.pointSize: 20
                            font.bold: true
                            color: "#3b3a30"
                        }
                        Text {
                            text: "0/5 Preguntas"
                            font.pointSize: 16
                            color: "#666666"
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // Change color on click
                        color = "#81c784"; // Darker green on click
                        colorResetTimer.start(); // Start the timer
                    }
                }

            }


        }


        Button {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            width: parent.width * 0.6
            height: 60 // Adjust this height to add more space before the Button
            //anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                anchors.centerIn: parent
                text: "+ Add Comment"
                font.pointSize: 20
                font.bold: true
                color: "white"
            }
            background: Rectangle {
                    anchors.fill: parent
                    color: '#a3cab3'
                    radius: 20        // Rounds the corners
                    width: parent.width

                }
        }


        // Bottom navigation bar
        Rectangle {
            width: parent.width
            height: 60
            color: "white"
            anchors.bottom: parent.bottom


            Row {
                anchors.centerIn: parent
                spacing: 50

                Button {
                    text: "About Us"

                }
                Button {
                    text: "Log out"
                    onClicked: navigationManager.testCout()
                }
            }
        }
        Popup {
            id: popup
            x: 100
            y: 100
            width: parent.width * 0.9
            height: parent.height * 0.85
            modal: true
            anchors.centerIn: parent
            focus: true

            // Main content area
            Column {
                anchors.centerIn: parent
                spacing: 20
                width: parent.width
                palette.buttonText: 'white'

                // Question Text
                Text {
                    text: "Question 1/4"
                    font.pointSize: 16
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                // Progress bar
                Rectangle {
                    width: parent.width * 0.8
                    height: 10
                    color: "grey"
                    radius: 5
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle {
                        id: progressBar
                        width: parent.width * 0.2
                        height: 10
                        color: "black"
                        radius: 5
                    }
                }

                Text {
                    text: navigationManager.textQuestion
                    font.pointSize: 22
                    font.bold: true
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                // Radio Button Options (Selector Buttons)
                RadioButton {
                    id: option1
                    text: navigationManager.textFirstAnswer
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        opinionTextArea.visible = true
                        console.log("Option 1 selected")
                    }

                }

                RadioButton {
                    id: option2
                    text: navigationManager.textSecondAnswer
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        opinionTextArea.visible = false
                        console.log("Option 2 selected")
                    }
                    style: RadioButtonStyle {
                        indicator: Rectangle {
                            width: 20
                            height: 20
                            radius: 10
                            color: option2.checked ? "#00b300" : "#cccccc"
                            border.color: "black"
                        }
                        checkIndicator: Rectangle {
                            width: 12
                            height: 12
                            radius: 6
                            color: "white"
                            anchors.centerIn: parent
                        }
                    }
                }

                // TextArea for user input (opinion)
                TextArea {
                    id: opinionTextArea
                    visible: false
                    width: parent.width * 0.8
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: parent.height * 0.3
                    placeholderText: "Write your opinion here..."
                    font.pixelSize: 14
                    wrapMode: TextArea.Wrap
                    background: Rectangle {
                        color: "#f0f0f0"
                        radius: 5
                        border.color: "#ccc"
                    }
                }

                // Optional Submit Button for the opinion input
                Button {
                    text: "Submit Opinion"
                    width: parent.width * 0.8
                    height: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        console.log("User's Opinion: " + opinionTextArea.text)
                        navigationManager.changeRectangleWidth(parent.width * 0.5)
                        // Handle opinion submission logic here
                    }
                    background: Rectangle {
                        anchors.fill: parent
                        color: '#a3cab3'
                    }
                }
            }

            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        }
    }
}
