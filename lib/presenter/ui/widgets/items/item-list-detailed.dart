import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/presenter/ui/widgets/items/item-info.dart';
import 'package:randomiser/presenter/ui/widgets/items/item-list-base.dart';

class ItemListDetailed extends ItemListBase {

  ItemListDetailed({
    Friend friend,
    VoidCallback callback,
  }) : super(
    friend: friend,
    callback: callback,
  );

  @override Widget genericChild(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
    child: Container(
      width: MediaQuery.of(context).size.width*.75,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: friend.picture.large,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('${friend.name.first} ${friend.name.last}',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 24, 
                    fontWeight: FontWeight.w900, 
                    color: Theme.of(context).textTheme.bodyText1.color.withOpacity(.8)
                ),
              ),
            ),
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.018)
              ),
              child: ListView(
                padding: EdgeInsets.fromLTRB(16, 8, 16, MediaQuery.of(context).padding.bottom + 32),
                physics: BouncingScrollPhysics(),
                children: [
                  ItemInfo(
                    title: 'Address:',
                    value: '${friend.location.postCode} ${friend.location.city}, ${friend.location.street.number} ${friend.location.street.name}',
                  ),
                  ItemInfo(
                    title: 'Email:',
                    value: friend.email,
                  ),
                  ItemInfo(
                    title: 'Phone:',
                    value: friend.phone,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

}