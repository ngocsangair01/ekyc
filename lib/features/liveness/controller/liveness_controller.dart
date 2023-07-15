import 'package:camera/camera.dart';
import 'package:get/get.dart';

import '../../../application/app_controller.dart';
import '../../../base/controller/base_controller.dart';
import '../../../routes/app_routes.dart';
import '../../model/image_path_model.dart';
import '../ekyc_repository.dart';

class LivenessController extends BaseGetxController {
  final AppController appController = Get.find<AppController>();
  late CameraController cameraController;

  late EkycRepository ekycRepository;
  RxBool isFrontImg = true.obs;
  RxDouble cameraRatio = (16 / 9).obs;
  ImagePath imagePath = ImagePath();
  RxString frontImgUrl = ''.obs;
  RxInt currentStep = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    ekycRepository = EkycRepository(this);
    cameraController = CameraController(
      appController.cameras[1],
      ResolutionPreset.max,
      enableAudio: false,
    );
    await cameraController.initialize();
    cameraRatio.value = cameraController.value.aspectRatio;
    // frontImg.value = Get.arguments;
  }

  void takePicture() async {
    Get.offNamed(Routes.routeEKycResult);
    cameraController.dispose();
    // isFrontImg.value
    //     ? isFrontImg.value = false
    //     : {
    //         Get.offNamed(Routes.routeGuideTakePortrait),
    //         cameraController.dispose()
    //       };
    // XFile image = await cameraController.takePicture().whenComplete(() => {
    //       hideLoadingOverlay(),
    //     });
    // if (frontImg.value) {
    //   imagePath.frontImgUrl = image.path;
    //   // GallerySaver.saveImage(image.path);
    //   checkFrontCard();
    // } else {
    //   imagePath.backImgUrl = image.path;
    //   Get.offAndToNamed(Routes.routeEKycUser, arguments: imagePath);
    // }
    // frontImgUrl.value = image.path;
  }

  @override
  void dispose() async {
    await cameraController.dispose();
    super.dispose();
  }
}
