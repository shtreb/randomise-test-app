import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/data/server/server-api.dart';

class Gateway {

  ServerApi _api;

  Gateway(String baseApi) {
    _api = ServerApi(baseApi);
  }

  Future<List<Friend>> loadFromServerList() => _api.loadInformation();

}