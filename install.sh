#!/bin/bash
# SPDX-License-Identifier: CC0

function get_widget_dir() {
    if [[ $WIDGET_DIR == "" ]]; then
        echo "plasmoid"
        return
    fi
    echo $WIDGET_DIR
}

WIDGET_ID="com.github.stepan-zubkov.days-to-new-year"
WIDGET_DIR="package"

function install_widget() {
    cp -r $WIDGET_DIR ~/.local/share/plasma/plasmoids/$WIDGET_ID
}

function uninstall_widget() {
    rm -r ~/.local/share/plasma/plasmoids/$WIDGET_ID
}

if [[ $WIDGET_ID == "" ]]; then
    echo "Error! Install script improperly configured. WIDGET_ID does not set."
    exit
fi
if [[ $WIDGET_DIR == "" ]]; then
    echo "Error! Install script improperly configured. WIDGET_DIR does not set."
    exit
fi

if [[ $1 == "" || $1 == "install" ]]; then
    install_widget
fi

if [[ $1 == "uninstall" ]]; then
    uninstall_widget
fi
