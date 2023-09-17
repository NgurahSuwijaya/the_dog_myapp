import 'dart:convert';

import 'package:the_dog_myapp/common/exception.dart';
import 'package:the_dog_myapp/data/models/favourite_model.dart';
import 'package:the_dog_myapp/data/models/response_model.dart';
import 'package:the_dog_myapp/data/models/the_dog_model.dart';
import 'package:http/http.dart' as http;

abstract class TheDogRemoteDataSource {
  Future<List<TheDogModel>> getTheDogs();
  Future<TheDogModel> getTheDogDetail(String id);
  Future<ResponseModel> postTheDogFav(String id);
  Future<List<FavouriteModel>> getTheDogFav();
}

class TheDogRemoteDataSourceImpl implements TheDogRemoteDataSource {
  final http.Client client;

  static const apiKey =
      'live_9Iz3Jx25C7HzwU5TlOjosmaxiD4ByY6YjjHaqZC33avJiOkq7jyKNXURX545vxDn';
  static const baseURL = "https://api.thedogapi.com";

  TheDogRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TheDogModel>> getTheDogs() async {
    final response = await client.get(Uri.parse(
        '$baseURL/v1/images/search?size=full&page=0&limit=10&has_breeds=true&include_breeds=true&api_key=$apiKey'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<TheDogModel> dogs =
          data.map((json) => TheDogModel.fromJson(json)).toList();
      return dogs;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TheDogModel> getTheDogDetail(String id) async {
    final response =
        await client.get(Uri.parse('$baseURL/v1/images/$id'), headers: {
      'x-api-key': apiKey,
    });
    if (response.statusCode == 200) {
      return TheDogModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ResponseModel> postTheDogFav(String id) async {
    final response = await client.post(
      Uri.parse('$baseURL/v1/favourites?'),
      headers: {
        'x-api-key': apiKey,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'image_id': id}),
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FavouriteModel>> getTheDogFav() async {
    final response = await client.get(
        Uri.parse('$baseURL/v1/favourites?attach_image=true&api_key=$apiKey'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<FavouriteModel> fav =
          data.map((e) => FavouriteModel.fromJson(e)).toList();
      print(response.statusCode);
      return fav;
    } else {
      throw ServerException();
    }
  }
}
