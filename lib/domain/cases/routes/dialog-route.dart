import 'package:flutter/material.dart';

class DialogRoute extends ModalRoute<void> {

  final Widget child;

  DialogRoute(this.child);

  @override Color get barrierColor => Colors.white.withOpacity(.0);

  @override bool get barrierDismissible => false;

  @override String get barrierLabel => '';

  @override bool get maintainState => true;

  @override bool get opaque => false;

  @override Duration get transitionDuration => Duration(milliseconds: 0);

  @override Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Material(
      type: MaterialType.transparency,
      child: child,
    );
  }

}