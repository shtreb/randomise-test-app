import 'package:flutter/material.dart';

typedef OnTap = void Function();

class ListWidget extends StatelessWidget {

  final OnTap onTap;

  ListWidget({
    @required this.onTap
  });

  @override Widget build(BuildContext context) {
    return ListView();
  }

}