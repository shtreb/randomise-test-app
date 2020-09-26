import 'dart:async';

import 'package:flutter/material.dart';

import 'package:randomiser/domain/cases/controllers/list-controller.dart';
import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/domain/entity/range-list.dart';
import 'package:randomiser/presenter/ui/widgets/items/item-list-common.dart';
import 'package:randomiser/presenter/ui/widgets/items/item-list-detailed.dart';
import 'package:randomiser/presenter/ui/widgets/states/base-state.dart';
import 'package:randomiser/presenter/presenters/list-presenter.dart';

typedef OnPositionTap = void Function(int position);

class ListWidget extends StatefulWidget {

  final OnPositionTap onTap;
  final bool isDetail;
  final int initPosition;
  final StreamController<RangeList> controller;

  ListWidget({
    @required this.onTap,
    @required this.isDetail,
    this.initPosition,
    this.controller,
  });

  @override _ListWidgetState createState() => _ListWidgetState();

}

class _ListWidgetState extends BaseState<ListWidget, ListInformationPresenter> implements ListInformationView {

  ScrollController ctrl;
  RangeList range;

  @override void initState() {
    presenter = ListController(this);
    range = RangeList();
    super.initState();
  }

  @override Widget build(BuildContext context) {
    return StreamBuilder(
      stream: presenter.streamInfo,
      builder: (BuildContext ctx, AsyncSnapshot<List<Friend>> snapshot) {
        if(snapshot.data == null) return SizedBox.shrink();

        if(ctrl != null) ctrl.dispose();

        if(widget.controller != null && !widget.controller.isClosed) {
          range.maximal = snapshot.data.length;
          widget.controller.add(range);
          ctrl = ScrollController(initialScrollOffset: (widget.initPosition ?? 0) == 0 ||
              snapshot.data.isEmpty ? .0 :
              widget.initPosition * (MediaQuery
                  .of(context)
                  .size
                  .width * .75 + 32));

          ctrl.addListener(() {
            double pos = ctrl.position.pixels / (MediaQuery.of(context)
                .size
                .width * .75 + 32);
            range.current = pos.round() + 1;
            widget.controller.add(range);
          });
        }

        return ListView.builder(
          controller: ctrl ?? ScrollController(),
          padding: EdgeInsets.fromLTRB(
              widget.isDetail ? MediaQuery.of(context).size.width * .125 - 16 : 8,
              0,
              widget.isDetail ? MediaQuery.of(context).size.width * .125 - 16 : 8,
              widget.isDetail ? 0 : 32),
          physics: BouncingScrollPhysics(),
          scrollDirection: widget.isDetail ? Axis.horizontal : Axis.vertical,
          itemCount: snapshot.data.length + 1,
          itemBuilder: (BuildContext _ctx, int pos) {
            if(pos == snapshot.data.length) return Container(
              width: 80,
              height: 80,
              child: CircularProgressIndicator(),
            );
            if(pos == snapshot.data.length -1)
              presenter.loadNextItems();
            return widget.isDetail ?
            ItemListDetailed(
              friend: snapshot.data[pos],
              callback: () {},
            ) :
            ItemListCommon(
              friend: snapshot.data[pos],
              callback: () => widget.onTap(pos),
            );
          }
        );
      },
    );
  }

  @override onDestroy() {
    if(widget.controller != null && !widget.controller.isClosed)
      widget.controller.close();
    ctrl?.dispose();
  }

}