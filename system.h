#ifndef _SYSTEM_H_
#define _SYSTEM_H_

#include <QObject>
#include <stdio.h>

class System : public QObject
{
    Q_OBJECT
public:
    /* qml run sysytem command function */
    Q_INVOKABLE QString RunCommand(QString c);
    
public:
    /* handle for install button hit */
    Q_INVOKABLE bool fast_install_slot();
};

#endif
