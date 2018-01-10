import QtQuick 2.0
import QtQuick.Controls 2.2

Pane {
    id:flickId
    signal swipeLeft()
    signal swipeRight()
    signal swipeUp()
    signal swipeDown()
//    SwipeArea{
//        id:swipeId
//        anchors.fill: flickId
//        onSwipeDown: {
//            flickId.swipeDown();
//        }
//        onSwipeRight: {
//            console.log("pop next page");
//            navPane.pushNextPage()
//            flickId.swipeRight();
//        }
//        onSwipeUp: {
//            flickId.swipeUp();
//        }
//        onSwipeLeft: {
//            flickId.swipeLeft();
//            console.log("pop pre page");
//            navPane.popOnePage()
//        }
//    }
}
