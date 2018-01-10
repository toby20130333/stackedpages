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
    property string name: "PageTwo"
    property string title: qsTr("Recieve Ripple From Wallet Address")
    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Hello Recieve...")
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    bottomPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("This is page 2 of 5\n\nNavigate back to previous page:\n* Button labeled 'POP'\n* Back Button placed top-left in Titlebar\n* on Android: System Back Button at bottom left\n\nNavigate forward to the next page 'PageThree' using the FAB or Button 'PUSH 3'\n\nButton labeled GOTO 5 jumps up to the top most page: PageFive. In this case PageThree and PageFour are NOT loaded - only Components are placed as placeholders in stack\n")
                }
            }
            HorizontalDivider {}
            RowLayout {
                // implicite fillWidth = true
                spacing: 10
                ButtonRaised {
                    text: "Go Back"
                    buttonColor: accentColor
                    onClicked: {
                        navPane.popOnePage()
                    }
                }
                ButtonRaised {
                    text: "Goto Sender"
                    onClicked: {
                        navPane.pushOnePage(pageThree)
                    }
                }
                ButtonRaised {
                    text: "GoTo Message"
                    onClicked: {
                        navPane.goToPage(5)
                    }
                }
            } // button row
        } // col layout
    } // pane root
    ScrollIndicator.vertical: ScrollIndicator { }

    function whoAmI() {
        return qsTr("Message from Page Two")
    }
    // called immediately after push()
    function init() {
        console.log(qsTr("Init done from Two"))
    }
    // called immediately after pop()
    function cleanup() {
        console.log(qsTr("Cleanup done from Two"))
    }
} // flickable
