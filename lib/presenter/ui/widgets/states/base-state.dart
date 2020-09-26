import 'package:flutter/material.dart';

import 'package:randomiser/presenter/presenters/base-presenter.dart';

abstract class BaseState<T extends StatefulWidget, K extends BasePresenter>
  extends State<T>
{
  K presenter;

  onDestroy();

  @override void dispose() {
    presenter?.destroy();
    onDestroy();
    super.dispose();
  }
}