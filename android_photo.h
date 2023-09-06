#ifndef ANDROID_PHOTO_H
#define ANDROID_PHOTO_H

#include <QObject>

class ANDROID_PHOTO : public QObject
{
    Q_OBJECT

    // To call a C++ function "myFunction()" from QML,
    // you need to expose the C++ object to the QML context
public:
    Q_INVOKABLE void myFunction();

public:
    explicit ANDROID_PHOTO(QObject *parent = nullptr);
    ~ANDROID_PHOTO();

};

#endif // ANDROID_PHOTO_H
