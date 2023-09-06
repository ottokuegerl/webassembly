#include "arubaap172fa.h"
#include "credentials.h"

#include "cpptotp/src/libcppotp/bytes.h"
#include "cpptotp/src/libcppotp/otp.h"

#include <iostream>
#include <cctype>
#include <cstdio>
#include <unistd.h>
#include <termios.h>

#include <QDebug>

using namespace CppTotp;

ARUBAAP172FA::ARUBAAP172FA(QObject *parent)
    : QObject{parent}
{
    qDebug() << "---> ARUBAAP172FA constructor called <---";
    init();
}

ARUBAAP172FA::~ARUBAAP172FA()
{
    qDebug() << "ARUBAAP172FA destructor called";
}

void ARUBAAP172FA::init()
{
    qDebug() << "init() called";

    // #########################################
    // # initialization
    // #########################################
    // #########################################
    // call function current2FATimerTimeout() every 1 second
    // on behalf signal and slots
    // #########################################

    m_current2FA = "000000";

    m_timer = new QTimer(this);
    m_timer->setInterval(1000); // set interval to 1 second

    // setSingleShot(true) the m_timer will only run once and it
    // would not run continuously meaning when it times out its just going to stop
    // and it would not restart
    // we control that ourself on behalf the "current2FATimerTimeout" slot within
    // our connection
    m_timer->setSingleShot(true);

    // QObject::connect(m_timer, SIGNAL(timeout()), this, SLOT(current2FATimerTimeout()));
    connect(m_timer, &QTimer::timeout, this, &ARUBAAP172FA::current2FATimerTimeout);

    // call function to set an initial value for our current2FA
    current2FATimerTimeout();

}

QString ARUBAAP172FA::getCurrent2FA() const
{
    return m_current2FA;
}

void ARUBAAP172FA::setCurrent2FA(const QString &newCurrent2FA)
{
    if (m_current2FA == newCurrent2FA)
        return;

    m_current2FA = newCurrent2FA;
    emit current2FAChanged();
}

void ARUBAAP172FA::current2FATimerTimeout()
{
    qDebug() << "current2FATimerTimeout() called";
    qDebug() << "Aruba secret kex is: " + getAP17_key();

    // #######################
    // Aruba AP17 SECRET KEY
    // get Aruba secret key from credentials.h
    // getAP17_key()
    // #######################
    Bytes::ByteString qui = Bytes::fromUnpaddedBase32(getAP17_key());
    uint32_t p = totp(qui, time(NULL), 0, 30, 6);

    // cast uint32_t to QString
    QString qstrp = QString::number(p);

    // if size() from qstrp == 5 add 0 in front of qstrp to display always 6 digits
    if(qstrp.size() == 5)
    {
        qstrp = "0" + qstrp;
    }

    if(qstrp.size() == 4)
    {
        qstrp = "00" + qstrp;
    }

    if(qstrp.size() == 3)
    {
        qstrp = "000" + qstrp;
    }

    if(qstrp.size() == 2)
    {
        qstrp = "0000" + qstrp;
    }

    if(qstrp.size() == 1)
    {
        qstrp = "00000" + qstrp;
    }

    setCurrent2FA(qstrp);

    m_timer->start();

}
