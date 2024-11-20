#include "LogIn.h"

LogIn::LogIn() {}

LogIn::~LogIn(){}

std::optional<std::string> LogIn::getUserId(){
    if(mp_user == nullptr){
        return std::nullopt;
    }
    else{
        return mp_user->userName;
    }
}


bool LogIn::isUserAuth(){
    if (mp_user == nullptr){
        return false;
    }
    else{
        return true;
    }
}

bool LogIn::logOutUser(){
    delete mp_user;
}

bool LogIn::checkUserAuthorized(std::string userId,std::string userPassword){

    //request
    if(userId == "test"){
        userData data;
        mp_user = &data;
        mp_user->userName = userId;
        mp_user->userPassword = userPassword;
        return true;
    }

    return false;
}

