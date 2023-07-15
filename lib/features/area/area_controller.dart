import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../base/controller/base_controller.dart';
import '../../const/app_const.dart';
import '../../const/string_value.dart';
import 'area_repository.dart';
import 'model/area_arguments.dart';
import 'model/area_entity.dart';

class AreaController extends BaseGetxController {
  late AreaRepository areaRepository;
  final TextEditingController textSearchController = TextEditingController();
  final RxString hintTextSearch = ''.obs;
  final RxString title = ''.obs;
  late RxList<Area> data = RxList<Area>();
  late List<Area> dataResponsive = RxList<Area>();
  late AreaArguments areaArguments;

  @override
  void onInit() {
    areaRepository = AreaRepository(this);
    areaArguments = Get.arguments;
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    try {
      showLoadingOverlay();
      data.clear();
      switch (areaArguments.code) {
        case AppConst.PROVINCE_FILTER:
          {
            title.value = AppStr.areaTitleProvince.tr;
            hintTextSearch.value = AppStr.searchAreaTitleProvince.tr;
            dataResponsive = await areaRepository.getProvince();
            break;
          }
        case AppConst.DISTRICT_FILTER:
          {
            title.value = AppStr.areaTitleDistrict.tr;
            hintTextSearch.value = AppStr.searchAreaTitleDistrict.tr;
            dataResponsive = await areaRepository
                .getDistrict(areaArguments.value.toString());
            break;
          }
        case AppConst.WARD_FILTER:
          {
            title.value = AppStr.areaTitleWard.tr;
            hintTextSearch.value = AppStr.searchAreaTitleWard.tr;
            dataResponsive =
                await areaRepository.getWard(areaArguments.value.toString());
            break;
          }
      }
      getListByName();
    } catch (e) {
    } finally {
      hideLoadingOverlay();
    }
  }

  void getListByName() {
    data.clear();
    if (textSearchController.text.isEmpty) {
      data.addAll(dataResponsive);
    } else {
      data.addAll(dataResponsive
          .where((item) => item.name!
              .toUpperCase()
              .contains(textSearchController.text.toUpperCase()))
          .toList());
    }
  }

  void clearText() {
    textSearchController.clear();
    getListByName();
  }

  void selectData(int index) {
    Get.back(result: data[index]);
  }
}
