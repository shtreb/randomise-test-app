import 'package:flutter/material.dart';

import 'package:randomiser/main.dart';
import 'package:randomiser/domain/cases/controllers/list-controller.dart';
import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/presenter/presenters/list-presenter.dart';

typedef OnTap = void Function();

class ListWidget extends StatefulWidget {

  final OnTap onTap;
  final bool isDetail;

  ListWidget({
    @required this.onTap,
    @required this.isDetail,
  });

  @override _ListWidgetState createState() => _ListWidgetState();

}

class _ListWidgetState extends State<ListWidget> implements ListInformationView {

  ListInformationPresenter presenter;

  @override void initState() {
    presenter = ListController(this);
    super.initState();
  }

  @override Widget build(BuildContext context) {
    return StreamBuilder(
      stream: infoService.infoStream,
      builder: (BuildContext ctx, AsyncSnapshot<List<Friend>> snapshot) {
        if(snapshot.data == null) return SizedBox.shrink();
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data.length + 1,
          itemBuilder: (BuildContext _ctx, int pos) {
            if(pos == snapshot.data.length) return Container(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(),
            );
            debugPrint('create: $pos');
            if(pos == snapshot.data.length -1)
              infoService.updateInformation();
            return Text(snapshot.data[pos].phone);
          }
        );
      },
    );
  }



}