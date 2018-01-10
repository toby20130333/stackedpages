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
    property string name: "PageFour"
    property string title: qsTr("Trade For Ripple")
    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Hello Trader...")
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    bottomPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("This is page 4 of 5\n\nNavigate back to previous page:\n* Button labeled 'POP'\n* Back Button placed top-left in Titlebar\n* on Android: System Back Button at bottom left\n\nNavigate forward to the next page 'PageFive' using the FAB or Button 'PUSH 5'\n\nBelow the buttons a text is displayed:\n* 'Message from Page Three' or\n* 'n/a' if PageThree is not loaded because we 'jumped' from 2 to 5\n\n")
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
                    text: "Goto Message"
                    onClicked: {
                        navPane.pushOnePage(pageFive)
                    }
                }
                Item {
                    // dummi placeholder
                    Layout.preferredWidth : 1
                    Layout.fillWidth: true
                }
            } // button row
            HorizontalDivider {}
            LabelSubheading {
                // to load the page if uninitialized, use:
                // text: navPane.get(2, StackView.ForceLoad).whoAmI()
                // default is StackView.DontLoad, so check for null !
                text: navPane.get(2)? navPane.get(2, StackView.ForceLoad).whoAmI() : "n/a"
            }
        } // col layout
    } // pane root
    ScrollIndicator.vertical: ScrollIndicator { }

    function whoAmI() {
        return qsTr("Message from Page Four")
    }
    // called immediately after push()
    function init() {
        console.log(qsTr("Init done from Four"))
    }
    // called immediately after pop()
    function cleanup() {
        console.log(qsTr("Cleanup done from Four"))
    }
} // flickable
