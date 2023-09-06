#include "credentialswrapper.h"

CredentialsWrapper::CredentialsWrapper(QObject *parent)
    : QObject{parent}
{

}

QString CredentialsWrapper::getWLAN_SSID()
{
    return QString::fromStdString(::getWLAN_SSID());
}

QString CredentialsWrapper::getWLAN_PSW()
{
    return QString::fromStdString(::getWLAN_PSW());
}
