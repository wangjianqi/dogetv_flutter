import 'package:fish_redux/fish_redux.dart';
import 'package:dogetv_flutter/models/home.dart';
import 'package:flutter/material.dart';

class HomePageState implements Cloneable<HomePageState> {
  ///数据源
  Home home = Home();
  bool isLoading = false;
  ///key
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  HomePageState clone() {
    return HomePageState()
      ..home = home
      ..isLoading = isLoading;
  }

  ///数据是否为空
  bool get isDataReady {
    return home.topics.isNotEmpty && home.sections.isNotEmpty;
  }
}

HomePageState initState(Map<String, dynamic> map) {
  ///初始化
  return HomePageState()..isLoading = true;
}
