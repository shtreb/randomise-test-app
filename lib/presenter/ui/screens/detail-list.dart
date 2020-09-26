import 'dart:ui';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:randomiser/domain/entity/range-list.dart';
import 'package:randomiser/generated/i18n.dart';
import 'package:randomiser/presenter/ui/widgets/list-widget.dart';


class DetailList extends StatelessWidget {

  final int currentPosition;

  DetailList(this.currentPosition);

  @override Widget build(BuildContext context) {
    StreamController<RangeList> ctrl = StreamController<RangeList>();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Container(
          color: Colors.black.withOpacity(.25),
          child: Column(
            children: [
              SafeArea(
                top: true,
                child: SizedBox(
                    height: kToolbarHeight,
                    child: Stack(
                      children: [
                        StreamBuilder(
                          stream: ctrl.stream,
                          builder: (BuildContext ctx, AsyncSnapshot<RangeList> snapshot) {
                            if(snapshot.data == null) return SizedBox.shrink();
                            RangeList range = snapshot.data;
                            return Center(
                              child: Text(
                                S.of(context).rangeList(
                                    range.current == 0 ? (currentPosition ?? 0) + 1 : range.current,
                                    range.maximal
                                ),
                                style: Theme.of(context).appBarTheme.textTheme.bodyText1,
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(Icons.close, color: Colors.white,),
                            onPressed: () => Navigator.pop(context),
                          ),
                        )
                      ],
                    )
                ),
              ),
              Expanded(
                child: ListWidget(
                  initPosition: currentPosition,
                  onTap: (int position) {},
                  isDetail: true,
                  controller: ctrl,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}