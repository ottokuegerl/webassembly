#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "android_photo.h"
#include "filesystemmanager.h"
#include "arubaap172fa.h"
#include "ha2fa.h"
#include "credentialswrapper.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    Q_UNUSED(argc);
    Q_UNUSED(argv);

    // Mount the IDBFS at /working and perform synchronization
    // FILESYSTEMMANAGER::mountAndSyncFS();
    // FILESYSTEMMANAGER *wplMount, *wplSync;
    // wplMount->mountAndSyncFS();
    // wplSync->onSyncfsComplete();

    QQmlApplicationEngine engine;

    // Register the CredentialsWrapper class
     // within QML use CredentialsWrapper
    qmlRegisterType<CredentialsWrapper>("com.wpl.credentials", 1, 0, "CredentialsWrapper");
    qmlRegisterType<ANDROID_PHOTO>("com.company.wpl",1,0,"WPL"); // within QML use WPL
    qmlRegisterType<FILESYSTEMMANAGER>("com.company.FileMgr",1,0,"FileMgr"); // within QML use FileMgr
    qmlRegisterType<ARUBAAP172FA>("com.company.ArubaAP172FA",1,0,"Aruba2FA"); // within QML use Aruba2FA
    qmlRegisterType<HA2FA>("com.company.HomeAssistant2FA",1,0,"HA2FA"); // within QML use HA2FA

    const QUrl url(u"qrc:/android_photos/Main.qml"_qs);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.load(url);

    return app.exec();
}
