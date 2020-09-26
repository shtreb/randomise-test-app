import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:randomiser/domain/cases/navigation.dart';
import 'package:randomiser/presenter/ui/widgets/list-widget.dart';
import 'package:randomiser/generated/i18n.dart';

class MainList extends StatelessWidget {

  @override Widget build(BuildContext context) => WillPopScope(
    onWillPop: () async => false,
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).titleMainScreen),
      ),
      body: ListWidget(
        onTap: (int position) {
          Navigation.navigateToDetailList(context, position);
        }, isDetail: false,
      ),
    ),
  );

}