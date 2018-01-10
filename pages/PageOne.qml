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
    property string name: "PageOne"
    property string title: qsTr("Ripple Client Wallet")
    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("About Ripple....")
            }
            HorizontalDivider {}
            RowLayout {
                LabelSubheading {
                    topPadding: 6
                    bottomPadding: 6
                    leftPadding: 10
                    rightPadding: 10
                    wrapMode: Text.WordWrap
                    text: qsTr("Ripple is a network of computers which use the Ripple consensus algorithm to atomically settle and record transactions on a secure distributed database, the Ripple Consensus Ledger (RCL). Because of its distributed nature, the RCL offers transaction immutability without a central operator. The RCL contains a built-in currency exchange and its path-finding algorithm finds competitive exchange rates across order books and currency pairs\n")
                }
            }
            HorizontalDivider {}
            RowLayout {
                // implicite fillWidth = true
                spacing: 10
                Item {
                    // dummi placeholder
                    Layout.preferredWidth : 1
                    Layout.fillWidth: true
                }
                ButtonFlat {
                    text: qsTr("Go Trade")
                    onClicked: {
                        navPane.pushOnePage(pageFour)
                    }
                }
                Item {
                    // dummi placeholder
                    Layout.preferredWidth : 1
                    Layout.fillWidth: true
                }
            } // button row
        } // col layou

    } // root
    ScrollIndicator.vertical: ScrollIndicator { }

    function whoAmI() {
        return qsTr("Message from Page One")
    }
    // called immediately after push()
    function init() {
        console.log(qsTr("Init done from One"))
    }
    // called immediately after pop()
    function cleanup() {
        console.log(qsTr("Cleanup done from One"))
    }
} // flickable
