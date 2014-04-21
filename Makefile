
GO_EASY_ON_ME = 1
export TARGET=iphone:clang
export ARCHS=armv7 armv7s
export TARGET_IPHONEOS_DEPLOYMENT_VERSION = 5.0
export TARGET_CC = xcrun -sdk iphoneos clang
export TARGET_CXX = xcrun -sdk iphoneos clang++
export TARGET_LD = xcrun -sdk iphoneos clang++
export SHARED_CFLAGS = -fobjc-arc
export ADDITIONAL_OBJCFLAGS = -fobjc-arc 
#-all_load

include theos/makefiles/common.mk


DEBUG = 1


RESOURCE_DIR = FloatAppDemo/Resources
BUNDLE_NAME = WelcomeWagonResources
WelcomeWagonResources_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries
include $(THEOS)/makefiles/bundle.mk



TWEAK_NAME = WelcomeWagon
WelcomeWagon_FILES = Tweak.xm

# ------- View -------
WelcomeWagon_FILES += View/FloatRootWindow.m
WelcomeWagon_FILES += View/YWNavView.m
WelcomeWagon_FILES += View/YWMaskLogo.m
WelcomeWagon_FILES += View/YWDragView.m

# ------- FloatHelper -------
WelcomeWagon_FILES += FloatHelper/GlobalFlag.m
WelcomeWagon_FILES += FloatHelper/NSBundle+floatApp.m
WelcomeWagon_FILES += FloatHelper/UIImage+floatApp.m
WelcomeWagon_FILES += FloatHelper/UINavigationController+hidekeyboard.m
WelcomeWagon_FILES += FloatHelper/UIViewController+floatApp.m
WelcomeWagon_FILES += FloatHelper/YWMsgClient.m
WelcomeWagon_FILES += FloatHelper/YWMsgService.m
WelcomeWagon_FILES += FloatHelper/YWTestObj.m


#------- Controller/common -------
WelcomeWagon_FILES += Controller/common/UIViewController+quickNavBarItem.m
WelcomeWagon_FILES += Controller/common/UIViewController+defaultBg.m
WelcomeWagon_FILES += Controller/common/F_BaseViewController.m
WelcomeWagon_FILES += Controller/common/UIButton+commonBG.m

#------- Controller -------
WelcomeWagon_FILES += Controller/FloatApp.m
WelcomeWagon_FILES += Controller/FloatRootViewController.m
WelcomeWagon_FILES += Controller/F_RegistViewController.m
WelcomeWagon_FILES += Controller/F_LoginWithAccountController.m
WelcomeWagon_FILES += Controller/F_LoginWithPhoneController.m
WelcomeWagon_FILES += Controller/F_UserCompleteViewController.m
WelcomeWagon_FILES += Controller/F_AuthViewController.m
WelcomeWagon_FILES += Controller/F_ForgetPwdController.m


#------- Utils -------
WelcomeWagon_FILES += Utils/UIBarButtonItem+quick.m
WelcomeWagon_FILES += Utils/UIButton+stretchable.m
WelcomeWagon_FILES += Utils/UIView+background.m
WelcomeWagon_FILES += Utils/UIView+resignResponder.m
WelcomeWagon_FILES += Utils/YWNavigationController.m
WelcomeWagon_FILES += Utils/YWTextFieldInputDelegate.m
WelcomeWagon_FILES += Utils/UIView+Metrics.m


#------- ThirdParty -------
WelcomeWagon_FILES += ThirdParty/TPKeyBoardAvoid/TPKeyboardAvoidingScrollView.m


WelcomeWagon_FRAMEWORKS = UIKit CoreGraphics QuartzCore
WelcomeWagon_PRIVATE_FRAMEWORKS = AppSupport

include $(THEOS_MAKE_PATH)/tweak.mk


