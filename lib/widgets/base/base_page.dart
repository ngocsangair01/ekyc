import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BasePage {
  /// Widget cài đặt việc refresh page
  static Widget buildSmartRefresher(
      {required RefreshController refreshController,
      Function()? onRefresh,
      Function()? onLoadMore,
      bool enablePullUp = false,
      bool enablePullDown = true,
      required Widget child}) {
    return SmartRefresher(
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      header: const MaterialClassicHeader(),
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      footer: _buildSmartRefresherCustomFooter(),
      child: child,
    );
  }

  static Widget _buildSmartRefresherCustomFooter() {
    return CustomFooter(
      builder: (BuildContext? context, LoadStatus? mode) {
        if (mode == LoadStatus.loading) {
          return const CupertinoActivityIndicator();
        } else {
          return const Opacity(
            opacity: 0.0,
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }
}
