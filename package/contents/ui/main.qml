import QtQuick 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

import "calc.js" as Calc

Item {

    Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground

    Plasmoid.fullRepresentation: ColumnLayout {
        anchors.fill: parent
        PlasmaComponents.Label {
            id: newYearText

            Layout.alignment: Text.AlignHCenter
            visible: plasmoid.configuration.showNewYearText
            text: Calc.formatTimeToNewYear()
            font.pointSize: plasmoid.configuration.newYearTextSize
        }
        PlasmaComponents.Label {
            id: catolicChristmasText

            Layout.alignment: Text.AlignHCenter
            visible: plasmoid.configuration.showCatolicChristmasText
            text: Calc.formatTimeToCatolicChristmas()
            font.pointSize: plasmoid.configuration.catolicChristmasTextSize
        }

        PlasmaComponents.Label {
            id: orthodoxChristmasText

            Layout.alignment: Text.AlignHCenter
            visible: plasmoid.configuration.showOrthodoxChristmasText
            text: Calc.formatTimeToOrthodoxChristmas()
            font.pointSize: plasmoid.configuration.orthodoxChristmasTextSize
        }
        Timer {
            interval: 60000
            running: true
            repeat: true
            onTriggered: {
                newYearText.text = Calc.formatTimeToNewYear();
                catolicChristmasText.text = Calc.formatTimeToCatolicChristmas();
                orthodoxChristmasText.text = Calc.formatTimeToOrthodoxChristmas();
            }
        }
    }

    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation


}
