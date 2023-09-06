#ifndef ARUBAAP172FA_H
#define ARUBAAP172FA_H

#include <QObject>
#include <QTimer>

class ARUBAAP172FA : public QObject
{
    Q_OBJECT

    // define property: current2FA to use it within QML
    // getter getCurrent2FA()
    // setter setCurrent2FA()
    Q_PROPERTY(QString current2FA READ getCurrent2FA WRITE setCurrent2FA NOTIFY current2FAChanged)

public:
    explicit ARUBAAP172FA(QObject *parent = nullptr);
    ~ARUBAAP172FA();

    QString getCurrent2FA() const;
    void setCurrent2FA(const QString &newCurrent2FA);

signals:
    void current2FAChanged();

private slots:
    void current2FATimerTimeout();

private:
    void init();
    QString m_current2FA;
    QTimer *m_timer;
};

#endif // ARUBAAP172FA_H
