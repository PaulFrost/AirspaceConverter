#-------------------------------------------------
#
# Project created by QtCreator 2017-01-29T12:24:53
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = AirspaceConverterQt
TEMPLATE = app

CONFIG += c++11

SOURCES += main.cpp\
    mainwindow.cpp \
    aboutdialog.cpp

HEADERS  += mainwindow.h \
    aboutdialog.h

FORMS    += mainwindow.ui \
    aboutdialog.ui

# Include headers of libAirspaceConverter
INCLUDEPATH += $$PWD/../src/
DEPENDPATH += $$PWD/../src/


## Linux libraries

# libAirspaceConverter
unix:!macx: LIBS += -lairspaceconverter

# Boost libraries
unix:!macx: LIBS += -L/usr/lib/x86_64-linux-gnu/ -lboost_filesystem
unix:!macx: LIBS += -L/usr/lib/x86_64-linux-gnu/ -lboost_system


## Windows libraries on 64 bit
win32:contains(QMAKE_HOST.arch, x86_64) {

    # libAirspaceConverter
    win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../VisualStudio/Release/x64/ -lAirspaceConverterLib
    else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../VisualStudio/Debug/x64/ -lAirspaceConverterLib
    win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../VisualStudio/Release/x64/AirspaceConverterLib.lib
    else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../VisualStudio/Debug/x64/AirspaceConverterLib.lib

    # Boost libraries
    win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../../../boost_1_61_0/lib64/ -llibboost_filesystem-vc140-mt-1_61
    else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../../../boost_1_61_0/lib64/ -llibboost_filesystem-vc140-mt-gd-1_61
    INCLUDEPATH += $$PWD/../../../../../../../boost_1_61_0
    DEPENDPATH += $$PWD/../../../../../../../boost_1_61_0

    # libzip
    win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../VisualStudio/packages/libzip.1.1.2.7/build/native/lib/x64/v140/Release/ -lzip
    else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../VisualStudio/packages/libzip.1.1.2.7/build/native/lib/x64/v140/Debug/ -lzip
    INCLUDEPATH += $$PWD/../VisualStudio/packages/libzip.1.1.2.7/build/native/include
    DEPENDPATH += $$PWD/../VisualStudio/packages/libzip.1.1.2.7/build/native/include

## Windows libraries on 32 bit
} else {

    # Windows link to libAirspaceConverter
    win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../VisualStudio/Release/Win32/ -lAirspaceConverterLib
    else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../VisualStudio/Debug/Win32/ -lAirspaceConverterLib
    win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../VisualStudio/Release/Win32/AirspaceConverterLib.lib
    else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../VisualStudio/Debug/Win32/AirspaceConverterLib.lib

    # Windows link to boost libraries
    win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../../../boost_1_61_0/lib32/ -llibboost_filesystem-vc140-mt-1_61
    else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../../../boost_1_61_0/lib32/ -llibboost_filesystem-vc140-mt-gd-1_61
    INCLUDEPATH += $$PWD/../../../../../../../boost_1_61_0
    DEPENDPATH += $$PWD/../../../../../../../boost_1_61_0

    # Windows link to libzip
    win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../VisualStudio/packages/libzip.1.1.2.7/build/native/lib/Win32/v140/Release/ -lzip
    else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../VisualStudio/packages/libzip.1.1.2.7/build/native/lib/Win32/v140/Debug/ -lzip
    INCLUDEPATH += $$PWD/../VisualStudio/packages/libzip.1.1.2.7/build/native/include
    DEPENDPATH += $$PWD/../VisualStudio/packages/libzip.1.1.2.7/build/native/include
}