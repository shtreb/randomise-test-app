import 'dart:async';

import 'package:flutter/material.dart';

import 'package:randomiser/domain/cases/controllers/list-controller.dart';
import 'package:randomiser/domain/entity/exceptions.dart';
import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/domain/entity/range-list.dart';
import 'package:randomiser/presenter/ui/widgets/detail-body-widget.dart';
import 'package:randomiser/presenter/ui/widgets/exception-widget.dart';
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

class _ListWidgetState extends BaseState<ListWidget, ListInformationPresenter>
    implements ListInformationView
{

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

        if(ctrl != null) ctrl.dispose();

        List<Friend> friends = snapshot.data ?? [];

        if(snapshot.hasError) {
          if(snapshot.error is CustomException) {
            friends = (snapshot.error as CustomException).data;
          }

          if(friends == null || friends.isEmpty) {
            return Center(
              child: ExceptionWidget(snapshot.error is CustomException ?
                (snapshot.error as CustomException).exception :
                snapshot.error,
                () {
                  presenter.loadCurrentItems();
                  presenter.loadNextItems();
                }
              ),
            );
          }
        }

        if(widget.controller != null && !widget.controller.isClosed) {
          range.maximal = friends.length;
          widget.controller.add(range);
          ctrl = ScrollController(initialScrollOffset: (widget.initPosition ?? 0) == 0 ||
              friends.isEmpty ? .0 :
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
          itemCount: friends.length + 1,
          itemBuilder: (BuildContext _ctx, int pos) {
            if(pos == friends.length) {
              Widget child;
              if(snapshot.hasError) {
                child = Center(
                  child: ExceptionWidget(snapshot.error is CustomException ?
                  (snapshot.error as CustomException).exception :
                  snapshot.error,
                          () {
                        presenter.loadCurrentItems();
                        presenter.loadNextItems();
                      }
                  ),
                );
              } else {
                child = SizedBox(
                  width: 80,
                  height: 80,
                  child: Center(child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme
                            .of(context)
                            .primaryColor),
                  )),
                );
              }

              return widget.isDetail ?
                DetailBodyWidget(child) : child;
            }
            if(pos == friends.length -1)
              presenter.loadNextItems();
            return widget.isDetail ?
            ItemListDetailed(
              friend: friends[pos],
              callback: () {},
            ) :
            ItemListCommon(
              friend: friends[pos],
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