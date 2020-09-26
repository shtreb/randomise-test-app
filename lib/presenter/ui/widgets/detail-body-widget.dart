import 'package:flutter/material.dart';

class DetailBodyWidget extends StatelessWidget {

  final Widget child;

  DetailBodyWidget(this.child);

  @override Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      width: MediaQuery.of(context).size.width*.75,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))
      ),
      child: child,
    ),
  );
}