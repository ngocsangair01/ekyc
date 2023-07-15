import 'package:dio/dio.dart';
import 'package:ekyc/features/nfc/nfc_avt_model.dart';
import 'package:ekyc/features/nfc/result/nfc_request.dart';
import 'package:flutter/cupertino.dart';

import '../../base/base_repository.dart';
import '../../base/controller/base_controller.dart';
import '../../base/request/base_request.dart';
import '../../const/constants/app_url.dart';
import '../model/back_card_response.dart';
import '../model/front_card_response.dart';
import '../model/image_path_model.dart';
import '../model/response_ekyc.dart';

class EkycRepository extends BaseRepository {
  EkycRepository(BaseGetxController controller) : super(controller);

  Future<ResponseEkyc?> checkEkyc(ImagePath imagePath) async {
    FormData formData = FormData.fromMap({
      'frontImg': await MultipartFile.fromFile(
        imagePath.frontImgUrl ?? '',
      ),
      'imgWithUserUrl': await MultipartFile.fromFile(
        imagePath.imgWithUserUrl ?? '',
      ),
    });

    var response = await sendRequest('', RequestMethod.POST,
        jsonMap: formData,
        urlOther: 'https://dxtech.vn:8081/ekyc/v1/check-face');

    // var response = {
    //   "data": {
    //     "Id_number": "036200000160",
    //     "Name": "ĐỖ BÙI THÀNH NAM",
    //     "Date_of_Birth": "09/10/2000",
    //     "Sex": "Nam",
    //     "Nationality": "Việt Nam",
    //     "Home_town": "Xuân Trung, Xuân Trường, Nam Định",
    //     "Address": "Xóm 5, Xuân Trung, Xuân Trường, Nam Định",
    //     "Expired": "09/10/2025"
    //   },
    //   "matching": {"status": "Khớp", "percent": "66.67%"},
    //   "frontFace": "static/face/SkhScT7stAuH9SLnHkHD/frontFace.jpg",
    //   "userFace": "static/face/SkhScT7stAuH9SLnHkHD/userFace.jpg"
    // };
    ResponseEkyc responseEkyc = ResponseEkyc.fromJson(response);
    return responseEkyc;
  }

  Future<FrontCardResponse?> checkFrontCard(ImagePath imagePath) async {
    FormData formData = FormData.fromMap(
      {
        'frontImg': await MultipartFile.fromFile(
          imagePath.frontImgUrl ?? '',
        ),
      },
    );

    var response = await sendRequest(AppUrl.urlGetFrontCard, RequestMethod.POST,
        jsonMap: formData);

    FrontCardResponse frontCardResponse = FrontCardResponse.fromJson(response);
    return frontCardResponse;
  }

  Future<BackCardResponse?> checkBackCard(ImagePath imagePath) async {
    FormData formData = FormData.fromMap(
      {
        'backImg': await MultipartFile.fromFile(
          imagePath.backImgUrl ?? '',
        ),
      },
    );

    var response = await sendRequest(
      AppUrl.urlGetBackCard,
      RequestMethod.POST,
      jsonMap: formData,
    );

    BackCardResponse backCardResponse = BackCardResponse.fromJson(response);
    return backCardResponse;
  }

  Future<NfcAvtModelResponse> sendImageAvt(
      NfcRequest nfcRequest, ImagePath imagePath) async {
    FormData formData = FormData.fromMap(
      {
        'inputImg': await MultipartFile.fromFile(
          imagePath.imgAvatar ?? '',
        ),
      },
    );
    var response = await sendRequest(
      '${AppUrl.urlSendAvtNfc}?FirstName=${nfcRequest.firstName}&lastName=${nfcRequest.lastName}&DocumentNumber=${nfcRequest.documentNumber}&IDNumber=${nfcRequest.idNumber}&Gender=${nfcRequest.gender}&Country=${nfcRequest.country}&Nationality=${nfcRequest.nationality}&DateOfBirthc=${nfcRequest.dateOfBirthc}&DateOfExpire=${nfcRequest.dateOfExpire}&CA_Issuer=${nfcRequest.caIssuer}&CA_SerialNumber=${nfcRequest.caSerialNumber}',
      RequestMethod.POST,
      jsonMap: formData,
    );
    NfcAvtModelResponse nfcAvtModelResponse =
        NfcAvtModelResponse.fromJson(response);
    return nfcAvtModelResponse;
  }
}
