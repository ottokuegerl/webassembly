#include "ha2fa.h"
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

HA2FA::HA2FA(QObject *parent)
    : QObject{parent}
{
    qDebug() << "---> HA2FA constructor called <---";
    init();
}

HA2FA::~HA2FA()
{
    qDebug() << "H2FA deonstructor called";
}


void HA2FA::init()
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

    // QObject::connect(m_timer2, SIGNAL(timeout()), this, SLOT(current2FATimerTimeout()));
    connect(m_timer, &QTimer::timeout, this, &HA2FA::current2FATimerTimeout);

    // call function to set an initial value for our current2FA
    current2FATimerTimeout();
}


QString HA2FA::getCurrent2FA() const
{
    return m_current2FA;
}

void HA2FA::setCurrent2FA(const QString &newCurrent2FA)
{
    if (m_current2FA == newCurrent2FA)
        return;

    m_current2FA = newCurrent2FA;
    emit current2FAChanged();
}

void HA2FA::current2FATimerTimeout()
{
    qDebug() << "current2FATimerTimeout() called";
    // #######################
    // get Home Assistant SECRET KEY from credentials.h
    // getHA_key()
    // #######################
    Bytes::ByteString qui = Bytes::fromUnpaddedBase32(getHA_key());
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
