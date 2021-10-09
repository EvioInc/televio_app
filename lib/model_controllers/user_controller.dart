// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_template/models/user_model.dart';
// import '../models/user_model.dart';
// import '../common_import.dart';

// UserController userController = UserController();

// class UserController {
//   final String _collectionKey = UserModelKey.collectionKey;
//   final String _docIdKey = UserModelKey.uid;
//   StreamSubscription? _subscription;

//   void subscribe(String id) async {
//     Stream<DocumentSnapshot> snapshots = FirebaseFirestore.instance
//         .collection(UserModelKey.collectionKey)
//         .doc(id)
//         .snapshots();
//     _subscription = snapshots.listen((event) {
//       UserModel user = UserModel.fromJson(event.data() as Map<String, dynamic>);
//       AppData appData = Get.find();
//       if (appData.myInfo?.uid == user.uid) {
//         appData.myInfo = user;
//       } else {}
//     });
//   }

//   void disposeSubscription() {
//     _subscription?.cancel();
//   }

//   Future<bool> contains(String uid) async {
//     var data;
//     try {
//       data = await FirebaseFirestore.instance
//           .collection(_collectionKey)
//           .doc(uid)
//           .get();
//     } catch (e) {
//       print(e);
//     }
//     if (data?.exists) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<void> create(UserModel user) async {
//     DocumentReference? data;
//     try {
//       data = await FirebaseFirestore.instance
//           .collection(_collectionKey)
//           .add(user.toJson());
//     } catch (e) {
//       print(e);
//     }
//     if (data != null) {
//       await FirebaseFirestore.instance
//           .collection(_collectionKey)
//           .doc(data.id)
//           .update({_docIdKey: data.id});
//     }
//   }

//   Future<void> update({
//     required String uid,
//     Timestamp? createAt,
//     String? email,
//     String? signUpMethod,
//     String? name,
//     String? nickname,
//     String? birth,
//     String? imageUrl,
//     String? userType,
//     String? membershipType,
//     int? point,
//     List<dynamic>? myCommentIds,
//     List<dynamic>? myFavoriteIds,
//     List<dynamic>? myVoteIds,
//     int? receiveFavoriteCount,
//     String? myInvitationLink,
//     bool? allowActivityNotification,
//     bool? allowNoticeEventNotification,
//     bool? allowPushNotification,
//     bool? languageEnglish,
//     String? pushToken,
//   }) async {
//     Map<String, dynamic> json = {};
//     json.addIf(
//         () => myFavoriteIds != null, UserModelKey.myFavoriteIds, myFavoriteIds);
//     json.addIf(() => receiveFavoriteCount != null,
//         UserModelKey.receiveFavoriteCount, receiveFavoriteCount);
//     json.addIf(() => createAt != null, UserModelKey.createAt, createAt);
//     json.addIf(() => email != null, UserModelKey.email, email);
//     json.addIf(() => name != null, UserModelKey.name, name);
//     json.addIf(() => nickname != null, UserModelKey.nickname, nickname);
//     json.addIf(() => birth != null, UserModelKey.birth, birth);
//     json.addIf(() => imageUrl != null, UserModelKey.imageUrl, imageUrl);
//     json.addIf(() => userType != null, UserModelKey.userType, userType);
//     json.addIf(() => myVoteIds != null, UserModelKey.myVoteIds, myVoteIds);
//     json.addIf(() => membershipType != null, UserModelKey.membershipType,
//         membershipType);
//     json.addIf(() => pushToken != null, UserModelKey.pushToken, pushToken);
//     json.addIf(() => point != null, UserModelKey.point, point);
//     json.addIf(
//         () => myCommentIds != null, UserModelKey.myCommentIds, myCommentIds);
//     json.addIf(() => myInvitationLink != null, UserModelKey.myInvitationLink,
//         myInvitationLink);

//     try {
//       await FirebaseFirestore.instance
//           .collection(_collectionKey)
//           .doc(uid)
//           .update(json);
//     } catch (e) {
//       // error
//     }
//   }

//   Future<UserModel?> read(String id) async {
//     var data = await FirebaseFirestore.instance
//         .collection(_collectionKey)
//         .doc(id)
//         .get();
//     if (data.data() != null) {
//       return UserModel.fromJson(data.data()!);
//     } else {
//       return null;
//     }
//   }

//   Future<void> delete(String id) async {
//     await FirebaseFirestore.instance
//         .collection(_collectionKey)
//         .doc(id)
//         .delete();
//   }

//   Future<bool> isDuplicatedNickname(String nickname) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection(_collectionKey)
//         .where(UserModelKey.nickname, isEqualTo: nickname)
//         .get();
//     if (querySnapshot.docs.length == 0) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   Future<bool> isDuplicatedEmail(String email) async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection(_collectionKey)
//         .where(UserModelKey.email, isEqualTo: email)
//         .get();
//     if (querySnapshot.docs.length == 0) {
//       return false;
//     } else {
//       return true;
//     }
//   }
// }
