import '../../base/base_repository.dart';
import '../../base/controller/base_controller.dart';
import '../../base/request/base_request.dart';
import '../../const/constants/app_url.dart';
import '../model/liveness_result_model.dart';

class LivenessRepository extends BaseRepository {
  LivenessRepository(BaseGetxController controller) : super(controller);

  Future<LivenessResultModel> getLivenessResult() async {
    var response =
        await sendRequest(AppUrl.urlGetLivenessResult, RequestMethod.POST);
    LivenessResultModel livenessResult = LivenessResultModel.fromJson(response);
    return livenessResult;
  }
}
