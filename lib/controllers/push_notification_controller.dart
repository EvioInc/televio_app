// import 'package:firebase_messaging/firebase_messaging.dart';
// import '../common_import.dart';

// PushNotificationController pushNotificationController =
//     PushNotificationController();

// class PushNotificationController {
//   Future<void> requestPermission() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     print('User granted permission: ${settings.authorizationStatus}');
//   }

//   Future<void> init() async {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Got a message whilst in the foreground!');
//       print('Message data: ${message.data}');
//       if (message.notification != null) {
//         print('Message also contained a notification: ${message.notification}');
//       }
//       handleOnForeground(message);
//     });
//     //
//     // // subscribe to topic on each app start-up
//     // await FirebaseMessaging.instance
//     //     .subscribeToTopic('noti'); // notification for receive message
//     // await FirebaseMessaging.instance.subscribeToTopic('ads'); // advertisement
//   }

//   Future<String?> getToken() async {
//     return await FirebaseMessaging.instance.getToken();
//   }

//   void handleOnForeground(RemoteMessage message) async {
//     /// When the application is open, in view & in use.
//     Get.snackbar(
//       message.data['title'], message.data['content'],
//       backgroundColor: Colors.white,
//       // colorText: Colors.black,
//       titleText: Text(
//         message.data['title'],
//         style: TextStyle(
//           color: kPrimaryColor,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       messageText: Text(
//         message.data['content'],
//         style: TextStyle(color: Colors.black),
//       ),
//       icon: Image.asset('assets/appicon.png'),
//       onTap: (GetBar snack) {},
//     );
//   }

//   void handleOnBackground(RemoteMessage message) async {
//     /// When the application is open, however in the background (minimised).
//     /// This typically occurs when the user has pressed the "home" button on the device,
//     /// has switched to another app via the app switcher or has the application open on a different tab (web).
//     print(message.data);
//   }
// }
