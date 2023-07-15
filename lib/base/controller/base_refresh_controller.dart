import 'package:ekyc/base/base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseRefreshGetxController extends BaseGetxController {
  /// Controller của smart refresh.
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  /// Hàm load more.
  Future<void> onLoadMore();

  /// Hàm refresh page.
  Future<void> onRefresh();
}
