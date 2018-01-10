// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "common"
import "pages"

// This app demonstrates HowTo use Qt 5.8 and Qt Quick Controls 2.1, High DPI and more
// This app is NOT a production ready app
// This app's goal is only to help you to understand some concepts
// see blog http://j.mp/qt-x to learn about Qt 5.8 for Material - styled Android or iOS Apps
// learn about this stacked_pages_x app from this article: http://j.mp/qt-stacked-pages-x
// ekke (Ekkehard gentz) @ekkescorner

ApplicationWindow {
    id: appWindow
    // visibile must set to true - default is false
    visible: true
    width: 400
    height: 600
    // primary and accent properties:
    property variant primaryPalette: myApp.defaultPrimaryPalette()
    property color primaryLightColor: primaryPalette[0]
    property color primaryColor: primaryPalette[1]
    property color primaryDarkColor: primaryPalette[2]
    property color textOnPrimaryLight: primaryPalette[3]
    property color textOnPrimary: primaryPalette[4]
    property color textOnPrimaryDark: primaryPalette[5]
    property string iconOnPrimaryLightFolder: primaryPalette[6]
    property string iconOnPrimaryFolder: primaryPalette[7]
    property string iconOnPrimaryDarkFolder: primaryPalette[8]
    property variant accentPalette: myApp.defaultAccentPalette()
    property color accentColor: accentPalette[0]
    property color textOnAccent: accentPalette[1]
    property string iconOnAccentFolder: accentPalette[2]
    Material.primary: primaryColor
    Material.accent: accentColor
    // theme Dark vs Light properties:
    property variant themePalette: myApp.defaultThemePalette()
    property color dividerColor: themePalette[0]
    property color cardAndDialogBackground: themePalette[1]
    property real primaryTextOpacity: themePalette[2]
    property real secondaryTextOpacity: themePalette[3]
    property real dividerOpacity: themePalette[4]
    property real iconActiveOpacity: themePalette[5]
    property real iconInactiveOpacity: themePalette[6]
    property string iconFolder: themePalette[7]
    property int isDarkTheme: themePalette[8]
    property color flatButtonTextColor: themePalette[9]
    // Material.dropShadowColor  OK for Light, but too dark for dark theme
    property color dropShadow: isDarkTheme? "#E4E4E4" : Material.dropShadowColor
    onIsDarkThemeChanged: {
        if(isDarkTheme == 1) {
            Material.theme = Material.Dark
        } else {
            Material.theme = Material.Light
        }
    }
    // font sizes - defaults from Google Material Design Guide
    property int fontSizeDisplay4: 112
    property int fontSizeDisplay3: 56
    property int fontSizeDisplay2: 45
    property int fontSizeDisplay1: 34
    property int fontSizeHeadline: 24
    property int fontSizeTitle: 20
    property int fontSizeSubheading: 16
    property int fontSizeBodyAndButton: 14 // is Default
    property int fontSizeCaption: 12
    // fonts are grouped into primary and secondary with different Opacity
    // to make it easier to get the right property,
    // here's the opacity per size:
    property real opacityDisplay4: secondaryTextOpacity
    property real opacityDisplay3: secondaryTextOpacity
    property real opacityDisplay2: secondaryTextOpacity
    property real opacityDisplay1: secondaryTextOpacity
    property real opacityHeadline: primaryTextOpacity
    property real opacityTitle: primaryTextOpacity
    property real opacitySubheading: primaryTextOpacity
    // body can be both: primary or secondary text
    property real opacityBodyAndButton: primaryTextOpacity
    property real opacityBodySecondary: secondaryTextOpacity
    property real opacityCaption: secondaryTextOpacity
    //

    SwipeArea{
        id:swipeId
        anchors.fill: parent
        onSwipe: {
            console.log("pop pre page");
            //通过手势pop出来
            if(direction=="left") navPane.popOnePage()
        }
    }

    header: StackTextTitle {
        id: titleBar
        text: navPane.currentItem? navPane.currentItem.title : qsTr("A simple Stacked - Pages APP")
    }

    // primaryDarkColor is used because FAB can overlap Raised Buttons colored in primaryColor
    FloatingActionButton {
        property string imageName: navPane.depth < 5? "/directions.png" : "/home.png"
        z: 1
        anchors.margins: 16
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        imageSource: "qrc:/images/"+iconOnPrimaryDarkFolder+imageName
        backgroundColor: primaryDarkColor
        onClicked: {
            if(navPane.depth < 5) {
                navPane.pushNextPage()
            } else {
                navPane.goToPage(1)
            }
        }
    } // FAB

    StackView {
        id: navPane
        focus: true
        anchors.fill: parent
        anchors.bottomMargin: 40
        initialItem: pageOne
        // support of BACK key
        Keys.onBackPressed: {
            event.accepted = navPane.depth > 1
            popOnePage()
            if(navPane.depth == 1) {
                // perhaps ask user if app should really quit
                var page = navPane.get(0)
                page.cleanup()
            }
        }
        // some keyboard shortcuts if:
        // * running on BlackBerry PRIV (Slider with hardware keyboard)
        // * or attached Bluetooth Keyboard
        // Jump to Page 1 (w), 2 (e), 3 (r), 4 (s), 5(d)
        // Goto next page: 'n'
        // Goto previous page: 'p'
        Shortcut {
            sequence: "w"
            onActivated: navPane.goToPage(1)
        }
        Shortcut {
            sequence: "Alt+w"
            onActivated: navPane.goToPage(1)
        }
        Shortcut {
            sequence: "e"
            onActivated: navPane.goToPage(2)
        }
        Shortcut {
            sequence: "Alt+e"
            onActivated: navPane.goToPage(2)
        }
        Shortcut {
            sequence: "r"
            onActivated: navPane.goToPage(3)
        }
        Shortcut {
            sequence: "Alt+r"
            onActivated: navPane.goToPage(3)
        }
        Shortcut {
            sequence: "s"
            onActivated: navPane.goToPage(4)
        }
        Shortcut {
            sequence: "Alt+s"
            onActivated: navPane.goToPage(4)
        }
        Shortcut {
            sequence: "d"
            onActivated: navPane.goToPage(5)
        }
        Shortcut {
            sequence: "Alt+d"
            onActivated: navPane.goToPage(5)
        }
        // n == NEXT
        Shortcut {
            sequence: "n"
            onActivated: navPane.pushNextPage()
        }
        // p == PREVIOUS
        Shortcut {
            sequence: "p"
            onActivated: navPane.popOnePage()
        }
        Shortcut {
            sequence: " "
            onActivated: navPane.pushNextPage()
        }
        Shortcut {
            sequence: "Shift+ "
            onActivated: navPane.popOnePage()
        }

        // go one level back in stack
        function popOnePage() {
            if(navPane.depth == 1) {
                return
            }
            // check if target page already is on the stack
            var targetIsUninitialized = false
            if(!navPane.get(navPane.depth-2)) {
                targetIsUninitialized = true
            }
            var page = pop()
            if(targetIsUninitialized) {
                navPane.currentItem.init()
            }
            // do cleanup from previous page
            page.cleanup()
        } // popOnePage

        function pushOnePage(pageComponent) {
            var page = push(pageComponent)
            page.init()
        }

        function pushNextPage() {
            switch(navPane.depth) {
            case 1:
                pushOnePage(pageTwo)
                break;
            case 2:
                pushOnePage(pageThree)
                break;
            case 3:
                pushOnePage(pageFour)
                break;
            case 4:
                pushOnePage(pageFive)
                break;
            default:
                // nothing - 5 is max
            }
        } // pushNextPage

        function findPage(pageName) {
            var targetPage = find(function(item) {
                return item.name == pageName;
            })
            if(targetPage) {
                return targetPage.StackView.index
            } else {
                console.log("Page not found in StackView: "+pageName)
                return -1
            }
        }

        function goUpTo(pageNumber) {
            var count = pageNumber-navPane.depth
            var pages = new Array (count)
            for(var i = 0; i < count; i++) {
                var thePageNumber = navPane.depth+i+1
                switch(thePageNumber) {
                case 1:
                    pages[i] = pageOne
                    break;
                case 2:
                    pages[i] = pageTwo
                    break;
                case 3:
                    pages[i] = pageThree
                    break;
                case 4:
                    pages[i] = pageFour
                    break;
                case 5:
                    pages[i] = pageFive
                    break;
                default:
                    // nothing
                    return
                }
            }
            var page = push(pages)
            page.init()
        } // goUpTo

        function goDownTo(pageNumber) {
            // check if cleanup must be done for popped pages
            var count = navPane.depth-pageNumber
            for(var i = 0; i < count; i++) {
                if(navPane.get(navPane.depth-i-1)) {
                    navPane.get(navPane.depth-i-1).cleanup()
                }
            }
            // pop all pages until targetPage will be on top
            // check if target page already is on the stack
            var targetIsUninitialized = false
            if(!navPane.get(pageNumber-1)) {
                targetIsUninitialized = true
            }
            // don't forget to set StackView.ForceLoad
            // otherwise if get() is null and get(null) means jump to root
            pop(navPane.get(pageNumber-1, StackView.ForceLoad))
            if(targetIsUninitialized) {
                navPane.get(pageNumber-1).init()
            }
        } // goDownTo

        function goToPage(pageNumber) {
            if(pageNumber == navPane.depth) {
                // it's the current page
                return
            }
            if(pageNumber > navPane.depth) {
                goUpTo(pageNumber)
                return
            }
            goDownTo(pageNumber)
        } // goToPage
    } // navPane

    Component {
        id: pageOne
        PageOne {
            id: page
            // we only need this for initialItem
            // items on stack will init() after push()
            Component.onCompleted: {
                page.init()
            }
        }
    } // pageOne

    Component {
        id: pageTwo
        PageTwo {
        }
    } // pageTwo

    Component {
        id: pageThree
        PageThree {
        }
    }

    Component {
        id: pageFour
        PageFour {
        }
    }

    Component {
        id: pageFive
        PageFive {
        }
    }

    function switchPrimaryPalette(paletteIndex) {
        primaryPalette = myApp.primaryPalette(paletteIndex)
    }
    function switchAccentPalette(paletteIndex) {
        accentPalette = myApp.accentPalette(paletteIndex)
    }

    // we can loose the focus if Menu or Popup is opened
    function resetFocus() {
        navPane.focus = true
    }

    //
    PopupPalette {
        id: popup
        onAboutToHide: {
            resetFocus()
        }
    }
    footer: Rectangle{
        id:footerId
        width: parent.width
        height: 40
        color:dropShadow
        RowLayout{
            anchors.fill: parent
            spacing: 0
            ButtonRaised {
                text: qsTr("Home")
                onClicked: {
                    navPane.pushOnePage(pageOne)
                }
            }
            ButtonRaised {
                text: qsTr("Recieve")
                onClicked: {
                    navPane.pushOnePage(pageTwo)
                }
            }
            ButtonRaised {
                text: qsTr("Send")
                onClicked: {
                    navPane.pushOnePage(pageThree)
                }
            }
            ButtonRaised {
                text: qsTr("Trade")
                onClicked: {
                    navPane.pushOnePage(pageFour)
                }
            }
            ButtonRaised {
                text: qsTr("Message")
                onClicked: {
                    navPane.pushOnePage(pageFive)
                }
            }
        }
    }

} // app window
