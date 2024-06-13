import QtQuick
import QtQuick.Layouts
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid
import org.kde.plasma.components as PlasmaComponents

import "calc.js" as Calc

PlasmoidItem {

    Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground

    FontLoader {
        id: fontPoppins
        source: "../fonts/Poppins.ttf"
    }

    fullRepresentation: ColumnLayout {
        id: mainItem

        readonly property int calendarMode: plasmoid.configuration.calendarMode
        readonly property int textSize: plasmoid.configuration.textSize
        readonly property bool shortened: plasmoid.configuration.shortened || false

        function displayTime () {
            var selectedModeTime
            switch (mainItem.calendarMode) {
                case 0:
                    selectedModeTime = Calc.formatTimeToNewYear(shortened)
                    break;
                case 1:
                    selectedModeTime = Calc.formatTimeFromNewYear(shortened)
                    break;
                case 2:
                    selectedModeTime = Calc.formatTimeToJulianChristmas(shortened)
                    break;
                case 3:
                    selectedModeTime = Calc.formatTimeToGregorianChristmas(shortened)
                    break;
            }
            return selectedModeTime
        }

        anchors.fill: parent

        PlasmaComponents.Label {
            id: mainText

            Layout.alignment: Text.AlignHCenter
            text: displayTime()
            font.pointSize: mainItem.textSize
            font.family: fontPoppins.name
        }

        Timer {
            interval: 60000
            running: true
            repeat: true
            onTriggered: {
                mainText.text = displayTime()
            }
        }
    }

    preferredRepresentation: Plasmoid.fullRepresentation
}
