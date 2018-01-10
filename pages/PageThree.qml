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
    property string name: "PageThree"
    property string title: qsTr("Send Ripple To Some Ripple Wallet Address")

    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Hello Senders")
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    bottomPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("This is page 3 of 5\nHere we're using another kind of Material Buttons: Flat Buttons\n\nNavigate back to previous page:\n* Button labeled 'POP'\n* Back Button placed top-left in Titlebar\n* on Android: System Back Button at bottom left\n\nNavigate forward to the next page 'PageFour' using the FAB or Button 'PUSH 4'\n\n")
                }
            }
            HorizontalDivider {}
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
                    text: "Goto Trader"
                    onClicked: {
                        navPane.pushOnePage(pageFour)
                    }
                }
                Item {
                    // dummi placeholder for up to 2 more buttons
                    Layout.preferredWidth : 1
                    Layout.fillWidth: true
                }
            } // button row
        } // col layout
    } // pane root
    ScrollIndicator.vertical: ScrollIndicator { }

    function whoAmI() {
        return qsTr("Message from Page Three")
    }
    // called immediately after push()
    function init() {
        console.log(qsTr("Init done from Three"))
    }
    // called immediately after pop()
    function cleanup() {
        console.log(qsTr("Cleanup done from Three"))
    }
} // flickable

