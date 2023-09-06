#include "filesystemmanager.h"
#include <emscripten.h>
#include <QFile>
#include <QDebug>


FILESYSTEMMANAGER::FILESYSTEMMANAGER(QObject *parent)
    : QObject{parent}
{
    qDebug() << "FILESYSTEMMANAGER constructor called";
}

/*
 * When you write to a file in this file system - like "/working/myfile.txt",
 * the file is stored in the IndexedDB database in the web browser, not on
 * the local file system of the machine.
 * This means that the file isn't stored in a location that you can access
 * through your operating system's file explorer!!!
 * Instead, it's stored in a database that's managed by the web browser.
 *
 * You can inspect this database by using your web browser's developer tools.
 * For example, in Google Chrome, you can open the developer tools by pressing
 * F12, then go to the Application tab, and look under IndexedDB in the Storage
 * section. Here, you should be able to see the data that's stored by your
 * application. *
 *
 * For example, in Firefox press F12, section Storage, IndexdDB you will find
 * myfile.txt
 */


void FILESYSTEMMANAGER::onSyncfsComplete()
{
    qDebug() << "---> onSyncfsComplete() <--- called";
    qDebug() << "---> IDBFS is ready";

    // Open a file for writing
    QFile file("/working/myfile.txt");

    if (!file.open(QIODevice::WriteOnly))
    {
        qDebug() << "---> ERROR";
        qDebug() << "---> Failed to open file for writing";
        return;
    }

    // Write to the file
    QTextStream out(&file);
    out << "Hello, Emscripten!\n";
    out << "\n";
    out << "Hello, Emscripten!\n";
    out << "Hello, WPL\n";
    qDebug() << "---> write to file";

    // Close the file
    file.close();
    qDebug() << "---> close file";


    // Open the file for reading
    QFile infile("/working/myfile.txt");

    if (!infile.open(QIODevice::ReadOnly))
    {
        qDebug() << "---> ERROR";
        qDebug() << "---> Failed to open file for reading";
        return;
    }

    // Read from the file
    QTextStream in(&infile);

    while (!in.atEnd())
    {
        qDebug() << in.readLine() << " from file!";
    }


    // Sync the in-memory file system with IDBFS
    EM_ASM(FS.syncfs(false, function (err)
        {
            assert(!err);
        });
           );
}

void FILESYSTEMMANAGER::mountAndSyncFS()
{
    qDebug() << "---> mountAndSyncFS() <--- called";

    EM_ASM(
        FS.mkdir('/working');
        FS.mount(IDBFS, {}, '/working');

        FS.syncfs(true, function (err)
            {
                assert(!err);
            });

        );
}
