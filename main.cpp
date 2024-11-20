#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <iostream>
#include <Vista/NavegationManager.h>


int main(int argc, char *argv[])
{
    // std::cout << "RUNNNING MAIN" << std::endl;
    // QGuiApplication app(argc, argv);
    // QQuickStyle::setStyle("Material");

    // QQmlApplicationEngine engine;
    // QObject::connect(
    //     &engine,
    //     &QQmlApplicationEngine::objectCreationFailed,
    //     &app,
    //     []() { QCoreApplication::exit(-1); },
    //     Qt::QueuedConnection);
    // engine.loadFromModule("TFM_quim", "Main");

    // return app.exec();
    std::cout <<"PRINTING THE MESSAGE" << std::endl;

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine *engine;
    engine = new QQmlApplicationEngine();

    NavegationManager navigationManager;
    navigationManager.setQmlEngine(engine);
    engine->rootContext()->setContextProperty("navigationManager", &navigationManager);
    //engine->loadFromModule("TFM_quim", "App");
    engine->load(QUrl(QStringLiteral("qrc:/PrincipalPage.qml")));
    if (engine->rootObjects().isEmpty())
        return -1;
    navigationManager.start();

    return app.exec();
}
