import 'dart:convert';

import 'package:the_dog_myapp/common/exception.dart';
import 'package:the_dog_myapp/data/models/the_dog_model.dart';
import 'package:http/http.dart' as http;

abstract class TheDogRemoteDataSource {
  Future<List<TheDogModel>> getTheDogs();
}

class TheDogRemoteDataSourceImpl implements TheDogRemoteDataSource {
  final http.Client client;

  static const apiKey =
      'api_key=live_9Iz3Jx25C7HzwU5TlOjosmaxiD4ByY6YjjHaqZC33avJiOkq7jyKNXURX545vxDn';
  static const baseURL = "https://api.thedogapi.com/";

  TheDogRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TheDogModel>> getTheDogs() async {
    final response = await client.get(Uri.parse(
        '$baseURL/v1/images/search?size=full&page=0&limit=10&has_breeds=true&include_breeds=true?$apiKey'));
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> data = json.decode(response.body);
      List<TheDogModel> dogs =
          data.map((json) => TheDogModel.fromJson(json)).toList();
      print(dogs[0].breeds);
      return dogs;
    } else {
      throw ServerException();
    }
  }
}
