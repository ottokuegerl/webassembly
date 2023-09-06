#ifndef FILESYSTEMMANAGER_H
#define FILESYSTEMMANAGER_H

#include <QObject>

class FILESYSTEMMANAGER : public QObject
{
    Q_OBJECT
public:
    explicit FILESYSTEMMANAGER(QObject *parent = nullptr);


    // To call a C++ function "myFunction()" from QML,
    // you need to expose the C++ object to the QML context
public:
    Q_INVOKABLE void onSyncfsComplete();
    Q_INVOKABLE void mountAndSyncFS();

};

#endif // FILESYSTEMMANAGER_H
