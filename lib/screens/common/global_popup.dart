import 'package:flutter/rendering.dart';

import '../../common_import.dart';
import 'package:fluttertoast/fluttertoast.dart';

showCustomToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: kSecondaryColor,
    textColor: Colors.white,
  );
}

showCustomAlert(String message) {
  Get.dialog(
    AlertDialog(
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          child: Text('확인'),
        ),
      ],
    ),
  );
}

showCustomAlertTelevio(String message) {
  Get.dialog(
    AlertDialog(
      content: Padding(
        padding:  EdgeInsets.only(top: 12.w),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      actions: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
            child: SizedBox(
              width: Get.width/2,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: Text('확인'),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100.r))),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

showCustomCupertinoAlert(String message) {
  Get.dialog(
    AlertDialog(
      contentPadding:
          EdgeInsets.only(top: 32.h, bottom: 0.h, left: 20.w, right: 20.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.r))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: TextStyle(color: kGreyCupertino, fontSize: 15.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.12.h),
          Divider(
            height: 1,
          ),
          // SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextButton(
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: kBlueCupertino,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
