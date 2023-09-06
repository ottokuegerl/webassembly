#include "android_photo.h"
#include <QDebug>

ANDROID_PHOTO::ANDROID_PHOTO(QObject *parent)
    : QObject{parent}
{

}

ANDROID_PHOTO::~ANDROID_PHOTO()
{
    qDebug() << "ANDROID_PHOTO destructor called";
}

void ANDROID_PHOTO::myFunction()
{
    qDebug() << "myFunction() from c++ called";
}
