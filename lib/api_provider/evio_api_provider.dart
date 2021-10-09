import 'dart:developer';

import 'package:eviobeta/common_import.dart';
import 'package:eviobeta/models/parking_number_plate_model.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

EvioApiProvider evioApiProvider = EvioApiProvider();

class EvioApiProvider {
  postOrder({
    required ParkingNumberPlateModel product,
  }) async {
    final http.Response response = await http.post(
      Uri.parse('http://3.36.119.26/api/v1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: product.toJson().toString(),
      body: jsonEncode(<String, Object>{"JSON": product}),
    );
    log(response.body.toString());
  }
}
