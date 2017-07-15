TEMPLATE = app
CONFIG += c++14 console
CONFIG -= app_bundle qt

INCLUDEPATH += C:\SFML-master\include

CONFIG(debug, debug|release) {
    LIBS += -lsfml-window-d -lsfml-system-d -lsfml-graphics-d -lsfml-network-d
}
CONFIG(release, debug|release) {
    LIBS += -lsfml-window -lsfml-system -lsfml-graphics -lsfml-network
}

SOURCES += main.cpp \
    datareader.cpp

HEADERS += \
    datastructures.hpp \
    datareader.hpp
