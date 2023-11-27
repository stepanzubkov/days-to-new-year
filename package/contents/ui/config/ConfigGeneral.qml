import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

Item {
    id: root

    property alias cfg_showNewYearText: showNewYearText.checked
    property alias cfg_newYearTextSize: newYearTextSize.value
    property alias cfg_showGregorianChristmasText: showGregorianChristmasText.checked
    property alias cfg_gregorianChristmasTextSize: gregorianChristmasTextSize.value
    property alias cfg_showJulianChristmasText: showJulianChristmasText.checked
    property alias cfg_julianChristmasTextSize: julianChristmasTextSize.value


    Kirigami.FormLayout { 

        CheckBox {
            id: showNewYearText

            Kirigami.FormData.label: i18n("New Year:")
            checked: true
        }
        SpinBox {
            id: newYearTextSize

            Kirigami.FormData.label: i18n("Font size:")
            enabled: showNewYearText.checked
            value: 16
            from: 10
            to: 72
            stepSize: 1
            textFromValue: function(value) {
                return value + i18nc("Font size (points)", " pt");
            }

        }
        CheckBox {
            id: showGregorianChristmasText

            Kirigami.FormData.label: i18n("Gregorian Christmas:")
            checked: false
        }
        SpinBox {
            id: gregorianChristmasTextSize

            Kirigami.FormData.label: i18n("Font size:")
            enabled: showGregorianChristmasText.checked
            value: 16
            from: 10
            to: 72
            stepSize: 1
            textFromValue: function(value) {
                return value + i18nc("Font size (points)", " pt");
            }
        }
        CheckBox {
            id: showJulianChristmasText

            Kirigami.FormData.label: i18n("Julian Christmas:")
            checked: false
        }
        SpinBox {
            id: julianChristmasTextSize

            Kirigami.FormData.label: i18n("Font size:")
            enabled: showJulianChristmasText.checked
            value: 16
            from: 10
            to: 72
            stepSize: 1
            textFromValue: function(value) {
                return value + i18nc("Font size (points)", " pt");
            }
        }

    }
}
