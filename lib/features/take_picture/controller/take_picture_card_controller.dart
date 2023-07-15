import 'package:camera/camera.dart';
import 'package:ekyc/features/model/back_card_response.dart';
import 'package:ekyc/features/model/response_ekyc.dart';
import 'package:get/get.dart';

import '../../../application/app_controller.dart';
import '../../../base/controller/base_controller.dart';
import '../../../routes/app_routes.dart';
import '../../model/front_card_response.dart';
import '../../model/image_path_model.dart';
import '../ekyc_repository.dart';

class TakePictureController extends BaseGetxController {
  final AppController appController = Get.find<AppController>();
  late CameraController cameraController;

  late EkycRepository ekycRepository;
  RxBool isFrontImg = true.obs;
  RxDouble cameraRatio = (16 / 9).obs;
  ImagePath imagePath = ImagePath();
  RxString frontImgUrl = ''.obs;

  late DataOcrModel dataOcrModel;

  @override
  void onInit() async {
    super.onInit();
    ekycRepository = EkycRepository(this);
    cameraController = CameraController(
      appController.cameras[0],
      ResolutionPreset.max,
      enableAudio: false,
    );
    await cameraController.initialize();
    cameraRatio.value = cameraController.value.aspectRatio;
    dataOcrModel = DataOcrModel(imagePath, ResponseEkyc());
    // frontImg.value = Get.arguments;
  }

  void takePicture() async {
    // isFrontImg.value
    //     ? isFrontImg.value = false
    //     : {
    //         Get.offNamed(Routes.routeGuideTakePortrait),
    //         cameraController.dispose()
    //       };
    XFile image = await cameraController.takePicture().whenComplete(() => {
          hideLoadingOverlay(),
        });
    if (isFrontImg.value) {
      imagePath.frontImgUrl = image.path;
      // GallerySaver.saveImage(image.path);
      checkFrontCard();
    } else {
      imagePath.backImgUrl = image.path;
      checkBackCard();
    }
    frontImgUrl.value = image.path;
  }

  void checkFrontCard() async {
    showLoadingOverlay();

    FrontCardResponse? frontCardResponse = await ekycRepository
        .checkFrontCard(imagePath)
        .whenComplete(() => hideLoadingOverlay());
    if (frontCardResponse != null) {
      isFrontImg.value = false;
      dataOcrModel.responseEkyc?.frontCardResponse = frontCardResponse;
    }
  }

  void checkBackCard() async {
    showLoadingOverlay();
    BackCardResponse? backCardResponse = await ekycRepository
        .checkBackCard(imagePath)
        .whenComplete(() => hideLoadingOverlay());
    if (backCardResponse != null) {
      dataOcrModel.imagePath = imagePath;
      dataOcrModel.responseEkyc?.backCardResponse = backCardResponse;
      appController.dataOcrModel = dataOcrModel;
      Get.offAllNamed(Routes.routeNfcPage);
      // Get.offNamed(Routes.routeGuideTakePortrait);
      // Get.offAndToNamed(Routes.routeCheckBasicInfo);
    }
  }

  @override
  void dispose() async {
    await cameraController.dispose();
    super.dispose();
  }
}
