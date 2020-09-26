import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:randomiser/domain/entity/friend.dart';
import 'package:randomiser/generated/i18n.dart';
import 'package:randomiser/presenter/ui/widgets/detail-body-widget.dart';
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

  @override Widget genericChild(BuildContext context) => DetailBodyWidget(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: friend.picture.large,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
              progressIndicatorBuilder: (_, __, ___) => SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                height: MediaQuery.of(context).size.width * .75,
                child: Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                )),
              ),
              errorWidget: (_, __, ___) => Container(
                width: MediaQuery.of(context).size.width * .75,
                height: MediaQuery.of(context).size.width * .75,
                color: Colors.red.withOpacity(.1),
                child: Center(
                  child: Text(
                    S.of(context).pictureNotDownload,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
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
                    title: S.of(context).detailAddress,
                    value: '${friend.location.postCode} ${friend.location.city}, ${friend.location.street.number} ${friend.location.street.name}',
                  ),
                  ItemInfo(
                    title: S.of(context).detailEmail,
                    value: friend.email,
                  ),
                  ItemInfo(
                    title: S.of(context).detailPhone,
                    value: friend.phone,
                  )
                ],
              ),
            ),
          ),
        ],
      )
  );

}