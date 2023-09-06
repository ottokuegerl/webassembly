#ifndef CREDENTIALSWRAPPER_H
#define CREDENTIALSWRAPPER_H

#include <QObject>
#include <QString>
#include "credentials.h"

class CredentialsWrapper : public QObject
{
    Q_OBJECT

public:
    explicit CredentialsWrapper(QObject *parent = nullptr);

    // To call a C++ function "myFunction()" from QML,
    // you need to expose the C++ object to the QML context

    Q_INVOKABLE QString getWLAN_SSID();
    Q_INVOKABLE QString getWLAN_PSW();

};

#endif // CREDENTIALSWRAPPER_H
