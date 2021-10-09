UserType userTypeFrom(String value) {
  return UserType.values
      .firstWhere((e) => e.toString().toUpperCase() == value.toUpperCase());
}

MembershipType membershipTypeFrom(String value) {
  return MembershipType.values
      .firstWhere((e) => e.toString().toUpperCase() == value.toUpperCase());
}

SignUpMethod signUpMethodFrom(String value) {
  return SignUpMethod.values
      .firstWhere((e) => e.toString().toUpperCase() == value.toUpperCase());
}

class UserModelKey {
  static get collectionKey => 'users';
  static get createAt => 'createAt';
  static get uid => 'uid';
  static get email => 'email';
  static get name => 'name';
  static get nickname => 'nickname';
  static get birth => 'birth';
  static get imageUrl => 'imageUrl';
  static get userType => 'userType';
  static get membershipType => 'membershipType';
  static get signUpMethod => 'signUpMethod';
  static get point => 'point';
  static get myCommentIds => 'myCommentIds';
  static get myVoteIds => 'myVoteIds';
  static get myInvitationLink => 'myInvitationLink';
  static get myFavoriteIds => 'myFavoriteIds';
  static get receiveFavoriteCount => 'receiveFavoriteCount';
  static get pushToken => 'pushToken';
}

enum UserType {
  user,
  manager,
  admin,
}

enum MembershipType {
  normal,
  premium,
}

enum SignUpMethod {
  email,
  apple,
  google,
  facebook,
  kakao,
  naver,
}

class UserModel {
  DateTime createAt;
  String uid;
  String email;
  String name;
  String nickname;
  String birth;
  String imageUrl;
  UserType userType;
  MembershipType membershipType;
  SignUpMethod signUpMethod;
  int point;
  List<dynamic> myCommentIds;
  List<dynamic> myFavoriteIds;
  List<dynamic> myVoteIds;
  int receiveFavoriteCount;
  String myInvitationLink;
  String pushToken;

  UserModel({
    required this.createAt,
    this.uid = '',
    this.email = '',
    this.name = '',
    this.nickname = '',
    this.birth = '',
    this.imageUrl = '',
    this.userType = UserType.user,
    this.membershipType = MembershipType.normal,
    this.signUpMethod = SignUpMethod.email,
    this.point = 0,
    this.pushToken = '',
    this.myInvitationLink = '',
    this.myCommentIds = const [],
    this.myFavoriteIds = const [],
    this.myVoteIds = const [],
    this.receiveFavoriteCount = 0,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : createAt = json[UserModelKey.createAt].toDate(),
        uid = json[UserModelKey.uid],
        email = json[UserModelKey.email],
        name = json[UserModelKey.name],
        myFavoriteIds = json[UserModelKey.myFavoriteIds] ?? [],
        receiveFavoriteCount = json[UserModelKey.receiveFavoriteCount] ?? 0,
        nickname = json[UserModelKey.nickname],
        birth = json[UserModelKey.birth],
        imageUrl = json[UserModelKey.imageUrl],
        userType = userTypeFrom(json[UserModelKey.userType]),
        membershipType = membershipTypeFrom(json[UserModelKey.membershipType]),
        signUpMethod = signUpMethodFrom(json[UserModelKey.signUpMethod]),
        point = json[UserModelKey.point],
        myCommentIds = json[UserModelKey.myCommentIds] ?? [],
        myVoteIds = json[UserModelKey.myVoteIds] ?? [],
        myInvitationLink = json[UserModelKey.myInvitationLink],
        pushToken = json[UserModelKey.pushToken];

  Map<String, dynamic> toJson() => {
        UserModelKey.createAt: createAt,
        UserModelKey.uid: uid,
        UserModelKey.email: email,
        UserModelKey.name: name,
        UserModelKey.nickname: nickname,
        UserModelKey.birth: birth,
        UserModelKey.imageUrl: imageUrl,
        UserModelKey.userType: userType.toString(),
        UserModelKey.membershipType: membershipType.toString(),
        UserModelKey.signUpMethod: signUpMethod.toString(),
        UserModelKey.point: point,
        UserModelKey.myCommentIds: myCommentIds,
        UserModelKey.myInvitationLink: myInvitationLink,
        UserModelKey.receiveFavoriteCount: receiveFavoriteCount,
        UserModelKey.myVoteIds: myVoteIds,
        UserModelKey.myFavoriteIds: myFavoriteIds,
        UserModelKey.pushToken: pushToken,
      };
}
