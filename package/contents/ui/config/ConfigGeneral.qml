import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.core 2.0 as PlasmaCore
Item {
    id: root

    property alias cfg_showNewYearText: showNewYearText.checked
    property alias cfg_newYearTextSize: newYearTextSize.value

    ColumnLayout {
        RowLayout {
            PlasmaComponents.Label {
                text: "Show text about New Year"
            }

            PlasmaComponents.CheckBox {
                id: showNewYearText

                checked: true
            }

        }
        RowLayout {
            PlasmaComponents.Label {
                text: "New Year font size"
            }

            SpinBox {
                id: newYearTextSize

                enabled: showNewYearText.checked
                value: 16
                minimumValue: 10
                maximumValue: 72
                stepSize: 1
                suffix: " pt"
            }
        }
    }
}

