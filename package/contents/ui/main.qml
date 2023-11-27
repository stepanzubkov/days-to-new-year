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
        anchors.fill: parent
        PlasmaComponents.Label {
            id: newYearText

            Layout.alignment: Text.AlignHCenter
            visible: plasmoid.configuration.showNewYearText
            text: Calc.formatTimeToNewYear()
            font.pointSize: plasmoid.configuration.newYearTextSize
            font.family: fontPoppins.name
        }
        PlasmaComponents.Label {
            id: gregorianChristmasText

            Layout.alignment: Text.AlignHCenter
            visible: plasmoid.configuration.showGregorianChristmasText
            text: Calc.formatTimeToGregorianChristmas()
            font.pointSize: plasmoid.configuration.gregorianChristmasTextSize
            font.family: fontPoppins.name
        }

        PlasmaComponents.Label {
            id: julianChristmasText

            Layout.alignment: Text.AlignHCenter
            visible: plasmoid.configuration.showJulianChristmasText
            text: Calc.formatTimeToJulianChristmas()
            font.pointSize: plasmoid.configuration.julianChristmasTextSize
            font.family: fontPoppins.name
        }
        Timer {
            interval: 60000
            running: true
            repeat: true
            onTriggered: {
                newYearText.text = Calc.formatTimeToNewYear();
                gregorianChristmasText.text = Calc.formatTimeToGregorianChristmas();
                julianChristmasText.text = Calc.formatTimeToJulianChristmas();
            }
        }
    }

    preferredRepresentation: Plasmoid.fullRepresentation
}
