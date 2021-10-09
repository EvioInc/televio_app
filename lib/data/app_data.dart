import '../models/user_model.dart';
import 'package:get/get.dart';

class AppData extends GetxController {
  bool _isLoadingScreen = false;
  double? _loadingValue;
  int _emailAuthCount = 0;
  UserModel? _myInfo;
  UserModel? get myInfo => _myInfo;
  set myInfo(UserModel? myInfo) {
    _myInfo = myInfo;
    update();
  }

  bool get isLoading => _isLoadingScreen;

  void enterLoading() {
    _isLoadingScreen = true;
    update();
  }

  void exitLoading() {
    _isLoadingScreen = false;
    update();
  }
}
