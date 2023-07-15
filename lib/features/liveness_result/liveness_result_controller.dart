import 'package:ekyc/utils/show_popup.dart';
import 'package:get/get.dart';

import '../../../base/controller/base_controller.dart';
import '../../routes/app_routes.dart';
import '../model/image_path_model.dart';
import '../model/liveness_result_model.dart';
import 'liveness_repository.dart';

class LivenessResultController extends BaseGetxController {
  ImagePath? imagePath;
  RxBool checked = false.obs;
  RxBool? faceMatching = false.obs;
  late LivenessRepository livenessRepository;
  late DataOcrModel dataOcrModel;
  late LivenessResultModel? livenessResult;

  @override
  void onInit() async {
    super.onInit();
    showLoadingOverlay();
    livenessRepository = LivenessRepository(this);
    // imagePath = Get.arguments ?? null;
    checkLivenessResult();
  }

  void confirmNext() {
    // Get.offAndToNamed(Routes.routeCheckBasicInfo);
    if (!faceMatching!.value)
      Get.back();
    else {
      Get.offAndToNamed(Routes.routeCheckBasicInfo);
    }
  }

  void checkLivenessResult({ImagePath? imagePath}) async {
    try {
      livenessResult = await livenessRepository
          .getLivenessResult()
          .whenComplete(() => hideLoadingOverlay());
      checked.value = true;
      faceMatching!.value = livenessResult?.status == 'Khớp';
      // modelTTPL = ModelTTPL(imagePath, livenessResult);
    } catch (e) {
      faceMatching!.value = false;
      ShowPopup.showDialogNotification(
        'Không thể xác thực.\nVui lòng thử lại sau!',
        function: () {
          Get.back();
        },
      );
    }
  }
}
