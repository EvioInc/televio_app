// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../constants.dart';
// import '../data/app_data.dart';
// import 'package:get/get.dart';
//
// DatabaseController databaseController = DatabaseController();
//
// class DatabaseController {
//   Future<void> startAgreementsStream() async {
//     var stream = FirebaseFirestore.instance
//         .collection('setting')
//         .doc('agreements')
//         .snapshots();
//
//     await for (var snapshot in stream) {
//       AppData appData = Get.find();
//       appData.agreements = snapshot.data()?['agreements'];
//     }
//   }
//
//   Future<void> updateAgreements({required String agreements}) async {
//     AppData appData = Get.find();
//     appData.agreements = agreements;
//
//     await FirebaseFirestore.instance
//         .collection('setting')
//         .doc('agreements')
//         .update({'agreements': agreements});
//   }
//
//   Future<bool> isCorrectPassword(String email, String password) async {
//     try {
//       var data = await FirebaseFirestore.instance
//           .collection('user')
//           .where('email', isEqualTo: email)
//           .get();
//
//       if (data.docs.first['password'] == password) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e.toString());
//       return false;
//     }
//   }
//
//   Future<void> fetchMyInfo() async {
//     AppData appData = Get.find();
//     print(appData.userEmail);
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('user')
//         .where('email', isEqualTo: appData.userEmail)
//         .get();
//
//     appData.myInfo = MyInfo.fromJson(
//         querySnapshot.docs.first.data() as Map<String, dynamic>);
//
//     print(appData.myInfo.userType);
//   }
//
//   Future<void> addUser(
//       {required String email, required String password}) async {
//     AppData appData = Get.find();
//
//     appData.myInfo = MyInfo(
//       date: DateTime.now(),
//       recentLoginAt: DateTime.now(),
//       email: email,
//       password: password,
//       name: '',
//       nickname: '',
//       phone: '',
//       point: 0,
//       userType: 'user',
//       couponPassword: '000000',
//       gameCoupon: 0,
//       snackCoupon: 0,
//     );
//     await FirebaseFirestore.instance
//         .collection('user')
//         .doc()
//         .set(appData.myInfo.toJson());
//   }
//
//   Future<bool> isDuplicatedNickname(String nickname) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('user')
//         .where('nickname', isEqualTo: nickname)
//         .get();
//     if (querySnapshot.docs.length == 0) {
//       return false;
//     } else {
//       return true;
//     }
//   }
//
//   Future<void> addPost(PostModel post) async {
//     await FirebaseFirestore.instance
//         .collection('community')
//         .doc(post.calculatedId)
//         .set(post.toJson());
//   }
//
//   Future<String> getNickname(String email) async {
//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('user')
//           .where('email', isEqualTo: email)
//           .get();
//
//       return ((querySnapshot.docs.first.data()
//               as Map<String, dynamic>)['nickname'] ??
//           'null');
//     } catch (e) {
//       return 'null';
//     }
//   }
//
//   Future<void> deleteUserData(String targetEmail) async {
//     final querySnapshot = await FirebaseFirestore.instance
//         .collection('user')
//         .where('email', isEqualTo: targetEmail)
//         .get();
//     final id = querySnapshot.docs.first.id;
//     await FirebaseFirestore.instance.collection('user').doc(id).delete();
//     return;
//   }

// Future<int> getAllowMinimumVersion() async {
//   AppData appData = Get.find();
//   try {
//     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//         .collection('setting')
//         .doc('version')
//         .get();
//
//     appData.latestVersion =
//     ((documentSnapshot.data() as Map<String, dynamic>)['latest'] ?? 0);
//
//     return ((documentSnapshot.data()
//     as Map<String, dynamic>)['allowMinimum'] ??
//         kMinimumVersionIfError);
//   } catch (e) {
//     return kMinimumVersionIfError;
//   }
// }
// }
