// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:cat_breed_app/data/endpoint.dart';
import 'package:cat_breed_app/data/models/cat_breed_model.dart';
import 'package:cat_breed_app/data/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

getBreed(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(
      Uri.parse(ApiEndPoint.breed),
    );

    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log(response.body);
      final breedList = List<CatBreedModel>.from(
          jsonResponse.map((x) => CatBreedModel.fromJson(x)));
      provider.getCatBreed(breedList);
    } else {
      log("Something Went Wrong");
    }
  } on Exception catch (e) {
    log("Something Went Wrong1");
    print(e.toString().contains("Failed host lookup"));
  }
}
