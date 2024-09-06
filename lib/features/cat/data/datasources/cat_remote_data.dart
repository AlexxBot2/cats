import 'dart:convert';

import 'package:cats/core/errors/exceptions.dart';
import 'package:cats/core/network/network_info.dart';
import 'package:cats/features/cat/data/models/cat.dart';
import 'package:cats/injections.dart';
import 'package:http/http.dart' as http;

abstract class CatRemoteData {
  Future<List<Cat>> getList();
}

class CatRemoteDataImpl extends CatRemoteData {
  late final http.Client client;

  CatRemoteDataImpl({required this.client});
  @override
  Future<List<Cat>> getList() async {
    final uri = Uri.parse(sl<NetworkInfo>().url);
    final response = await client.get(uri).timeout(const Duration(seconds: 5), onTimeout: () => throw TimeOutException);

    if(response.statusCode == 200) {
      final catListJson = jsonDecode(response.body);
      final catList = (catListJson as List).map((catJson) => Cat.fromJson(catJson)).toList();
      return catList;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }

}