import 'dart:developer';

import 'package:eviobeta/models/parking_number_plate_model.dart';

/*
그리고 사이즈 별로 가격은

가로 130mm*30mm 6900원 기준
가로 사이즈 1칸 변경시 200원 
세로 사이즈 1칸 변경시 500원 

메이플원목선택시 1000원추가
화이트오크원목선택시 1500원추가

이렇게 잡았는데 이해가 되시나요??
*/

PricePolicy pricePolicy = PricePolicy();

class PricePolicy {
  final defaultPrice = 6900;
  final heightPrice = 500;
  final widthPrice = 200;
  final maplePrice = 1000;
  final oakPrice = 1500;

  final defaultHeight = 30;
  final defaultWidth = 130;
  final sizeUnit = 10;

  int getPrice(ParkingNumberPlateModel product) {
    int sizePrice = 0;
    int colorPrice = 0;

    if (product.height - defaultHeight > 0) {
      sizePrice += (product.height - defaultHeight) ~/ sizeUnit * heightPrice;
    }
    if (product.width - defaultWidth > 0) {
      sizePrice += (product.width - defaultWidth) ~/ sizeUnit * widthPrice;
    }

    if ((product.backgroundColor == null) &&
        (product.backgroundAsset == 'assets/images/oak.png')) {
      colorPrice += oakPrice;
    } else if ((product.backgroundColor == null) &&
        (product.backgroundAsset == 'assets/images/maple.png')) {
      colorPrice += maplePrice;
    }

    log('size price $sizePrice');
    log('color price $colorPrice');

    return defaultPrice + sizePrice + colorPrice;
  }
}
