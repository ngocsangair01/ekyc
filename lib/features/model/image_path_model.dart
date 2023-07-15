import 'package:ekyc/features/model/response_ekyc.dart';

class ImagePath {
  String? frontImgUrl, backImgUrl, imgWithUserUrl,imgAvatar;

  ImagePath({this.frontImgUrl, this.backImgUrl, this.imgWithUserUrl,this.imgAvatar});
}

class DataOcrModel {
  ImagePath imagePath;
  ResponseEkyc? responseEkyc;

  DataOcrModel(this.imagePath, this.responseEkyc);
}
