import 'package:randomiser/data/server/server-api.dart';

class Gateway {

  ServerApi _api;

  Gateway(String baseApi) {
    _api = ServerApi(baseApi);
  }

  Future<dynamic> loadFromServerList() {

  }

}