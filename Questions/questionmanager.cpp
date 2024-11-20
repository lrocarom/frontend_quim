#include "questionmanager.h"
#include <iostream>

QuestionManager::QuestionManager() {
}



void QuestionManager::initQuestionList(){
    actualPage = 0;
    tQuestionAnswer question;
    question.question = "QUESTION1";

    question.possibleAnswers.push_back("SI");
    question.possibleAnswers.push_back("NO");
    question.possibleAnswers.push_back("ANSWER3");
    question.possibleAnswers.push_back("ANSWER4");

    tQuestionAnswer question2;

    question2.question = "QUESTION2";

    question2.possibleAnswers.push_back("SI");
    question2.possibleAnswers.push_back("NO");
    question2.possibleAnswers.push_back("ANSWER3");
    question2.possibleAnswers.push_back("ANSWER4");


    actualQuestions.push_back(question);
    actualQuestions.push_back(question2);

}
int QuestionManager::getActualPage(){
    return actualPage;
}



eQuestionTime QuestionManager::getActiveQuestion(){
    return eQuestionTime::eEvening;
}


void QuestionManager::changeNextQuestion(){
    actualPage = actualPage + 1;

}

tQuestionAnswer QuestionManager::getActualQuestion(){
    return actualQuestions[actualPage];
}

std::vector<tQuestionAnswer> QuestionManager::getQuestionList(){
    return actualQuestions;
}
