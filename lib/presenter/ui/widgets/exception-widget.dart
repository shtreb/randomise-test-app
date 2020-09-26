import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:randomiser/domain/entity/exceptions.dart';
import 'package:randomiser/generated/i18n.dart';

class DialogButton {
  String title;
  Function action;

  DialogButton({
    @required String title,
    @required this.action
  }) : title = title ?? '';
}

class ExceptionWidget extends StatelessWidget {

  final Exception exception;
  final VoidCallback callback;

  ExceptionWidget(this.exception, this.callback);

  @override Widget build(BuildContext context) {

    String text = '';

    List<DialogButton> buttons = [];

    if(exception is ApiException) {
      text = (exception as ApiException).mess ?? S.of(context).exceptionUnknown;
    } else if(exception is SocketException) {
      text = S.of(context).exceptionSocket;
    } else if(exception is TimeoutException) {
      text = S.of(context).exceptionTimeout;
    } else {
      text = S.of(context).exceptionUnknown;
    }

    buttons.add(DialogButton(
      title: S.of(context).dialogTryAgain,
      action: callback
    ));

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: Theme.of(context).textTheme.bodyText2.copyWith(
              color: Theme.of(context).textTheme.bodyText1.color), textAlign: TextAlign.center,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: buttons.map((e) => GestureDetector(
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.transparent,
                child: Text(e.title, style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColor),),
              ),
              onTap: e.action,
            )).toList(),
          )
        ],
      ),
    );
  }

}