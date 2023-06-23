import 'package:cat_breed_app/data/models/cat_breed_model.dart';
import 'package:cat_breed_app/data/models/cat_image_model.dart';
import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {
  List<CatImages>? catImages;
  List<CatImages>? catBreedImages;
  List<CatBreedModel>? catBreed;

  void getCatImages(value) {
    catImages = value;
    notifyListeners();
  }

  void getCatBreedImages(value) {
    catBreedImages = value;
    notifyListeners();
  }

  void getCatBreed(value) {
    catBreed = value;
    notifyListeners();
  }
}
