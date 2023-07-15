import 'package:app_settings/app_settings.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sds_flutter/sds_flutter.dart';

class ShowPopup {
  static void _showDialog(Widget dialog, bool isActiveBack) {
    Get.dialog(
      WillPopScope(
        onWillPop: () => onBackPress(isActiveBack),
        child: dialog,
      ),
      barrierDismissible: false,
    ).then((value) => _numberOfDialogs--);
    _numberOfDialogs++;
  }

  /// local vars
  static int _numberOfDialogs = 0;

  static Future<bool> onBackPress(bool isActiveBack) {
    return Future.value(isActiveBack);
  }

  static void dismissDialog() {
    if (_numberOfDialogs > 0) {
      Get.back();
    }
  }

  static Widget _baseButton(Function? function, String text) {
    return SdsTextButton(
      onPressed: () {
        dismissDialog();
        function?.call();
      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        text,
        style: Get.textTheme.bodyText1!.copyWith(
          color: AppColors.blueAccent(),
          fontSize: AppDimens.fontMedium,
          fontWeight: FontWeight.bold,
          wordSpacing: 1.25,
        ),
        textScaleFactor: 1,
        maxLines: 1,
      ),
    );
  }

  /// Hiển thị loading
  ///
  /// `isActiveBack` có cho phép back từ bàn phím Android khi loading hay không, default = true
  void showLoadingWave({bool isActiveBack = true}) {
    _showDialog(getLoadingWidget(), isActiveBack);
  }

  static Widget getLoadingWidget() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  /// Hiển thị dialog thông báo với nội dung cần hiển thị
  ///
  /// `funtion` hành động khi bấm đóng
  ///
  /// `isActiveBack` có cho phép back từ bàn phím Android hay không, default = true
  ///
  /// `isChangeContext` default true: khi gọi func không close dialog hiện tại (khi chuyển sang màn mới thì dialog hiện tại sẽ tự đóng)
  static void showDialogNotification(
    String content, {
    bool isActiveBack = true,
    Function? function,
    String? nameAction,
    Widget? widgetContent,
  }) {
    _showDialog(
        Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.paddingSmall),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                      top: AppDimens.defaultPadding,
                      bottom: AppDimens.padding10),
                  child: Icon(
                    _buildIconDialog(content),
                    size: AppDimens.sizeImageLogo,
                    color: AppColors.blueAccent(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppDimens.defaultPadding),
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: widgetContent ??
                        Text(
                          content,
                          style:
                              const TextStyle(fontSize: AppDimens.fontMedium),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          textScaleFactor: 1,
                        ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  width: double.infinity,
                  child: _baseButton(function, nameAction ?? AppStr.close.tr),
                ),
              ],
            ),
          ),
        ),
        isActiveBack);
  }

  static void showErrorMessage(String error) {
    showDialogNotification(error, isActiveBack: false);
  }

  static IconData _buildIconDialog(String errorStr) {
    IconData iconData;

    if (errorStr == AppStr.errorConnectTimeOut.tr) iconData = Icons.alarm_off;

    if (errorStr == AppStr.errorInternalServer.tr) iconData = Icons.warning;

    if (errorStr == AppStr.errorConnectFailedStr.tr)
      iconData = Icons.signal_wifi_off;
    else
      iconData = Icons.notifications_none;

    return iconData;
  }

  static void showDialogConfirm(
    String content, {
    required Function confirm,
    required String actionTitle,
    bool isActiveBack = true,
    String title = AppStr.notify,
    String exitTitle = AppStr.cancel,
    Function? cancelFunc,
    bool isAutoCloseDialog = false,
  }) {
    _showDialog(
      Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.padding10),
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: AppDimens.defaultPadding),
                  child: Text(
                    title,
                    textScaleFactor: 1,
                    maxLines: 1,
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppDimens.defaultPadding),
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Text(
                      content,
                      style: Get.textTheme.bodyText1!.copyWith(
                        color: AppColors.textColor(),
                        fontSize: AppDimens.fontMedium,
                        fontWeight: FontWeight.w400,
                        wordSpacing: 1.25,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      textScaleFactor: 1,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  width: double.infinity,
                  height: AppDimens.btnMedium,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: _baseButton(cancelFunc, exitTitle),
                      ),
                      const VerticalDivider(
                        width: 1,
                      ),
                      Expanded(
                        child: _baseButton(confirm, actionTitle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      isActiveBack,
    );
  }

  static void openAppSetting() {
    showDialogConfirm(
      AppStr.permissionHelper.tr,
      actionTitle: AppStr.openSettings.tr,
      confirm: () {
        AppSettings.openAppSettings();
      },
    );
  }
}
