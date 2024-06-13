import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1
import org.kde.kirigami 2.5 as Kirigami

import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    property alias cfg_shortened: shortenedCheckBox.checked
    property alias cfg_textSize: textSize.value
    property alias cfg_calendarMode: calendarModeComboBox.currentIndex

    Kirigami.FormLayout {
        ButtonGroup { 
            id: calendarModeGroup
        }

        ComboBox {
            id: calendarModeComboBox
            Kirigami.FormData.label: i18n("Mode:")
            model: [
                i18n("Time To New Year"),
                i18n("Time From New Year"),
                i18n("Time To Gregorian Christmas"),
                i18n("Time To Julian Christmas"),
            ]
            onActivated: cfg_calendarMode = currentIndex
        }

        SpinBox {
            id: textSize
            Kirigami.FormData.label: i18n("Font size:")
            value: 16
            from: 10
            to: 72
            stepSize: 1
            textFromValue: function(value) {
                return value + i18nc("Font size (points)", " pt");
            }
        }

        CheckBox {
            id: shortenedCheckBox
            Kirigami.FormData.label: i18n("Shortened:")
            checked: true
        }
    }
}
