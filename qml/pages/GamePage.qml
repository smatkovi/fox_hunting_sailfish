import QtQuick 2.0
import Sailfish.Silica 1.0
import TablesCompUser 1.0

Page {
    id: page
    anchors.fill: parent
    allowedOrientations: Orientation.Portrait
    property int spacingGrid: 1
    property int baseWidthHeight: page.width / 15
    property int baseFieldSize: 9

    Column {
        id: column
        anchors {
            top: page.top
            topMargin: 20
            right: page.right
            left: page.left
            bottom: page.bottom
        }
        spacing: Theme.paddingMedium

        Label {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Game with computer")
            color: Theme.highlightColor
            font.pixelSize: Theme.fontSizeLarge
        }

        TablesCompUser {
            id: dataModel
            onWinUser: pageStack.replace(Qt.resolvedUrl("WinGamePage.qml"))
            onWinComp: pageStack.replace(Qt.resolvedUrl("LoseGamePage.qml"))
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Computer")
            color: "white"
        }

        Grid {
            id: fieldTop
            spacing: spacingGrid
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 2

            Rectangle {
                  id: item
                  width: baseWidthHeight
                  height: baseWidthHeight
                  color: "darkblue";
            }

            FieldTableLitters {

            }

            FieldTableDigits{

            }

            Rectangle {
                  width: baseWidthHeight * baseFieldSize
                  height: baseWidthHeight * baseFieldSize
                  color: "transparent";

                  Grid {
                      id: fieldTopFox
                      spacing: spacingGrid
                      anchors.fill: parent
                      columns: baseFieldSize
                      rows: baseFieldSize

                      Repeater {
                          model: dataModel.dataComp
                          delegate: Rectangle {
                                      width: baseWidthHeight
                                      height: baseWidthHeight
                                      color: "transparent";

                                      Rectangle {
                                          anchors.fill: parent
                                          color: model.color
                                      }

                                      Text {
                                          anchors.centerIn: parent
                                          text: model.text
                                      }
                                  }
                      }
                  }
             }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("You")
            color: "white"
        }

        Grid {
            id: fieldBottom
            spacing: spacingGrid
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 2

            Rectangle {
                  width: baseWidthHeight
                  height: baseWidthHeight
                  color: "darkRed";
            }

            FieldTableLitters {

            }

            FieldTableDigits{

            }

            Rectangle {
                  width: baseWidthHeight * baseFieldSize
                  height: baseWidthHeight * baseFieldSize
                  color: "transparent";

                  Grid {
                      id: fieldBottomFox
                      spacing: spacingGrid
                      anchors.fill: parent
                      columns: baseFieldSize
                      rows: baseFieldSize

                      Repeater {
                          model: dataModel.dataUser
                          delegate: Rectangle {
                                      width: baseWidthHeight
                                      height: baseWidthHeight
                                      color: "transparent";

                                      Rectangle {
                                          anchors.fill: parent
                                          color: model.color
                                      }

                                      Text {
                                          anchors.centerIn: parent
                                          text: model.text
                                      }

                                      MouseArea {
                                          anchors.fill: parent
                                          onClicked: {
                                              dataModel.shotCellUser(model.index);
                                          }
                                      }
                                  }
                      }
                  }
             }
        }
    }
}

