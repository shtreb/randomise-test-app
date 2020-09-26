import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/presenter/ui/widgets/items/item-list-base.dart';

double _sizeImage = kToolbarHeight;

class ItemListCommon extends ItemListBase {

  ItemListCommon({
    Friend friend,
    VoidCallback callback,
  }) : super(
        friend: friend,
        callback: callback,
  );

  @override Widget genericChild(BuildContext context) => Column(
    children: [
      Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: _sizeImage,
              width: _sizeImage,
              child: CachedNetworkImage(
                imageUrl: friend.picture.medium,
                width: _sizeImage,
                height: _sizeImage,
                fit: BoxFit.contain,
                fadeOutDuration: Duration(seconds: 0),
                fadeInDuration: Duration(seconds: 0),
                errorWidget: (BuildContext context, String url, dynamic error) {
                  return Container(
                    width: _sizeImage,
                    height: _sizeImage,
                    color: Colors.red,
                  );
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 16)),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${friend.name.first} ${friend.name.last}', style: Theme.of(context).textTheme.bodyText1,),
                  const Padding(padding: EdgeInsets.only(top: 2)),
                  Text('${friend.location.postCode} '
                      '${friend.location.city}, '
                      '${friend.location.street.number} '
                      '${friend.location.street.name}', style: Theme.of(context).textTheme.bodyText2,)
                ],
              ),
            )
          ],
        ),
      ),
      const Divider(height: 1, color: Colors.grey,)
    ],
  );

}