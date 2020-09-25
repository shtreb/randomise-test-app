import 'dart:async';

import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/main.dart';

typedef OnListUpdate = void Function(dynamic items);
typedef OnError = void Function(Exception error);

class InfoService {

  StreamController<dynamic> _streamInfoCtrl;
  StreamController<Exception> _streamException;

  Stream<dynamic> get infoStream => _streamInfoCtrl.stream;
  Stream<dynamic> get exceptionStream => _streamException.stream;

  InfoService() {
    _streamInfoCtrl = StreamController<dynamic>.broadcast();
    _streamException = StreamController<Exception>.broadcast();
  }

  void updateInformation() async {
    try {
      List<Friend> res = await gateway.loadFromServerList();
      if(!_streamInfoCtrl.isClosed) _streamInfoCtrl.add(res);
    } catch(e) {
      if(!_streamException.isClosed) _streamException.add(e);
    }
  }

  dispose() {
    if(_streamInfoCtrl != null && !_streamInfoCtrl.isClosed)
      _streamInfoCtrl.close();
    if(_streamException != null && !_streamException.isClosed)
      _streamException.close();
  }

}