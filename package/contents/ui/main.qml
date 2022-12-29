import QtQuick 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

import "calc.js" as Calc

Item {

    Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground

    FontLoader {
        id: fontPoppins
        source: "../fonts/Poppins.ttf"
    }

    Plasmoid.fullRepresentation: ColumnLayout {
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

    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation


}
