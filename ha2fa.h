#ifndef HA2FA_H
#define HA2FA_H

#include <QObject>
#include <QTimer>

class HA2FA : public QObject
{
    Q_OBJECT

    // define property: current2FA to use it within QML
    Q_PROPERTY(QString current2FA READ getCurrent2FA WRITE setCurrent2FA NOTIFY current2FAChanged)


public:
    explicit HA2FA(QObject *parent = nullptr);
    ~HA2FA();

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

#endif // HA2FA_H
