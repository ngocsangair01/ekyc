import 'package:get/get.dart';

import 'base.dart';

class BaseRepository {
  final BaseRequest _baseRequest = Get.find<BaseRequest>();
  final BaseGetxController controller;

  BaseRepository(this.controller);

  Future<dynamic> sendRequest(
    String action,
    RequestMethod requestMethod, {
    dynamic jsonMap,
    bool isQueryParametersPost = false,
    bool getErrorApi = true,
    String? urlOther,
    bool isByte = false,
  }) {
    return _baseRequest.sendRequest(action, requestMethod,
        jsonMap: jsonMap,
        isQueryParametersPost: isQueryParametersPost,
        controller: this.controller,
        urlOther: urlOther,
        isByte: isByte,
        getErrorApi: getErrorApi);
  }
}
