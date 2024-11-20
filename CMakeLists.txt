cmake_minimum_required(VERSION 3.16)

project(TFM_quim VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2 Widgets Core)



# Define the list of QRC files
set(SOURCES main.cpp)
qt_add_resources(SOURCES resources.qrc)
# Add the QRC file to the project
 qt6_add_resources(RESOURCES
     FILES ${RESOURCE_FILES}
 )

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTFM_quim
    ${SOURCES}
    main.cpp
)

qt_add_qml_module(appTFM_quim
    URI TFM_quim
    VERSION 1.0
        QML_FILES Main.qml
        QML_FILES App.qml
        QML_FILES ComponentPrincipalPage.qml
        SOURCES Vista/NavegationManager.h Vista/NavegationManager.cpp
        QML_FILES PopupQuestion.qml
        SOURCES Vista/popupquestion.h Vista/popupquestion.cpp
        SOURCES Questions/questionmanager.h Questions/questionmanager.cpp
        SOURCES Vista/AboutUs.h Vista/AboutUs.cpp
        SOURCES Login/LogIn.h Login/LogIn.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTFM_quim PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTFM_quim
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTFM_quim
    PRIVATE Qt6::Quick
    PRIVATE Qt6::QuickControls2
    PRIVATE Qt6::Widgets
)


include(GNUInstallDirs)
install(TARGETS appTFM_quim
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
