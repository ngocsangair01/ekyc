import 'package:dio/dio.dart';
import 'package:ekyc/base/base_repository.dart';
import 'package:ekyc/features/login/login_request_model.dart';
import 'package:ekyc/features/login/token_model.dart';

import '../../base/base.dart';
import '../../const/constants/app_url.dart';

class LoginRepository extends BaseRepository {
  LoginRepository(BaseGetxController controller) : super(controller);

  Future<TokenModel?> getToken(LoginRequestModel loginRequestModel) async {
    FormData formData = FormData.fromMap(loginRequestModel.toJson());

    var response = await sendRequest(
      AppUrl.urlGetToken,
      RequestMethod.POST,
      jsonMap: formData,
    );

    TokenModel tokenModel = TokenModel.fromJson(response);
    return tokenModel;
  }
}
