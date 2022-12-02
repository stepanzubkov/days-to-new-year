#!/bin/bash
# plasmapkg2 -r "Days to new year"
# разблокируйте следующую строку, если плазмоид не удаляется нормально
rm -rf ~/.local/share/plasma/plasmoids/com.github.stepan-zubkov.days-to-new-year
plasmapkg2 -t plasmoid -i ./package
kbuildsycoca5 --noincremental
# plasmawindowed simpleMonitor
plasmoidviewer -a ./package
