import '../../../base/base_response.dart';
import 'area_entity.dart';

class AreasResponse {
  List<Area>? areas;
  BaseResponse? baseResponse;

  AreasResponse({this.areas, this.baseResponse});
  factory AreasResponse.fromJson(Map<String, dynamic> json) => AreasResponse(
        areas: List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
        baseResponse: BaseResponse.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        "collaterals": List<dynamic>.from(areas!.map((x) => x.toJson())),
        "baseResponse": baseResponse!.toJson()
      };
}
