import 'dart:async';

import 'package:randomiser/main.dart';
import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/presenter/presenters/list-presenter.dart';

class ListController extends ListInformationPresenter {

  StreamController<List<Friend>> _streamInfoCtrl;
  StreamSubscription<List<Friend>> _streamInfoSubscription;

  @override Stream<List<Friend>> get streamInfo => _streamInfoCtrl.stream;

  ListController(ListInformationView view) : super(view) {
    _streamInfoCtrl = StreamController<List<Friend>>();
    _streamInfoSubscription = infoService.infoStream.listen(
        (List<Friend> friends) => _streamInfoCtrl.add(friends),
        onError: (e) => _streamInfoCtrl.addError(e));

    loadCurrentItems();
  }

  @override void loadCurrentItems() => infoService.loadCurrentInformation();
  @override void loadNextItems() => infoService.loadNextItems();

  @override destroy() {
    if(_streamInfoCtrl != null && !_streamInfoCtrl.isClosed)
      _streamInfoCtrl.close();
    if(_streamInfoSubscription != null)
      _streamInfoSubscription.cancel();
  }



}