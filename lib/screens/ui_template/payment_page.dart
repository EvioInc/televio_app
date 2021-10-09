// /// 일단 Thirty 앱에서 사용한 코드를 그대로 복사함. 정리 필요

// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/cupertino.dart';
// import '../common/global_popup.dart';
// import '../common/rounded_rectangle_button.dart';
// import '../../controllers/in_app_purchase_controller.dart';

// import '../../common_import.dart';

// final List<Map<String, dynamic>> _products = [
//   {
//     'index': 1,
//     'numOfStar': 10,
//     'numOfStarBonus': 0,
//     'price': '11,000원',
//     'productId': 'product1',
//   },
//   {
//     'index': 2,
//     'numOfStar': 20,
//     'numOfStarBonus': 2,
//     'price': '22,000원',
//     'productId': 'product2',
//   },
//   {
//     'index': 3,
//     'numOfStar': 30,
//     'numOfStarBonus': 4,
//     'price': '33,000원',
//     'productId': 'product3',
//   },
//   {
//     'index': 4,
//     'numOfStar': 50,
//     'numOfStarBonus': 9,
//     'price': '55,000원',
//     'productId': 'product4',
//   },
//   {
//     'index': 5,
//     'numOfStar': 100,
//     'numOfStarBonus': 23,
//     'price': '109,000원',
//     'productId': 'product5',
//   },
//   {
//     'index': 6,
//     'numOfStar': 200,
//     'numOfStarBonus': 57,
//     'price': '219,000원',
//     'productId': 'product6',
//   },
// ];

// class PaymentPage extends StatefulWidget {
//   @override
//   _PaymentPageState createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   AppData appData = Get.find();
//   final _tooltipKey = GlobalKey<State<Tooltip>>();
//   int _choiceChipIndex = 0;

//   @override
//   void initState() {
//     _choiceChipIndex = 0;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       builder: (AppData appData) => Loading(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: _buildAppBar(),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 32.w),
//               child: SafeArea(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 36.h),
//                     GestureDetector(
//                       onTap: () {
//                         final dynamic _toolTip = _tooltipKey.currentState;
//                         _toolTip.ensureTooltipVisible();
//                       },
//                       child: Tooltip(
//                         key: _tooltipKey,
//                         message: '질문 1개당 별 ${10}개가 소모됩니다.',
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text('나의 보유 별 갯수'),
//                             SizedBox(width: 4.w),
//                             Icon(
//                               CupertinoIcons.question_circle_fill,
//                               color: kPrimaryColor,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Icon(
//                           Icons.star,
//                           color: kPrimaryColor,
//                         ),
//                         SizedBox(width: 23.w),
//                         // Text(
//                         //   appData.myInfo.point.toString(),
//                         //   style: TextStyle(
//                         //       fontSize: 20.sp, fontWeight: FontWeight.bold),
//                         // ),
//                         SizedBox(width: 13.w),
//                         Text(
//                           '개',
//                           style: TextStyle(fontSize: 15.sp),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 21.h),
//                     Icon(
//                       Icons.add_circle_outline,
//                       color: kPrimaryColor,
//                     ),
//                     SizedBox(height: 13.h),
//                     Text('추가 결제할 별'),
//                     SizedBox(height: 10.h),
//                     ..._products
//                         .map(
//                           (e) => _buildChoiceChip(
//                             index: e['index'],
//                             numOfStar: e['numOfStar'],
//                             numOfStarBonus: e['numOfStarBonus'],
//                             price: e['price'],
//                           ),
//                         )
//                         .toList(),
//                     SizedBox(height: 20.h),
//                     Divider(height: 1),
//                     SizedBox(height: 16.h),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text('부가세(VAT) 포함한 결제 금액'),
//                     ),
//                     SizedBox(height: 7.h),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         _choiceChipIndex == 0
//                             ? '0원'
//                             : _products[_choiceChipIndex - 1]['price'],
//                         style: TextStyle(
//                           color: kPrimaryColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 26.h),
//                     SizedBox(
//                       height: 49.h,
//                       child: RoundedRectangleButton(
//                         color: kPrimaryColor,
//                         isFilled: true,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               '결제하기',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ],
//                         ),
//                         onPressed: () async {
//                           await _makePurchase(appData);
//                         },
//                       ),
//                     ),
//                     SizedBox(height: Get.height * .1),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _makePurchase(AppData appData) async {
//     if (_choiceChipIndex == 0) {
//       showCustomToast('충전할 별 갯수를 선택해주세요.');
//     } else {
//       appData.enterLoading();
//       String? result = await inAppPurchaseController.handlePurchaseConsumable(
//           _products[_choiceChipIndex - 1]['productId']);
//       if (result == null) {
//         print('IAP no error');
//         _handleAfterPay(appData);
//         showCustomCupertinoAlert('결제가 완료되었습니다.');
//       } else {
//         print('IAP error');
//         showCustomCupertinoAlert(result);
//       }
//       appData.exitLoading();
//     }
//   }

//   void _handleAfterPay(AppData appData) {
//     // databaseController.updatePoint(
//     //     email: appData.myInfo.email,
//     //     newPoint: (appData.myInfo.point +
//     //             _products[_choiceChipIndex - 1]['numOfStar'] +
//     //             _products[_choiceChipIndex - 1]['numOfStarBonus'])
//     //         .toInt());
//   }

//   Widget _buildChoiceChip({
//     required int index,
//     required int numOfStar,
//     required int numOfStarBonus,
//     required String price,
//   }) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 7.h),
//       child: ChoiceChip(
//         onSelected: (value) {
//           if (value == true) {
//             setState(() => _choiceChipIndex = index);
//           } else {
//             setState(() => _choiceChipIndex = 0);
//           }
//         },
//         backgroundColor: Colors.white,
//         shape: StadiumBorder(side: BorderSide(color: kPrimaryColor)),
//         label: SizedBox(
//           height: 39.h,
//           child: Row(
//             children: [
//               Expanded(
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.star,
//                       color: kPrimaryColor,
//                     ),
//                     SizedBox(width: 20.w),
//                     Text.rich(
//                       TextSpan(
//                         children: [
//                           TextSpan(text: '$numOfStar'),
//                           TextSpan(
//                               text: ' +$numOfStarBonus ',
//                               style: TextStyle(color: kPrimaryColor)),
//                           TextSpan(text: '개'),
//                         ],
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                   mainAxisAlignment: MainAxisAlignment.start,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 9.h),
//                 child: DottedLine(
//                   direction: Axis.vertical,
//                   dashColor: kPrimaryColor,
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   price,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     color: kPrimaryColor,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         selected: _choiceChipIndex == index,
//       ),
//     );
//   }

//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       actionsIconTheme: IconThemeData(
//         color: kPrimaryColor,
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(
//             Icons.close,
//             color: kPrimaryColor,
//           ),
//           onPressed: () {
//             Get.defaultDialog(
//               title: '',
//               content: Text('취소하시겠습니까?'),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   child: Text('취소'),
//                 ),
//                 TextButton(
//                   onPressed: () async {
//                     Get.back();
//                     await Future.delayed(Duration(milliseconds: 100));
//                     Get.back();
//                   },
//                   child: Text('확인'),
//                 ),
//               ],
//             );
//           },
//         ),
//       ],
//       title: Text(
//         '별 충전하기',
//         style: TextStyle(
//           // color: kBlackColor,
//           fontSize: 15.sp,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }
