QTINCPATH = /usr/include/qt6
QTTOOLS = /usr/lib64/qt6/libexec

CC = g++
MOC = ${QTTOOLS}/moc
UIC = ${QTTOOLS}/uic
INCLUDE = -I ${QTINCPATH} \
          -I ${QTINCPATH}/QtWidgets
QTLIB = -lQt6Widgets \
        -lQt6Core \
        -lQt6Gui
SRC = main.cpp mainwindow.cpp moc_mainwindow.cpp

all: moc ui
	${CC} ${SRC} ${INCLUDE} ${QTLIB} -o run

moc:
	${MOC} mainwindow.h > moc_mainwindow.cpp

ui:
	${UIC} mainwindow.ui > ui_mainwindow.h

clean:
	rm moc_* ui_* run

.PHONY: all moc ui clean
