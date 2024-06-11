import QtQuick
import QtQuick.Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents

import "calc.js" as Calc

ColumnLayout {
        id: mainLogic

        readonly property int calendarMode: plasmoid.configuration.calendarMode
        readonly property int textSize: plasmoid.configuration.textSize
        readonly property bool shortened: plasmoid.configuration.shortened

        function showTime () {
            var selectedCalendarMode
            switch (mainLogic.calendarMode) {
                case 0:
                    selectedCalendarMode = Calc.formatTimeToNewYear(shortened)
                    break;
                case 1:
                    selectedCalendarMode = Calc.formatTimeFromNewYear(shortened)
                    break;
                case 2:
                    selectedCalendarMode = Calc.formatTimeToJulianChristmas(shortened)
                    break;
                case 3:
                    selectedCalendarMode = Calc.formatTimeToGregorianChristmas(shortened)
                    break;
            }
            return selectedCalendarMode
        }

        anchors.fill: parent

        PlasmaComponents.Label {
            id: mainText

            Layout.alignment: Text.AlignHCenter
            text:  showTime()
            font.pointSize: mainLogic.textSize
        }

        Timer {
            interval: 60000
            running: true
            repeat: true
            onTriggered: {
                mainText.text = showTime()
            }
        }
    }