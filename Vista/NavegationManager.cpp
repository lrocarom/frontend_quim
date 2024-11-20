#include "NavegationManager.h"
#include <iostream>
#include <QResource>  // Asegúrate de incluir este archivo
#include <QQuickWindow>
#include <QMessageBox>
#include <QDialog>
#include <Vista/AboutUs.h>

NavegationManager::NavegationManager(QObject *parent) : QObject(parent) {
    // constructor code if needed
    m_managerQuestions = new QuestionManager();
    m_managerQuestions->initQuestionList();
    m_isInitialized = true;
    initQuestionManager();
    changeQuestion();

}


void NavegationManager::start(){
    mp_logIn = new LogIn();
    if(!mp_logIn->isUserAuth()){
        std::cout << "No login " << std::endl;
        //goToLoginPage();
    }

}

void NavegationManager::initQuestionManager(){
    actualQuestion = m_managerQuestions->getActualQuestion();
    activeQuestion = m_managerQuestions->getActiveQuestion();

}
bool NavegationManager::isMorningActive(){
    if(activeQuestion == eQuestionTime::eMorning){
        return true;
    }
    else{
        return false;
    }
}

bool NavegationManager::isEveningActive(){
    if(activeQuestion == eQuestionTime::eEvening){
        return true;
    }
    else{
        return false;
    }
}


void NavegationManager::goToLoginPage()
{
    std::cout << "LoginPage" << std::endl;
    //mp_engine->clearComponentCache();
    QQuickWindow* pMainWindow = qobject_cast<QQuickWindow*>(mp_engine->rootObjects().first());
    mp_engine->load(QUrl(QStringLiteral("qrc:/LoginPage.qml")));
    pMainWindow->close();
    pMainWindow->deleteLater();
    mp_engine->rootObjects().removeOne(pMainWindow);


}
void NavegationManager::checkUserNameAndPassword(QString userName,QString userPassword)
{
    if(mp_logIn->checkUserAuthorized(userName.toStdString(),"test")){
        std::cout << "Going To main page" << std::endl;
        this->goToMainPage();
    }
    else{
        QObject *rootObject = nullptr;
        qDebug() << "Change Form";
        // Find the Rectangle by its ID
        for (auto it : mp_engine->rootObjects()){
            if(it->objectName() == "loginPage"){
                rootObject = it;
            }

        }
        if (mp_engine->rootObjects().isEmpty()) {
            qWarning() << "Failed to load main.qml";
            return;
        }

        if (rootObject) {

            QQuickItem *progressBar = rootObject->findChild<QQuickItem*>("textBadQuestion",Qt::FindChildrenRecursively);
            if (progressBar) {
                qDebug() << "Change Form 3";
                progressBar->setVisible(true);
            }
        }
    }
}




void NavegationManager::goToMainPage()
{
    std::cout << "Going To main page" << std::endl;
    mp_engine->clearComponentCache();
    mp_engine->load(QUrl(QStringLiteral("qrc:/PrincipalPage.qml")));
}

QString NavegationManager::textFirstAnswer() const{
    return "YES";
}
QString NavegationManager::textSecondAnswer() const{
    return "NO";
}
QString NavegationManager::textQuestion() const{
    if(!m_isInitialized){
        return "TEST";
    }
    else {
        return actualQuestion.question;
    }
}

void NavegationManager::nextPage(){


}

void NavegationManager::nextQuestion(){
    m_managerQuestions->changeNextQuestion();
    changeQuestion();


}

void NavegationManager::changeQuestion(){
    qDebug() << "Change question 1";
    questionNumber = m_managerQuestions->getActualPage() + 1;
    actualQuestion = m_managerQuestions->getActualQuestion();
    qDebug() << "Change question 2";
    emit textQuestionChanged();
    emit textChanged();


}

void NavegationManager::showLoginDialog2(){
    qDebug() << "Show Login Form";

    QQmlApplicationEngine engine;

    // Load the PopupQuestion.qml file as a component
    QQmlComponent component(&engine, QUrl(QStringLiteral("qrc:/PopupQuestion.qml")));
    // Check for errors in loading the component
    if (component.isError()) {
        for (const auto& error : component.errors()) {
            qDebug() << "Component error:" << error.toString();
        }
        return;
    }

    // Create the Popup QML component
    QObject* popupObject = component.create();

    // Ensure that the popup is correctly shown
    if (popupObject) {
        qDebug() << "Showing Login Form";
        // Optional: Set the parent of the popup to be the root window or another item
        popupObject->setParent(nullptr);  // This can be the main window or other parent if needed
    } else {
        qDebug() << "Popup creation failed!";
    }

}

void NavegationManager::goToAboutUs(){
    qDebug() << "ENTRA ";

    std::cout <<"ENTRA" << std::endl;
    mp_engine->clearComponentCache();
    mp_engine->load(QUrl(QStringLiteral("qrc:/PopupQuestion.qml")));


}

void NavegationManager::testCout(){
    qDebug() << "CLICK";

    std::cout <<"CLICK..." << std::endl;
}
