import 'dart:developer';
import 'dart:math';

import 'package:eviobeta/api_provider/evio_api_provider.dart';
import 'package:eviobeta/models/parking_number_plate_model.dart';
import 'package:eviobeta/policy/price_policy.dart';
import 'package:eviobeta/screens/common/global_popup.dart';
import 'package:eviobeta/screens/widget/plate_model_widget.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common_import.dart';
import '../util.dart';
import 'widget/custom_slider_thumb_rect.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

// final List<String> fontListFull = GoogleFonts.asMap().keys.toList();
final List<String> fontList = [
  // 'Abril Fatface',
  'Alata',
  // 'Alatsi',
  // 'Alfa Slab One',
  // 'Amaranth',
  // 'Archivo Black',
  // 'Audiowide',
  // 'Balsamiq Sans',
  // 'Bellota Text',
  // 'Bigshot One',
  'Black Han Sans',
  // 'Black Ops One',
  // 'Bowlby One SC',
  // 'Bungee',
  // 'Cabin',
  // 'Candal',
  // 'Capriola',
  // 'Changa One',
  // 'Coiny',
  // 'Covered By Your Grace',
  // 'Croissant One',
  // 'Damion',
  // 'DM Serif Display',
  'DM Serif Text',
  // 'Do Hyeon',
  // 'Electrolize',
  // 'Finger Paint',
  // 'Fontdiner Swanky',
  // 'Fredoka One',
  // 'Fugaz One',
  // 'Gugi',
  // 'Happy Monkey',
  // 'Headland One',
  // 'Hind',
  // 'Inknut Antiqua',
  // 'Itim',
  // 'Jost',
  // 'Jua',
  // 'Kumar One',
  // 'Lacquer',
  // 'Leckerli One',
  // 'Lemon',
  // 'Libre Baskerville',
  // 'Limelight',
  // 'Nanum Gothic',
  // 'Nanum Pen Script',
  'Noto Sans',
  // 'Noto Serif',
  // 'Pacifico',
  'Poppins',
];

// final List<DropdownMenuItem<String>> fontWidgetList = GoogleFonts.asMap()
// .keys
// .map((e) => DropdownMenuItem<String>(
//       child: Text(e, style: styleDropDownText),
//       value: e,
//     ))
// .toList();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ParkingNumberPlateModel product = ParkingNumberPlateModel();
  int activePageIndex = 0;
  TextEditingController? titleEditingController;
  TextEditingController? subtitleEditingController;
  PageController pageController = PageController();

  @override
  void initState() {
    titleEditingController = TextEditingController(text: product.title);
    subtitleEditingController = TextEditingController(text: product.subtitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> controlPanels = [
      _shapeControlPanel(),
      _sizeControlPanel(),
      _titleControlPanel(),
      _fontControlPanel(),
      _colorControlPanel(),
    ];

    return GetBuilder(
      builder: (AppData appData) => Loading(
        child: Scaffold(
          appBar: AppBar(
            title: Image.asset(
              'assets/images/logo.png',
              width: 83.w,
              height: 17.h,
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: appBarIconGrey,
              ),
              onPressed: () {},
            ),
          ),
          backgroundColor: appBackgroundGrey,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 27.h,
                        left: 19.w,
                        right: 23.w,
                      ),
                      child: _topInfoBar(),
                    ),
                    SizedBox(
                      height: 300.h,
                      child: Center(
                        child: PlateModelWidget(product),
                      ),
                    ),
                  ],
                ),
                Container(
                  // height: 325.h,
                  width: Get.width,
                  color: white,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 29.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _tabChip(tabIndex: 0, label: '모양'),
                            _tabChip(tabIndex: 1, label: '사이즈'),
                            _tabChip(tabIndex: 2, label: '문구'),
                            _tabChip(tabIndex: 3, label: '폰트'),
                            _tabChip(tabIndex: 4, label: '색상'),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 10.h),
                          ExpandablePageView(
                            controller: pageController,
                            children: controlPanels,
                            animationDuration: Duration(milliseconds: 400),
                            animationCurve: Curves.easeInOut,
                            onPageChanged: (int i) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                activePageIndex = i;
                              });
                            },
                          ),
                          // AnimatedSize(
                          //   alignment: Alignment.topCenter,
                          //   duration: const Duration(milliseconds: 400),
                          //   curve: Curves.easeInOut,
                          //   child: ExpandablePageView(
                          //     controller: pageController,
                          //     children: controlPanels,
                          //     animationDuration: Duration(milliseconds: 1000),
                          //     onPageChanged: (int i) {
                          //       FocusScope.of(context).requestFocus(FocusNode());
                          //       setState(() {
                          //         activePageIndex = i;
                          //       });
                          //     },
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 19.w),
                            child: Divider(color: appDividerGrey, height: 24.h),
                          ),
                          SizedBox(height: 3.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: _imageSampler(),
                          ),
                          SizedBox(height: 15.h),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 68.h,
            color: appBottomGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 160.w,
                  height: 35.h,
                  child: ElevatedButton(
                    child: Text(
                      '다시 설정하기',
                      style: styleButtonReset,
                    ),
                    onPressed: () {
                      setState(() {
                        titleEditingController?.text = product.title;
                        subtitleEditingController?.text = product.subtitle;
                        product = ParkingNumberPlateModel();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: appButtonGrey,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.r),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  height: 35.h,
                  child: ElevatedButton(
                    child: Text(
                      '완료',
                      style: styleButtonReset,
                    ),
                    onPressed: () => _onSubmit(),
                    style: ElevatedButton.styleFrom(
                      primary: appBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.r),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSubmit() async {
    AppData appData = Get.find();
    appData.enterLoading();
    await Future.delayed(Duration(milliseconds: 1500));
    await evioApiProvider.postOrder(product: product);
    showCustomAlertTelevio('주문서가 정상적으로\n발송되었습니다.');
    appData.exitLoading();
  }

  Widget _imageSampler() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: (Get.width - 38.w) / 2,
          height: (Get.width - 38.w) / 2 / 1.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/sample2.png',
                  width: (Get.width - 38.w) / 2,
                  height: (Get.width - 38.w) / 2 / 1.2,
                  fit: BoxFit.cover,
                ),
                OverflowBox(
                  child: Align(
                    alignment: Alignment.center,
                    child: Transform(
                      // transform: Matrix4.identity()
                      //   ..scale(.5)
                      //   ..setEntry(3, 2, 0.001) // perspective
                      //   ..rotateX(-0.8)
                      //   ..rotateY(.3)
                      //   ..rotateZ(-0.1),
                      alignment: FractionalOffset.center,
                      transform:
                          Matrix4.translation(vector_math.Vector3(15.w, 0, 0))
                            ..scale(.52)
                            ..rotateX(pi / 4)
                            ..rotateY(0)
                            ..rotateZ(-pi / 6),
                      child: PlateModelWidget(
                        product,
                        hasShadow: true,
                        fixSize: Size(130, 30),
                        fontScale: 0.65,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8.w),
        SizedBox(
          width: (Get.width - 38.w) / 2,
          height: (Get.width - 38.w) / 2 / 1.2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/sample1.png',
                  width: (Get.width - 38.w) / 2,
                  height: (Get.width - 38.w) / 2 / 1.2,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Transform(
                    // transform: Matrix4.identity()
                    //   ..scale(.5)
                    //   ..setEntry(3, 2, 0.001) // perspective
                    //   ..rotateX(-0.8)
                    //   ..rotateY(.3)
                    //   ..rotateZ(-0.1),
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..scale(.44)
                      ..rotateX(pi / 5)
                      ..rotateY(-pi / 12)
                      ..rotateZ(-pi / 5),

                    child: PlateModelWidget(
                      product,
                      hasShadow: true,
                      fixSize: Size(130, 30),
                      fontScale: 0.65,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _colorControlPanel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 8,
        children: [
          _colorButton(
            asset: 'assets/images/color1.png',
            isSelcected: product.backgroundColor == deepBlue,
            onTap: () {
              setState(() {
                product.backgroundColor = deepBlue;
                product.textColor = white;
                product.backgroundAsset = null;
                product.material = 'deepBlue';
              });
            },
          ),
          SizedBox(width: 40.w, height: 40.w),
          _colorButton(
            asset: 'assets/images/color2.png',
            isSelcected: product.backgroundColor == blueGrey,
            onTap: () {
              setState(() {
                product.backgroundColor = blueGrey;
                product.textColor = white;
                product.backgroundAsset = null;
                product.material = 'blueGrey';
              });
            },
          ),
          SizedBox(width: 40.w, height: 40.w),
          _colorButton(
              asset: 'assets/images/color3.png',
              isSelcected: product.backgroundColor == black,
              onTap: () {
                setState(() {
                  product.backgroundColor = black;
                  product.textColor = white;
                  product.backgroundAsset = null;
                  product.material = 'black';
                });
              }),
          SizedBox(width: 40.w, height: 40.w),
          _colorButton(
            asset: 'assets/images/color4.png',
            isSelcected: product.backgroundColor == white,
            onTap: () {
              setState(() {
                product.backgroundColor = white;
                product.textColor = black;
                product.backgroundAsset = null;
                product.material = 'white';

              });
            },
          ),
          SizedBox(width: 40.w, height: 40.w),
          SizedBox(width: 40.w, height: 40.w),
          _colorButton(
            asset: 'assets/images/color5.png',
            isSelcected: product.backgroundAsset == 'assets/images/gold.png',
            onTap: () {
              setState(() {
                product.backgroundColor = null;
                product.textColor = black;
                product.backgroundAsset = 'assets/images/gold.png';
                product.material = 'gold';
              });
            },
          ),
          SizedBox(width: 40.w, height: 40.w),
          _colorButton(
            asset: 'assets/images/color6.png',
            isSelcected: product.backgroundAsset == 'assets/images/silver.png',
            onTap: () {
              setState(() {
                product.backgroundColor = null;
                product.textColor = black;
                product.backgroundAsset = 'assets/images/silver.png';
                product.material = 'silver';
              });
            },
          ),
          SizedBox(width: 40.w, height: 40.w),
          _colorButton(
            asset: 'assets/images/color7.png',
            isSelcected: product.backgroundAsset == 'assets/images/maple.png',
            onTap: () {
              setState(() {
                product.backgroundColor = null;
                product.textColor = textColorForWood;
                product.backgroundAsset = 'assets/images/maple.png';
                product.material = 'maple';
              });
            },
          ),
          SizedBox(width: 40.w, height: 40.w),
          _colorButton(
            asset: 'assets/images/color8.png',
            isSelcected: product.backgroundAsset == 'assets/images/oak.png',
            onTap: () {
              setState(() {
                product.backgroundColor = null;
                product.textColor = textColorForWood;
                product.backgroundAsset = 'assets/images/oak.png';
                product.material = 'oak';
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _colorButton({
    required String asset,
    required bool isSelcected,
    required GestureTapCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(asset, width: 40.w, height: 40.w),
    );
  }

  Widget _fontControlPanel() {
    double height1 = 40;
    double height2 = 20;
    double height3 = 40;
    double height4 = 20;

    return Row(
      children: [
        SizedBox(width: 32.w),
        SizedBox(
          width: 68.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height1,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('전화번호', style: styleSizeLabel)),
              ),
              // SizedBox(height: height2),
              Visibility(
                visible: (product.plateSubtitlePosition ==
                        PlateSubtitlePosition.none) ==
                    false,
                child: SizedBox(
                  height: height3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '추가 텍스트',
                      style: styleSizeLabel,
                    ),
                  ),
                ),
              ),
              // Visibility(
              //   visible: (product.plateSubtitlePosition ==
              //           PlateSubtitlePosition.none) ==
              //       false,
              //   child: SizedBox(height: height4),
              // ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: height1,
                child: Center(
                  child: SizedBox(
                    height: 30.h,
                    child: _fontDropdown(
                      value: product.fontTitle,
                      onChanged: (value) => setState(
                        () {
                          if (value != null) {
                            product.fontTitle = value;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: height2,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       _fontSizeButton(
              //         iconData: Icons.add,
              //         onPressed: () => setState(() => product.titleSize += .5),
              //       ),
              //       SizedBox(width: 3.w),
              //       _fontSizeButton(
              //         iconData: Icons.remove,
              //         onPressed: () => setState(() => product.titleSize -= .5),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 10.h),
              Visibility(
                visible: (product.plateSubtitlePosition ==
                        PlateSubtitlePosition.none) ==
                    false,
                child: SizedBox(
                  height: height3,
                  child: Center(
                    child: SizedBox(
                      height: 30.h,
                      child: _fontDropdown(
                        value: product.fontSubtitle,
                        onChanged: (value) => setState(
                          () {
                            if (value != null) {
                              product.fontSubtitle = value;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Visibility(
              //   visible: (product.plateSubtitlePosition ==
              //           PlateSubtitlePosition.none) ==
              //       false,
              //   child: SizedBox(
              //     height: height4,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         _fontSizeButton(
              //           iconData: Icons.add,
              //           onPressed: () =>
              //               setState(() => product.subtitleSize += .5),
              //         ),
              //         SizedBox(width: 3.w),
              //         _fontSizeButton(
              //           iconData: Icons.remove,
              //           onPressed: () =>
              //               setState(() => product.subtitleSize -= .5),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(width: 40.w),
      ],
    );
  }

  Widget _fontDropdown({
    required String value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        ),
        selectedItemBuilder: (BuildContext context) {
          return fontList
              .map((e) => DropdownMenuItem<String>(
                    child: Text(e, style: styleTextField),
                    value: e,
                  ))
              .toList();
        },
        dropdownColor: black,
        style: styleTextField,
        value: value,
        items: fontList
            .map((e) => DropdownMenuItem<String>(
                  child: Text(e, style: styleDropDownText),
                  value: e,
                ))
            .toList(),
        onChanged: onChanged);
  }

  SizedBox _fontSizeButton({
    required IconData iconData,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 19.w,
      height: 16.h,
      child: TextButton(
        onPressed: onPressed,
        child: Icon(
          iconData,
          size: 13.h,
          color: appBlue,
        ),
        style: TextButton.styleFrom(
          primary: appBlue,
          backgroundColor: appSkyblue,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Widget _titleControlPanel() {
    double height1 = 40;
    double height2 = 76;
    double height3 = 40;

    return Row(
      children: [
        SizedBox(width: 32.w),
        SizedBox(
          width: 68.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height1,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('전화번호', style: styleSizeLabel)),
              ),
              SizedBox(
                height: height2,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('타입', style: styleSizeLabel)),
              ),
              Visibility(
                visible: (product.plateSubtitlePosition ==
                        PlateSubtitlePosition.none) ==
                    false,
                child: SizedBox(
                  height: height3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '추가 텍스트',
                      style: styleSizeLabel,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: height1,
                child: Center(
                  child: SizedBox(
                    height: 28.h,
                    child: TextField(
                      style: styleTextField,
                      controller: titleEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                        hintText: 'Enter your Number',
                        hintStyle: styleTextFieldHint,
                      ),
                      onChanged: (value) {
                        setState(() {
                          product.title =
                              titleEditingController?.text ?? product.title;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      _subtitlePositionButton(
                        selectedAsset: 'assets/images/none_select.png',
                        unselectedAsset: 'assets/images/none_unselect.png',
                        isSelected: product.plateSubtitlePosition ==
                            PlateSubtitlePosition.none,
                        onTap: () => setState(() =>
                            product.plateSubtitlePosition =
                                PlateSubtitlePosition.none),
                      ),
                      SizedBox(width: 10.w),
                      _subtitlePositionButton(
                        selectedAsset: 'assets/images/top_select.png',
                        unselectedAsset: 'assets/images/top_unselect.png',
                        isSelected: product.plateSubtitlePosition ==
                            PlateSubtitlePosition.top,
                        onTap: () => setState(() => product
                            .plateSubtitlePosition = PlateSubtitlePosition.top),
                      ),
                      SizedBox(width: 10.w),
                      _subtitlePositionButton(
                        selectedAsset: 'assets/images/bottom_select.png',
                        unselectedAsset: 'assets/images/bottom_unselect.png',
                        isSelected: product.plateSubtitlePosition ==
                            PlateSubtitlePosition.bottom,
                        onTap: () => setState(() =>
                            product.plateSubtitlePosition =
                                PlateSubtitlePosition.bottom),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: (product.plateSubtitlePosition ==
                        PlateSubtitlePosition.none) ==
                    false,
                child: SizedBox(
                  height: height3,
                  child: Center(
                    child: SizedBox(
                      height: 28.h,
                      child: TextField(
                        style: styleTextField,
                        controller: subtitleEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.w),
                        ),
                        onChanged: (value) {
                          setState(() {
                            product.subtitle =
                                subtitleEditingController?.text ??
                                    product.subtitle;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 40.w),
      ],
    );
  }

  Widget _subtitlePositionButton({
    required String unselectedAsset,
    required String selectedAsset,
    required bool isSelected,
    required GestureTapCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        isSelected ? selectedAsset : unselectedAsset,
        width: 57.w,
        height: 48.h,
      ),
    );
  }

  Widget _sizeControlPanel() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 30.w),
            Text('가로', style: styleSizeLabel),
            SizedBox(width: 10.w),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: appBlue,
                  inactiveTrackColor: appSliderGrey,
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 1.5.h,
                  thumbShape: CustomSliderThumbRect(
                    thumbRadius: 20.h,
                    thumbHeight: 30.h,
                    min: 90,
                    max: 150,
                  ),
                  // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: white,
                  overlayColor: appBlue.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 6.r),
                  tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 4.h),
                  activeTickMarkColor: appBlue,
                  inactiveTickMarkColor: appSliderGrey,
                  showValueIndicator: ShowValueIndicator.never,
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: white,
                  valueIndicatorTextStyle: TextStyle(color: appBlue),
                ),
                child: Slider(
                  min: 90,
                  max: 150,
                  divisions: 5,
                  label: '${product.width}mm',
                  value: product.width,
                  onChanged: (value) => setState(() => product.width = value),
                ),
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
        SizedBox(height: 22.h),
        Row(
          children: [
            SizedBox(width: 30.w),
            Text('세로', style: styleSizeLabel),
            SizedBox(width: 10.w),
            Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: appBlue,
                  inactiveTrackColor: appSliderGrey,
                  trackShape: RoundedRectSliderTrackShape(),
                  trackHeight: 1.5.h,
                  thumbShape: CustomSliderThumbRect(
                    thumbRadius: 20.h,
                    thumbHeight: 30.h,
                    min: 30,
                    max: 90,
                  ),
                  // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  thumbColor: white,
                  // overlayColor: appBlue.withAlpha(32),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 6.r),
                  tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 4.h),
                  activeTickMarkColor: appBlue,
                  inactiveTickMarkColor: appSliderGrey,
                  showValueIndicator: ShowValueIndicator.never,
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorColor: white,
                  valueIndicatorTextStyle: TextStyle(color: appBlue),
                ),
                child: Slider(
                  min: 30,
                  max: 90,
                  divisions: 6,
                  label: '${product.height}mm',
                  value: product.height,
                  onChanged: (value) => setState(() => product.height = value),
                ),
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ],
    );
  }

  Widget _shapeControlPanel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _shapeChip(chipShape: PlateShape.rect),
        _shapeChip(chipShape: PlateShape.halfRoundRect),
        _shapeChip(chipShape: PlateShape.fullRoundRect),
      ],
    );
  }

  Widget _shapeChip({
    required PlateShape chipShape,
  }) {
    String asset = '';
    String label = '';
    bool selected = (product.shape == chipShape);

    if (chipShape == PlateShape.rect) {
      label = '각진형';
      asset = 'assets/images/shape_rect.png';
    } else if (chipShape == PlateShape.halfRoundRect) {
      label = '둥근형';
      asset = 'assets/images/shape_half_round.png';
    } else {
      label = '타원형';
      asset = 'assets/images/shape_full_round.png';
    }

    return Container(
      width: 95.w,
      height: 80.h,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            product.shape = chipShape;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(asset),
              color: selected ? appBlue : appBarIconGrey,
              size: 48.w,
            ),
            Text(
              label,
              style: selected ? styleShapeSelected : styleShapeUnselected,
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(
          primary: appBlue,
          backgroundColor: selected ? null : appDividerGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.0),
          ),
        ),
      ),
    );
  }

  ConstrainedBox sample() {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Center(
        child: Text("Place Bid"),
      ),
    );
  }

  Widget _tabChip({
    required String label,
    required int tabIndex,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: ChoiceChip(
        elevation: 0,
        pressElevation: 0,
        label: Text(
          label,
          style: activePageIndex == tabIndex
              ? styleTabLabelSelected
              : styleTabLabel,
        ),
        // selected: activePageIndex == tabIndex,
        selected: true,
        onSelected: (value) {
          if ((activePageIndex - tabIndex).abs() > 1) {
            pageController.jumpToPage(tabIndex);
          } else {
            // pageController.jumpToPage(tabIndex);
            pageController.animateToPage(tabIndex,
                duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          }
          setState(() {
            activePageIndex = tabIndex;
          });
        },
        backgroundColor: Colors.transparent,
        disabledColor: Colors.transparent,
        shadowColor: Colors.transparent,
        selectedShadowColor: Colors.transparent,
        selectedColor:
            activePageIndex == tabIndex ? appSkyblue : Colors.transparent,
      ),
    );
  }

  Widget _topInfoBar() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Parking Number Plate', style: styleProductName),
            Text('${product.width} x ${product.height}mm',
                style: styleProductSize),
          ],
        ),
        const Spacer(),
        // Container(
        //   child: Text(
        //     '-6%',
        //     style: styleDiscountRate,
        //   ),
        //   padding: EdgeInsets.only(
        //     left: 5.w,
        //     right: 5.w,
        //     bottom: 2.h,
        //   ),
        //   decoration: BoxDecoration(
        //     border: Border.all(color: appBlue),
        //     borderRadius: BorderRadius.circular(100.r),
        //   ),
        // ),
        // SizedBox(width: 6.w),
        // Text('6,900원', style: stylePriceOriginal),
        SizedBox(width: 6.w),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(commaStringFromInt(pricePolicy.getPrice(product)),
                style: stylePriceDiscountedNumber),
            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: Text('원', style: stylePriceDiscountedWon),
            ),
          ],
        ),
      ],
    );
  }
}

get styleProductName => TextStyle(fontSize: 9.sp, color: black);
get styleProductSize => TextStyle(fontSize: 9.sp, color: appTextGrey);
get styleDiscountRate => TextStyle(fontSize: 10.sp, color: appBlue);
get stylePriceOriginal => TextStyle(
      fontSize: 12.sp,
      color: appTextGrey,
      decoration: TextDecoration.lineThrough,
    );
get stylePriceDiscountedNumber =>
    TextStyle(fontSize: 22.sp, color: black, fontWeight: FontWeight.bold);
get stylePriceDiscountedWon => TextStyle(fontSize: 15.sp, color: black);
get styleTabLabel =>
    TextStyle(fontSize: 13.sp, color: black, fontWeight: FontWeight.w500);
get styleTabLabelSelected =>
    TextStyle(fontSize: 13.sp, color: appBlue, fontWeight: FontWeight.w500);
get styleTabSubcategory => TextStyle(fontSize: 12.sp, color: black);
get styleButtonReset =>
    TextStyle(fontSize: 14.sp, color: white, fontWeight: FontWeight.bold);
get styleButtonSubmit =>
    TextStyle(fontSize: 14.sp, color: white, fontWeight: FontWeight.bold);
get styleShapeSelected =>
    TextStyle(fontSize: 13.sp, color: appBlue, fontWeight: FontWeight.bold);
get styleShapeUnselected => TextStyle(fontSize: 13.sp, color: appBarIconGrey);
get styleSizeLabel => TextStyle(fontSize: 12.sp, color: black);
get styleTextField => TextStyle(fontSize: 12.sp, color: black);
get styleTextFieldHint => TextStyle(fontSize: 10.sp, color: appTextGrey);
get styleDropDownText => TextStyle(fontSize: 10.sp, color: white);
