import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kirigami 2.9 as Kirigami

Item {
    id: root

    property alias cfg_showNewYearText: showNewYearText.checked
    property alias cfg_newYearTextSize: newYearTextSize.value
    property alias cfg_showGregorianChristmasText: showGregorianChristmasText.checked
    property alias cfg_gregorianChristmasTextSize: gregorianChristmasTextSize.value
    property alias cfg_showJulianChristmasText: showJulianChristmasText.checked
    property alias cfg_julianChristmasTextSize: julianChristmasTextSize.value

    
    Kirigami.FormLayout { 
        
        PlasmaComponents.CheckBox {
            id: showNewYearText

            Kirigami.FormData.label: i18n("New Year:")
            checked: true
        }
        SpinBox {
            id: newYearTextSize
            
            Kirigami.FormData.label: i18n("Font size:")
            enabled: showNewYearText.checked
            value: 16
            minimumValue: 10
            maximumValue: 72
            stepSize: 1
            suffix: i18nc("Font size (points)", " pt")

        }
        PlasmaComponents.CheckBox {
            id: showGregorianChristmasText

            Kirigami.FormData.label: i18n("Gregorian Christmas:")
            checked: false
        }
        SpinBox {
            id: gregorianChristmasTextSize
            
            Kirigami.FormData.label: i18n("Font size:")
            enabled: showGregorianChristmasText.checked
            value: 16
            minimumValue: 10
            maximumValue: 72
            stepSize: 1
            suffix: i18nc("Font size (points)", " pt")
        }
        PlasmaComponents.CheckBox {
            id: showJulianChristmasText

            Kirigami.FormData.label: i18n("Julian Christmas:")
            checked: false
        }
        SpinBox {
            id: julianChristmasTextSize
            
            Kirigami.FormData.label: i18n("Font size:")
            enabled: showJulianChristmasText.checked
            value: 16
            minimumValue: 10
            maximumValue: 72
            stepSize: 1
            suffix: i18nc("Font size (points)", " pt")
        }

    }
}
