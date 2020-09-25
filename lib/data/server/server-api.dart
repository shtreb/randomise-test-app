import 'package:http/http.dart';

class ServerApi {

  final int _timeout = 10;

  Client _client;
  String _baseApi;

  ServerApi(this._baseApi) :
        assert(_baseApi != null && _baseApi.isEmpty, -1000),
        assert(_baseApi.contains('http') || _baseApi.contains('https'), -1001)
  {
    _client = Client();
  }

  dynamic loadInformation() async {
    Response response = await _client.get(_baseApi+'api?results=10').timeout(Duration(seconds: _timeout));
    String body = response.body;
    return body;
  }

}