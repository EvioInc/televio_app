import 'dart:async';

import '../controllers/local_storage_controller.dart';

import 'onboading_screen.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'login_screen.dart';

import '../common_import.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // _checkDatabase();
    // pushNotificationController.init();
    _startSplashTimer(HomeScreen());
  }

  //
  // Future<void> _checkDatabase() async {
  //   if (await _availableVersion()) {
  //     _checkLocalInfo();
  //   } else {
  //     await Future.delayed(Duration(milliseconds: 2000));
  //     Get.dialog(
  //       AlertDialog(
  //         content: Text('버전이 낮아 실행할 수 없습니다. 업데이트 후 다시 실행 해주세요.'),
  //         actions: [
  //           OutlinedButton(
  //               onPressed: () async {
  //                 String url =
  //                     Platform.isIOS ? kAppleStoreLink : kAndroidStoreLink;
  //                 await canLaunch(url)
  //                     ? await launch(url)
  //                     : showCustomToast('오류가 발생했습니다.');
  //               },
  //               child: Text('업데이트하기'))
  //         ],
  //       ),
  //       barrierDismissible: false,
  //     );
  //   }
  // }
  //
  // Future<bool> _availableVersion() async {
  //   int allowMinimumVersion = await databaseController.getAllowMinimumVersion();
  //   if (kMyVersion < allowMinimumVersion) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  void _checkLocalInfo() async {
    // String? userEmail = await localStorageController.getUserEmail();
    // if (userEmail == null) {
    //   _startSplashTimer(OnBoardingScreen());
    // } else {
    //   if (userEmail.length == 0) {
    //     _startSplashTimer(OnBoardingScreen());
    //   } else {
    //     AppData appData = Get.find();
    //     appData.userEmail = userEmail;
    //     await databaseController.fetchMyInfo(userEmail);
    //     String? pushToken = await pushNotificationController.getToken();
    //     if (pushToken != null) {
    //       databaseController.updatePushToken(
    //         email: userEmail,
    //         pushToken: pushToken,
    //       );
    //     }
    //
    //     // if (appData.myInfo.userType == 'expert') {
    //     //   _startSplashTimer(ExpertHomePage());
    //     // } else {
    //     _startSplashTimer(MainScreen());
    //     // }
    //   }
    // }
  }

  Future<void> _startSplashTimer(Widget nextScreen) async {
    // await pushNotificationController.requestPermission();

    Future.delayed(Duration(milliseconds: 3000)).then((value) => Get.off(
          () => nextScreen,
          transition: Transition.fade,
          duration: Duration(milliseconds: 1000),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShowUpAnimation(
          child: SizedBox(
            width: Get.width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // CircleAvatar(
                //   backgroundColor: kPrimaryColor,
                // ),
                Image.asset('assets/images/logo_with_icon.png'),
                // Text('televio'),
              ],
            ),
          ),
          delayStart: Duration(milliseconds: 500),
          animationDuration: Duration(milliseconds: 1500),
          curve: Curves.bounceIn,
          direction: Direction.vertical,
          offset: 0.5,
        ),
      ),
    );
  }
}
