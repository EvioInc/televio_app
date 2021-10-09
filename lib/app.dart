import 'common_import.dart';
import 'screens/splash_screen.dart';

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppData());
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlynnApps',
        home: SplashScreen(),
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          primarySwatch: createMaterialColor(kPrimaryColor),
          fontFamily: 'NotoSans',
        ),
        builder: (BuildContext? context, Widget? child) {
          // 기기 내 텍스트 크기설정을 무시하기 위한 코드
          if (context == null) {
            return Container();
          } else {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child ?? Container(),
            );
          }
        },
      ),
    );
  }
}
