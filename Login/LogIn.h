#ifndef LOGIN_H
#define LOGIN_H

#include <string>
#include <optional>
#include <QCache>

typedef struct{
    std::string userName;
    std::string userPassword;
} userData;

class LogIn
{
public:
    LogIn();
    ~LogIn();

public:
    std::optional<std::string> getUserId();

public:

    bool isUserAuth();

    bool logOutUser();

    bool checkUserAuthorized(std::string userId,std::string userPassword);


private:
    userData* mp_user = nullptr;


};

#endif // LOGIN_H
