import 'package:get/get.dart';

import '../../../base/controller/base_controller.dart';
import '../../routes/app_routes.dart';
import '../model/image_path_model.dart';
import '../take_picture/ekyc_repository.dart';

class EkycResultController extends BaseGetxController {
  ImagePath? imagePath;
  RxBool checked = false.obs;
  RxBool? faceMatching = false.obs;
  late EkycRepository ekycRepository;
  late DataOcrModel modelTTPL;

  @override
  void onInit() async {
    super.onInit();
    // showLoadingOverlay();
    ekycRepository = EkycRepository(this);
    imagePath = Get.arguments ?? null;
    // checkEkyc(imagePath!);
  }

  void confirmNext() {
    if (!faceMatching!.value)
      Get.back();
    else {
      Get.offAndToNamed(Routes.routeCheckBasicInfo, arguments: modelTTPL);
    }
  }

  void checkEkyc(ImagePath imagePath) async {
    // try {
    //   ResponseEkyc? responseEkyc =
    //       await ekycRepository.checkEkyc(imagePath).whenComplete(() => hideLoadingOverlay());
    //   checked.value = true;
    //   faceMatching!.value = responseEkyc!.matching!.status == 'Khớp';
    //   modelTTPL = DataOcrModel(imagePath, responseEkyc);
    // } catch (e) {
    //   faceMatching!.value = false;
    //   ShowPopup.showDialogNotification(
    //     'Không thể xác thực.\nVui lòng thử lại sau!',
    //     function: () {
    //       Get.back();
    //     },
    //   );
    // }
  }
}
