import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/presenter/presenters/base-presenter.dart';

abstract class ListInformationPresenter extends BasePresenter {

  ListInformationView view;

  Stream<List<Friend>> get streamInfo;

  ListInformationPresenter(this.view, {
    Friend friend
  }) : super(view);

  void loadNextItems();
}

abstract class ListInformationView extends BaseView {

}