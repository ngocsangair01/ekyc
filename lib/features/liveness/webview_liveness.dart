import 'package:ekyc/application/app_controller.dart';
import 'package:ekyc/const/const.dart';
import 'package:ekyc/features/liveness/controller/liveness_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../base/widget/base_get_widget.dart';
import '../../routes/app_routes.dart';

class WebViewLivenessPage extends BaseGetWidget {
  @override
  LivenessController get controller => Get.put(LivenessController());

  @override
  Widget buildWidgets() {
    // final flutterWebViewPlugin = FlutterWebviewPlugin();
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppDimens.paddingSmall),
                topLeft: Radius.circular(AppDimens.paddingSmall)),
            color: AppColors.bg()),
        padding: const EdgeInsets.only(top: AppDimens.paddingBig),
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse("https://dxtech.vn:8081/ekyc-liveness-mobile"),
            // headers: {'Authorization': HIVE_APP.get(AppKey.keyToken) ?? ''},
            headers: {
              // 'Content-Type': "application/json;charset=UTF-8",
              'Authorization': HIVE_APP.get(AppKey.keyToken) ?? ''
              // 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzb2Z0ZHJlYW0iLCJleHAiOjE2ODcwNDY0MDB9.pxG2jbUVBbHy89y2vI2Ji-0f3-dvUv_tmtgquiQxgto'
            },
          ),
          // Remove Bad SSL
          onReceivedServerTrustAuthRequest: (controller, challenge) async {
            return ServerTrustAuthResponse(
                action: ServerTrustAuthResponseAction.PROCEED);
          },
          // Permission Camera
          androidOnPermissionRequest: (InAppWebViewController controller,
              String origin, List<String> resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          // Init Camera
          initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
              mediaPlaybackRequiresUserGesture: false,
            ),
          ),
          onUpdateVisitedHistory: (InAppWebViewController webViewController,
              Uri? url, bool? androidIsReload) {
            if (url?.path == '/finish-liveness') {
              Get.offNamed(Routes.routeLivenessResult);
            }
            // print(url);
            // controller.webStorage.sessionStorage.getItem(key: 'abc');
            // cookie.getCookie(
            //     url: Uri(host: 'https://www.google.com/'), name: 'name');
          },
        ),
      ),
    );
  }
}
