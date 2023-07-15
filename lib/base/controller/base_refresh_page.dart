import 'package:flutter/cupertino.dart';
import 'package:ekyc/base/base.dart';

import 'base_refresh_controller.dart';

abstract class BaseRefreshWidget<T extends BaseRefreshGetxController>
    extends BaseGetWidget<T> {
  const BaseRefreshWidget({Key? key}) : super(key: key);
}
