import QtQuick
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid


PlasmoidItem {

    Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground

    fullRepresentation: Body { }

    preferredRepresentation: Plasmoid.fullRepresentation
}
