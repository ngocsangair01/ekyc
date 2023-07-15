import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ekyc/const/const.dart';

import '../../utils/show_popup.dart';
import '../base.dart';

class BaseGetxController extends GetxController {
  RxBool isShowLoading = false.obs;

  ///1 CancelToken để huỷ 1 request.
  ///1 màn hình gắn với 1 controller, 1 controller có nhiều requests khi huỷ 1 màn hình => huỷ toàn bộ requests `INCOMPLETED` tại màn hình đó.
  List<CancelToken> cancelTokens = [];

  /// Sử dụng một số màn bắt buộc sử dụng loading overlay
  RxBool isLoadingOverlay = false.obs;

  RxBool isKeyBoardShow = false.obs;

  RxBool isShimmerLoading = true.obs;

  void showLoading() {
    isShowLoading.value = true;
  }

  void hideLoading() {
    isShowLoading.value = false;
  }

  void showLoadingOverlay() {
    isLoadingOverlay.value = true;
  }

  void hideLoadingOverlay() {
    isLoadingOverlay.value = false;
  }

  void showShimmerLoading() {
    isShimmerLoading.value = true;
  }

  void hideShimmerLoading() {
    isShimmerLoading.value = false;
  }

  bool isShimmer() {
    return isShimmerLoading.value;
  }

  void loadingController(bool shimmer) {
    if (shimmer) {
      showShimmerLoading();
    } else {
      showLoadingOverlay();
    }
  }

  void onError(Object error) {
    String errorContent = AppStr.errorConnectFailedStr.tr;

    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          errorContent = AppStr.errorConnectTimeOut.tr;
          BaseRequest.dio.close();
          break;
        case DioErrorType.response:
          switch (error.response!.statusCode) {
            case ErrorCode.error401:
              errorContent = AppStr.error401.tr;
              return;
            case ErrorCode.error404:
              errorContent = AppStr.error404.tr;
              break;
            case ErrorCode.error500:
              errorContent = AppStr.errorInternalServer.tr;
              break;
            case ErrorCode.error502:
              errorContent = AppStr.error502.tr;
              break;
            case ErrorCode.error503:
              errorContent = AppStr.error503.tr;
              break;
            default:
              errorContent = AppStr.errorInternalServer.tr;
          }
          break;
        default:
          errorContent = AppStr.errorConnectFailedStr.tr;
      }
    }

    print('errorContent -> $errorContent');
    print('error -> $error');
    isShowLoading.value = false;
    isLoadingOverlay.value = false;
    // if (errorContent.isNotEmpty) showSnackBar(errorContent);
    if (errorContent.isNotEmpty && !isClosed) {
      ShowPopup.showErrorMessage(errorContent);
    }
  }

  Future<void> showSnackBar(String message,
      {Duration duration = const Duration(seconds: 2)}) async {
    Get.showSnackbar(GetBar(
      backgroundColor: AppColors.accentColor(),
      messageText: Text(
        message,
        style: Get.textTheme.bodyText1!.copyWith(color: AppColors.bg()),
      ),
      message: message,
      duration: message.length > 500 ? 5.seconds : duration,
    ));
  }

  void addCancelToken(CancelToken cancelToken) {
    cancelTokens.add(cancelToken);
  }

  void cancelRequest(CancelToken cancelToken) {
    if (!cancelToken.isCancelled)
      cancelToken.cancel('Cancel when close controller!!!');
  }

  @override
  void onClose() {
    cancelTokens.forEach((cancelToken) {
      cancelRequest(cancelToken);
    });
    super.onClose();
  }
}
