import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:randomiser/domain/entity/exceptions.dart';
import 'package:randomiser/main.dart';
import 'package:randomiser/domain/entity/friend.dart';

typedef OnListUpdate = void Function(dynamic items);
typedef OnError = void Function(Exception error);

class InfoService {

  StreamController<List<Friend>> _streamInfoCtrl;

  Stream<List<Friend>> get infoStream => _streamInfoCtrl.stream;

  List<Friend> _friends = [];

  InfoService() {
    _streamInfoCtrl = StreamController<List<Friend>>.broadcast();
  }

  void loadCurrentInformation() {
    if(!_streamInfoCtrl.isClosed) _streamInfoCtrl.add(_friends);
  }

  void loadNextItems() async {
    try {
      List<Friend> res = await gateway.loadFromServerList();
      _friends.addAll(res);
      loadCurrentInformation();
    } catch (e) {
      if(!_streamInfoCtrl.isClosed)
        _streamInfoCtrl.addError(CustomException(data: _friends, exception: e));
    }
  }

  dispose() {
    if(_streamInfoCtrl != null && !_streamInfoCtrl.isClosed)
      _streamInfoCtrl.close();
  }

}