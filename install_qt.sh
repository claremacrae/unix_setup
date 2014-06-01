#!/bin/sh

# NB this needs mesa

QT_MAJOR_VERSION=5.0
QT_FULL_VERSION=${QT_MAJOR_VERSION}.2
INSTALLER_NAME=qt-linux-opensource-${QT_FULL_VERSION}-x86-offline.run
QT_URL="http://download.qt-project.org/official_releases/qt/${QT_MAJOR_VERSION}/${QT_FULL_VERSION}/${INSTALLER_NAME}"

# Download the installer
if [ ! -f ${INSTALLER_NAME} ]; then
    wget $QT_URL
else
    echo Already got ${INSTALLER_NAME}
fi

chmod a+x ${INSTALLER_NAME}
./${INSTALLER_NAME}


