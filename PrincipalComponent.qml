import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick 6.2

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
    // DropShadow {
    //        anchors.fill: rect
    //        cached: true
    //        horizontalOffset: 3
    //        verticalOffset: 3
    //        radius: 8.0
    //        samples: 16
    //        color: "#80000000"
    //        source: rect
    //    }

    Column{
        anchors.fill: parent
    Column {
        objectName: "columnTest"
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
            Rectangle {
                id: root
                color: "#f5f5f5"
                height: 30
                width: parent.width
            }
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
                //color: "white"
                color: !navigationManager.isMorningActive() ? "#858a87" : "white"

                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    enabled: navigationManager.isMorningActive()
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

            }


            Rectangle {
                width: parent.width * 0.8
                height: 80
                radius: 10
                color: !navigationManager.isEveningActive() ? "#858a87" : "white"
                anchors.horizontalCenter: parent.horizontalCenter

                MouseArea {
                    enabled: navigationManager.isEveningActive()
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
            Button {

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

        }
        }





        // Bottom navigation bar
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
                    text: "QUESTION " +navigationManager.questionNumber + "/4"
                    font.pointSize: 16
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                }


                Rectangle {
                    width: parent.width * 0.8
                    height: 10
                    color: "grey" // Math icon color
                    radius: 5
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle {
                        objectName: "progressBar"
                        id: progressBar // ID assigned to the Rectangle
                        width: parent.width * 0.2
                        height: 10
                        color: "black" // Math icon color
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
                    width: parent.width * 0.8
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 50
                    id: radioButton1

                    background: Rectangle {
                            radius: 15
                            anchors.fill: parent
                            color: '#a3cab3'
                        }

                    indicator: Rectangle {
                                    id: radioButton1_indicator
                                   implicitWidth: 25
                                   implicitHeight: 25
                                   radius: 12
                                   border.width: 4
                                   border.color: "white"
                                   x:10
                                   y: ((radioButton1.height - radioButton1_indicator.height)/2)
                                   anchors.margins: 5
                                   anchors.verticalCenter: parent.verticalCenter
                                   color: radioButton1.checked ? "#a3cab3" : "white"

                               }

                    Text {
                        color: "white"
                        text: navigationManager.textFirstAnswer
                        font.bold: true
                        anchors.centerIn: parent
                    }
                    onCheckedChanged: {
                        opinionTextArea.visible = true
                    }
                }


                // Radio Button Options (Selector Buttons)
                RadioButton {
                    width: parent.width * 0.8
                    anchors.horizontalCenter: parent.horizontalCenter

                    height: 50
                    id: radioButton2

                    background: Rectangle {
                            radius: 15
                            anchors.fill: parent
                            color: '#a3cab3'
                        }

                    indicator: Rectangle {
                                    id: radioButton2_indicator
                                   implicitWidth: 25
                                   implicitHeight: 25
                                   radius: 12
                                   border.width: 4
                                   border.color: "white"
                                   x:10
                                   y: ((radioButton2.height - radioButton2_indicator.height)/2)
                                   anchors.margins: 5
                                   anchors.verticalCenter: parent.verticalCenter
                                   color: radioButton2.checked ? "#a3cab3" : "white"

                               }

                    Text {
                        color: "white"
                        text: navigationManager.textSecondAnswer
                        font.bold: true
                        anchors.centerIn: parent
                    }
                    onCheckedChanged: {
                        opinionTextArea.visible = false
                        console.log("Option 1 selected")
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
                   // Optional: Customize appearance
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
                  text: "ENVIAR OPINION"
                  width: parent.width * 0.6
                  anchors.horizontalCenter: parent.horizontalCenter
                  height: 50
                  onClicked: {
                      console.log("User's Opinion: " + opinionTextArea.text)
                      navigationManager.nextQuestion()
                      navigationManager.changeRectangleWidth(parent.width)
                      // Handle opinion submission logic here
                  }
                  background: Rectangle {
                      border.color: "green"
                      anchors.fill: parent
                      color: '#a3cab3'
                      radius: 15

                  }
              }
      }




            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        }
    }
}
