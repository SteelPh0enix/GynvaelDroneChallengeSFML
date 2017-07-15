TEMPLATE = app
CONFIG(debug, debug|release) {
    win32:CONFIG += console
}
CONFIG(release, debug|release) {
    win32:CONFIG += windows
}
CONFIG += c++14
CONFIG -= app_bundle qt

INCLUDEPATH += C:\SFML-master\include C:\boost_1_64_0
LIBS += -lboost_system

CONFIG(debug, debug|release) {
    win32:LIBS += -LC:\SFML-master\build\debug\lib -lsfml-window-d -lsfml-system-d -lsfml-graphics-d -lsfml-network-d
}
CONFIG(release, debug|release) {
    win32:LIBS += -LC:\SFML-master\build\release\lib -lsfml-window -lsfml-system -lsfml-graphics -lsfml-network -lsfml-main
}

SOURCES += main.cpp \
    datareader.cpp

HEADERS += \
    datastructures.hpp \
    datareader.hpp
