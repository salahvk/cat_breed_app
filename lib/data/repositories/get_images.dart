// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:cat_breed_app/data/endpoint.dart';
import 'package:cat_breed_app/data/models/cat_image_model.dart';
import 'package:cat_breed_app/data/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

getImages(BuildContext context) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(
      Uri.parse(ApiEndPoint.images),
    );
    print(ApiEndPoint.images);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log(response.body);
      final catImagesList =
          List<CatImages>.from(jsonResponse.map((x) => CatImages.fromJson(x)));
      provider.getCatImages(catImagesList);
    } else {
      log("Something Went Wrong");
    }
  } on Exception catch (e) {
    log("Something Went Wrong1");
    print(e.toString().contains("Failed host lookup"));
  }
}

getBreedImages(BuildContext context, id) async {
  final provider = Provider.of<DataProvider>(context, listen: false);
  try {
    var response = await http.get(
      Uri.parse("${ApiEndPoint.breedDetails}$id"),
    );

    print("${ApiEndPoint.breedDetails}$id");
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log(response.body);
      final catBreedImagesList =
          List<CatImages>.from(jsonResponse.map((x) => CatImages.fromJson(x)));
      provider.getCatBreedImages(catBreedImagesList);
    } else {
      log("Something Went Wrong");
    }
  } on Exception catch (e) {
    log("Something Went Wrong1");
    print(e.toString().contains("Failed host lookup"));
  }
}
