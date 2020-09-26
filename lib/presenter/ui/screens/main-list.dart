import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:randomiser/domain/cases/navigation.dart';
import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/presenter/ui/widgets/list-widget.dart';

class MainList extends StatelessWidget {

  @override Widget build(BuildContext context) => WillPopScope(
    onWillPop: () async => false,
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MainLib'),
      ),
      body: ListWidget(
        onTap: (int position) {
          Navigation.navigateToDetailList(context, position);
        }, isDetail: false,
      ),
    ),
  );

}