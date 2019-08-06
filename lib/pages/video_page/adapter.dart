import 'dart:math';
import 'package:dogetv_flutter/pages/home_page/section_grid_component/component.dart';
import 'package:dogetv_flutter/pages/video_page/episode_grid_component/component.dart';
import 'package:dogetv_flutter/pages/video_page/resource_grid_component/component.dart';
import 'package:dogetv_flutter/pages/video_page/section_header_component/component.dart';
import 'package:dogetv_flutter/pages/video_page/state.dart';
import 'package:dogetv_flutter/pages/video_page/video_info_component/component.dart';
import 'package:fish_redux/fish_redux.dart';

class VideoDetailListAdapter extends DynamicFlowAdapter<VideoPageState> {
  VideoDetailListAdapter()
      : super(
          pool: <String, Component<Object>>{
            ///详情
            "header": VideoHeaderComponent(),
            "section-header": VideoSectionHeaderComponent(),
            "episodes": EpisodesGridComponent(),
            ///线路
            "servers": VideoServerGridComponent(),
            "grid": SectionGridComponent(),
          },
          connector: VideoDetailListConnector(),
        );
}

class VideoDetailListConnector extends ConnOp<VideoPageState, List<ItemBean>> {
  @override
  List<ItemBean> get(VideoPageState state) {
    List<ItemBean> items = [];
    ///第一个header
    items.add(ItemBean("header", state.videoDetail.video.info));
    ///线路
    items.add(
        ItemBean("section-header", {"title": "线路", "subTitle": "线路画质从高到低"}));

    List<int> servers = List.generate(
        min(state.videoDetail.video.info.source, 8), (item) => item);
    int selectedSource = int.tryParse(state.source);
    Resource resource = Resource(items: servers, selectedItem: selectedSource);
    ///线路
    items.add(ItemBean("servers", resource));
    ///分集
    items.add(ItemBean(
        "section-header", {"title": "分集", "subTitle": "无法播放? 尝试切换线路"}));
    ///高清
    items.add(ItemBean("episodes", state.videoDetail.episodes));
    ///猜你喜欢
    items.add(ItemBean("section-header", {"title": "猜你喜欢", "subTitle": null}));
    ///gird
    items.add(
        ItemBean("grid", state.videoDetail.video.recommends.take(6).toList()));

    return items;
  }

  @override
  void set(VideoPageState state, List<ItemBean> subState) {}
}
