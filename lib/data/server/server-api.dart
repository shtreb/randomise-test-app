import 'dart:convert';

import 'package:http/http.dart';

import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/domain/entity/exceptions.dart';

class ServerApi {

  final int _timeout = 10;

  Client _client;
  String _baseApi;

  ServerApi(this._baseApi) :
        assert(_baseApi != null && _baseApi.isNotEmpty, -1000),
        assert(_baseApi.contains('http') || _baseApi.contains('https'), -1001)
  {
    _client = Client();
  }

  Future<List<Friend>> loadInformation() async {
    Response response = await _client.get(_baseApi+'api?results=10').timeout(Duration(seconds: _timeout));
    return Friend.fromListJson(handleResponse(response));
  }

  dynamic handleResponse(Response response) {
    if(response.statusCode < 200 && response.statusCode >= 300) {
      return ApiException(code: response.statusCode, mess: response.body ?? '-1');
    }
    String body = response.body ?? '';
    if(body.isEmpty) return [];
    try {
      dynamic _json = json.decode(body);
      if(_json == null
          || _json['results'] == null
          || !(_json['results'] is List)
          || (_json['results'] as List).isEmpty) return [];
      return _json['results'];
    } catch(e) {
      throw ParseException();
    }
  }

}