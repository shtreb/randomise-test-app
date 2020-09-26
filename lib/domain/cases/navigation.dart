import 'package:flutter/material.dart';

import 'package:randomiser/domain/cases/routes/dialog-route.dart';
import 'package:randomiser/presenter/ui/screens/detail-list.dart';

class Navigation {
  static void navigateToDetailList(BuildContext context, int currentPosition) {
    Navigator.of(context).push(DialogRoute(
      DetailList(currentPosition),
    ));
  }
}