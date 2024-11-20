#ifndef NAVEGATIONMANAGER_H
#define NAVEGATIONMANAGER_H

#include <QObject>
#include <QPushButton>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQmlContext>
#include <QString>
#include <Vista/popupquestion.h>
#include <Questions/questionmanager.h>
#include <QQuickItem>
#include <QQmlEngine>
#include <QQuickWindow>
#include <Login/LogIn.h>

class NavegationManager: public QObject
{
    Q_OBJECT
  //  Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
    Q_PROPERTY(QString textFirstAnswer READ textFirstAnswer NOTIFY textChanged)
    Q_PROPERTY(QString textSecondAnswer READ textSecondAnswer NOTIFY textChanged)
    Q_PROPERTY(QString textQuestion READ textQuestion NOTIFY textQuestionChanged)


public:
    explicit NavegationManager(QObject *parent = nullptr);

    void setQmlEngine(QQmlApplicationEngine* engine){
        mp_engine = engine;
    }

    void initQuestionManager();
    void start();
public:
    Q_INVOKABLE void goToMainPage();
    Q_INVOKABLE void goToLoginPage();
    Q_INVOKABLE void checkUserNameAndPassword(QString userName,QString userPassword);
    Q_INVOKABLE void showLoginDialog2();
    Q_INVOKABLE void goToAboutUs();
    Q_INVOKABLE void testCout();
    Q_INVOKABLE void nextQuestion();
    Q_INVOKABLE bool isMorningActive();
    Q_INVOKABLE bool isEveningActive();



    // Method to change the width of the Rectangle
    Q_INVOKABLE void changeRectangleWidth(double newWidth) {
        qDebug() << "Change Form";
        // Find the Rectangle by its ID
        QObject *rootObject = nullptr;
        qDebug() << "Change Form";
        // Find the Rectangle by its ID
        for (auto it : mp_engine->rootObjects()){
            if(it->objectName() == "principalPage"){
                rootObject = it;
            }

        }
        if (mp_engine->rootObjects().isEmpty()) {
            qWarning() << "Failed to load main.qml";
            return;
        }
        if (rootObject) {
            QQuickItem *progressBar = rootObject->findChild<QQuickItem*>("progressBar",Qt::FindChildrenRecursively);
            if (progressBar) {
                qDebug() << "Change Form 3";
                int actualPage = m_managerQuestions->getActualPage() + 1;
                float navBar = actualPage * 0.2;
                qDebug() << "This is actual page " << actualPage;
                qDebug() << "This is the value of navBar " << navBar;
                progressBar->setWidth(newWidth * navBar);
            }
        }
    }

public:
    QString textQuestion() const;
    QString textFirstAnswer() const;
    QString textSecondAnswer() const;

    void nextPage();
    void changeQuestion();

signals:
    void textQuestionChanged(); // Signal for textQuestion change
    void textChanged(); // Signal for textQuestion change


private:
    int questionNumber;
    QQmlApplicationEngine *mp_engine;
    tQuestionAnswer actualQuestion;
    eQuestionTime activeQuestion;
    QuestionManager* m_managerQuestions;
    QPushButton *myButton;
    LogIn *mp_logIn;
    bool m_isInitialized = false;
};


#endif // NAVEGATIONMANAGER_H
