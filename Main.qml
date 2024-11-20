// main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick 6.2
import Qt5Compat.GraphicalEffects

Window {
    width: 400
    height: 600
    visible: true
    title: "UntitledProject1"
     id: componentPrincipal2

    ComponentPrincipalPage {
        id: componentPrincipal
        Component.onCompleted: console.log("ComponentPrincipalPage is loaded with ID:", componentPrincipal)

    }
}
