import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {

  final String title;
  final String value;

  ItemInfo({
    this.title,
    this.value,
  });

  @override Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyText1,),
        Text(value, style: Theme.of(context).textTheme.bodyText2,),
        const Padding(padding: EdgeInsets.only(top: 16))
      ],
    );
  }

}