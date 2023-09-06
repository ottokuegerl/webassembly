cmake_minimum_required(VERSION 3.16)

project(android_photos VERSION 0.1 LANGUAGES CXX)

################################################################################
# CMAKE_AUTOMOC ON, CMake will automatically run the moc tool on any header
#                   files that contain the Q_OBJECT macro.
#                   This can save a lot of time and effort when working with
#                   Qt projects that use many classes with the Q_OBJECT macro.
################################################################################
# CMAKE_AUTORCC ON, enables the automatic handling of Qt resource files,
#                   you can just add .qrc files as sources to your executable
#                   or library
################################################################################

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Core Quick QuickControls2)

##############################################
# the static library
##############################################
add_library(cppotp STATIC
    cpptotp/src/libcppotp/bytes.cpp
    cpptotp/src/libcppotp/otp.cpp
    cpptotp/src/libcppotp/sha1.cpp
)

qt_standard_project_setup()

qt_add_executable(appandroid_photos
    main.cpp
    android_photo.h
    android_photo.cpp
    myResources.qrc
)

qt_add_qml_module(appandroid_photos
    URI android_photos
    VERSION 1.0
    QML_FILES Main.qml
    SOURCES filesystemmanager.h filesystemmanager.cpp
    SOURCES arubaap172fa.h arubaap172fa.cpp
    SOURCES ha2fa.h ha2fa.cpp
    SOURCES credentials.h
    SOURCES credentialswrapper.h credentialswrapper.cpp
)

set_target_properties(appandroid_photos PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

##############################################
# add -lidbfs.js to use Emscripten IDBFS persitent file system#
##############################################
## add cppotp library
##############################################
target_link_libraries(appandroid_photos
    PRIVATE Qt6::Core Qt6::Quick cppotp
    "-lidbfs.js"
)

install(TARGETS appandroid_photos
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
