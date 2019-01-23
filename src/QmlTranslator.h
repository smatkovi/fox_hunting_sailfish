#ifndef QMLTRANSLATOR_H
#define QMLTRANSLATOR_H

#ifdef QT_QML_DEBUG
#endif


#include <QObject>
#include <sailfishapp.h>
#include <QTranslator>
#include <QCoreApplication>
#include <QGuiApplication>
#include <QDebug>
#include <QDir>

class QmlTranslator : public QObject {
    Q_OBJECT

public:
    explicit QmlTranslator(QObject *parent = 0);

    // Translation installation method, which will be available in QML
    Q_INVOKABLE void setTranslation(QString translation);

private:
    QTranslator *translator;

signals:
    // The signal of change the current language to change the interface translation
    void languageChanged();

};

#endif // QMLTRANSLATOR_H
