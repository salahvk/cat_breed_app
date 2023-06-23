String endPoint = "https://api.thecatapi.com/v1";

String apikey =
    "live_DScDP7zlysg1iS0C6CtBFDnB5BZqMxck5WM1vQ4UlfDs6yjM4x8lQO95cwtqWwv1";

class ApiEndPoint {
  static String images = "$endPoint/images/search?limit=10&api_key=$apikey";
  static String breed = "$endPoint/breeds";
  static String breedDetails = "$endPoint/images/search?limit=10&breed_ids=";
}
