import 'dart:async';

import 'package:randomiser/main.dart';
import 'package:randomiser/domain/entity/friend.dart';

typedef OnListUpdate = void Function(dynamic items);
typedef OnError = void Function(Exception error);

class InfoService {

  StreamController<List<Friend>> _streamInfoCtrl;
  StreamController<Exception> _streamException;

  Stream<List<Friend>> get infoStream => _streamInfoCtrl.stream;
  Stream<dynamic> get exceptionStream => _streamException.stream;

  List<Friend> _friends = [];

  InfoService() {
    _streamInfoCtrl = StreamController<List<Friend>>.broadcast();
    _streamException = StreamController<Exception>.broadcast();
  }

  void updateInformation() async {
    try {
      List<Friend> res = await gateway.loadFromServerList();
      _friends.addAll(res);
      if(!_streamInfoCtrl.isClosed) _streamInfoCtrl.add(_friends);
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