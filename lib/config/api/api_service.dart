import 'dart:convert';

import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dioRick;
  final Dio _dioPluto;
  ApiServices()
      : _dioRick =
            Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api/')),
        _dioPluto = Dio(
            BaseOptions(baseUrl: 'https://api4pluto.dudewhereismy.com.mx/', headers: {'Content-Type': 'application/json'},validateStatus: (status) =>  true,
            ));

  Future<Response> getRick({required String path}) async {
    return await _dioRick.get(path);
  }

  Future<bool> postPluto(
      {String path = 'rickandmorty',required Map<String, dynamic> data}) async {
    try {
      final resp = await _dioPluto.post(path, data: jsonEncode(data), );
      print(resp.data);

      return (resp.statusCode == 200) ? true : false;
    } catch (e) {
      return false;
    }
  }
}
