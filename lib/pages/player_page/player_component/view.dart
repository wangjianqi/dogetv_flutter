import 'package:chewie/chewie.dart';
import 'package:dogetv_flutter/pages/player_page/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

Widget buildView(PlayerPageState state, dispatch, ViewService viewService) {
  return Container(
    color: Colors.black,
    ///TODO ----播放器
    child: Chewie(
      controller: state.chewieController,
    ),
  );
}
