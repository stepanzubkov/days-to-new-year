import QtQuick 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

import "calc.js" as Calc

Item {

    Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground

    Timer {
        interval: 60000
        running: newYearText.visible
        repeat: true
        onTriggered {
            newYearText.text = Calc.formatTimeToNewYear();
        }
    }

    Plasmoid.fullRepresentation: ColumnLayout {
        anchors.fill: parent
        PlasmaComponents.Label {
            id: newYearText

            visible: plasmoid.configuration.showNewYearText
            text: Calc.formatTimeToNewYear()
            font.pointSize: plasmoid.configuration.newYearTextSize
        }
    }

    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
}
