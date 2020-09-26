import 'package:flutter/material.dart';

import 'package:randomiser/domain/entity/friend.dart';

abstract class ItemListBase extends StatelessWidget {

  final Friend friend;
  final VoidCallback callback;

  ItemListBase({
    this.friend,
    this.callback,
  });

  @override Widget build(BuildContext context) => GestureDetector(
    child: Container(
        color: Colors.transparent,
        child: genericChild(context)
    ),
    onTap: callback,
  );

  Widget genericChild(BuildContext context);

}