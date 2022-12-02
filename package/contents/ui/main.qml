import QtQuick 2.1
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

import "calc.js" as Calc

Item {
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
