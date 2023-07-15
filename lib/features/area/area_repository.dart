import '../../base/base_repository.dart';
import '../../base/controller/base_controller.dart';
import '../../base/request/base_request.dart';
import '../../const/constants/app_url.dart';
import 'model/area_entity.dart';

class AreaRepository extends BaseRepository {
  AreaRepository(BaseGetxController controller) : super(controller);

  Future<List<Area>> getProvince() async {
    final Map<String, dynamic> jsonBody = {
      "type": 2,
    };
    var response = await sendRequest(
      '',
      RequestMethod.GET,
      jsonMap: jsonBody,
      urlOther: AppUrl.urlGetProvince,
    );
    List<Area> areas = List<Area>.from(response.map((x) => Area.fromJson(x)));
    return areas;
  }

  Future<List<Area>> getDistrict(String parentCode) async {
    final Map<String, dynamic> jsonBody = {
      "type": 3,
      "parentCode": parentCode,
    };
    var response = await sendRequest(
      '',
      RequestMethod.GET,
      jsonMap: jsonBody,
      urlOther: AppUrl.urlGetProvince,
    );
    List<Area> areas = List<Area>.from(response.map((x) => Area.fromJson(x)));
    return areas;
  }

  Future<List<Area>> getWard(String parentCode) async {
    final Map<String, dynamic> jsonBody = {
      "type": 5,
      "parentCode": parentCode,
    };
    var response = await sendRequest(
      '',
      RequestMethod.GET,
      jsonMap: jsonBody,
      urlOther: AppUrl.urlGetProvince,
    );
    List<Area> areas = List<Area>.from(response.map((x) => Area.fromJson(x)));
    return areas;
  }
}
