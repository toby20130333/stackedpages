// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "../common"

Flickable {
    id: flickable
    contentHeight: root.implicitHeight
    // StackView manages this, so please no anchors here
    // anchors.fill: parent
    property string name: "PageFive"
    property string title: qsTr("Ripple Client Message Center")
    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Hello My Message...")
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    bottomPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("This is page 5 of 5 - the top most page\n\nNavigate back to previous page:\n* Button labeled 'POP'\n* Back Button placed top-left in Titlebar\n* on Android: System Back Button at bottom left\n\nNavigate back to the root using the FAB\n\nJump back to 'PageThree' using Button 'BACK TO 3'\n'PageFour' will automatically pop()\n\nButton 'FIND 3' tries to find 'PageThree' by property 'name'.\nFind will only work if page is instantiated. More details in blog entry.\n")
                }
            }
            HorizontalDivider{}
            RowLayout {
                // implicite fillWidth = true
                spacing: 10
                ButtonFlat {
                    text: "Go Back"
                    textColor: accentColor
                    onClicked: {
                        navPane.popOnePage()
                    }
                }
                ButtonFlat {
                    text: "Goto Send"
                    onClicked: {
                        var stackIndex = navPane.findPage("PageThree")
                        if(stackIndex >= 0) {
                            navPane.goToPage(stackIndex + 1)
                        } else {
                            statusLabel.text = qsTr("PageThree not found in StackView")
                        }
                    }
                }
                ButtonFlat {
                    text: "Back To 3"
                    onClicked: {
                        navPane.goToPage(3)
                    }
                }
            } // button row
            HorizontalDivider {}
            LabelSubheading {
                id: statusLabel
                visible: text.length
                text: ""
                color: "red"
            }
        } // col layout
    } // pane root
    ScrollIndicator.vertical: ScrollIndicator { }

    function whoAmI() {
        return qsTr("Message from Page Five")
    }
    // called immediately after push()
    function init() {
        console.log(qsTr("Init done from Five"))
    }
    // called immediately after pop()
    function cleanup() {
        console.log(qsTr("Cleanup done from Five"))
    }
} // flickable
