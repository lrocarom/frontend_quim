#ifndef QUESTIONMANAGER_H
#define QUESTIONMANAGER_H
#include <string>
#include <vector>
#include <QString>


typedef struct  {
    QString question;
    std::vector<QString> possibleAnswers;
}tQuestionAnswer;


typedef enum{
    eMorning,
    eEvening
}eQuestionTime;
class QuestionManager
{
public:
    QuestionManager();


public:
    void initQuestionList();

public:
    std::vector<tQuestionAnswer> getQuestionList();

    tQuestionAnswer getActualQuestion();

    eQuestionTime getActiveQuestion();


    void changeNextQuestion();

    int getActualPage();

private:
    std::vector<tQuestionAnswer> actualQuestions;
    int actualPage = 0;
};

#endif // QUESTIONMANAGER_H
