#include <QtWidgets/QApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QQmlContext>
#include <unistd.h>
#include <libgen.h>
#include <sys/types.h>
#include "system.h"

int main(int argc, char *argv[])
{
    pid_t pid = getpid();
    char buf[BUFSIZ] = {0};
    if(readlink((QString("/proc/") + QString::number(pid, 10) + "/exe").toLocal8Bit(), buf, BUFSIZ) < 0)    return -1;
    char *binary_path = dirname(buf);

    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("System", new System);
    engine.addImportPath(QString(binary_path) + "/Imports/");
    engine.load(QUrl("qrc:/qml-src/Installor.qml"));

    return app.exec();
}
