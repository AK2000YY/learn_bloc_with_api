import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_bloc_with_api/core/constants/server_routes.dart';

class CharactersWebService {

  late Dio dio;

  CharactersWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: ServerRoute.baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacter() async {
    try {
      Response response = await dio.get(ServerRoute.allCharacters);
      return response.data['characters'];
    } catch(e) {
      print("Ak2000YY");
      print(e);
      return [];
    }
  }
}