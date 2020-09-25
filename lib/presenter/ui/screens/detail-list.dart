import 'package:flutter/material.dart';

import 'package:randomiser/presenter/ui/widgets/list-widget.dart';

class DetailList extends StatelessWidget {

  @override Widget build(BuildContext context) => WillPopScope(
    onWillPop: () async => false,
    child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MainLib'),
      ),
      body: ListWidget(
          onTap: () {

          }
      ),
    ),
  );

}