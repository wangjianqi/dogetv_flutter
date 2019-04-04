import 'package:dogetv_flutter/models/channel.dart';
import 'package:dogetv_flutter/pages/tv_page/tv_item_component/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(Channel channel, dispatch, ViewService viewService) {
  return GestureDetector(
    onTap: () => dispatch(TVGridItemActionCreator.didSelect(channel.url)),
    child: Card(
      elevation: 5.0,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              width: 70,
              fit: BoxFit.cover,
              image: NetworkImage(
                channel.icon,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                channel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ]),
    ),
  );
}
