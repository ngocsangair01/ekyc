import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';

import '../const/const.dart';
import '../utils/date_time_util.dart';
import '../utils/fnc_utils.dart';
import '../widgets/base/base.dart';
import 'model/radio_button_model.dart';
import 'model/text_input_model.dart';

PreferredSizeWidget buildAppBar(
    {bool showActions = true,
    bool showIcon = true,
    IconData icon = Icons.arrow_back,
    Color? backgroundColor,
    Color? iconColor,
    Widget? title}) {
  return AppBar(
    leading: Visibility(
      visible: showIcon,
      child: IconButton(
        icon: Icon(icon, color: iconColor ?? AppColors.colorEKYC()),
        onPressed: () => Get.back(),
      ),
    ),
    centerTitle: true,
    title: title ?? SizedBox(),
    backgroundColor: backgroundColor ?? AppColors.bg(),
    // iconTheme: Get.theme.iconTheme.copyWith(color: AppColors.colorEKYC()),
    // automaticallyImplyLeading: false,
    elevation: 0,
    actions: [
      Visibility(
        visible: showActions,
        child: Center(
          child: TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              AppStr.cancel.tr,
              style: TextStyle(
                  color: AppColors.colorEKYC(), fontWeight: FontWeight.w500),
            ),
          ),
        ),
      )
    ],
  );
}

Widget buildProgress(double height, progress) {
  if (progress > 100)
    progress = 100;
  else if (progress < 0) progress = 0;
  return Stack(
    children: [
      buildItemProgress(height, Get.width, AppColors.colorGreyEKYC()),
      buildItemProgress(
          height, (Get.width - 32) * progress / 100, AppColors.colorEKYC())
    ],
  ).paddingAll(AppDimens.defaultPadding);
}

Widget buildItemProgress(double height, width, Color color) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(
        Radius.circular(AppDimens.paddingEvenSmallest),
      ),
    ),
    width: width,
  );
}

Widget buildText(List<String> listTitle) {
  return SizedBox(
    width: Get.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return buildItemText(listTitle[index], index);
          },
          itemCount: listTitle.length,
          shrinkWrap: true,
        )
      ],
    ),
  ).paddingOnly(left: AppDimens.defaultPadding);
}

Widget buildItemText(String text, int index) {
  return Text(
    text,
    style: TextStyle(
      color:
          (index % 2 == 0) ? AppColors.colorTextEKYC() : AppColors.colorEKYC(),
      fontSize: 30,
      fontWeight: (index % 2 == 0) ? FontWeight.w400 : FontWeight.w500,
    ),
  );
}

Widget buildCardBase({required Widget child}) {
  return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.bg(),
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.paddingSmall)),
        // border: Border.all(color: hasFocus.value ? AppColors.colorEKYC() : Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: child);
}

Widget buildInput(TextInputModel textInputModel) {
  RxBool isObscure = textInputModel.isPassword.obs;
  return buildCardBase(
    child: Center(
      child: Obx(
        () => ListTile(
          leading:
              textInputModel.icon != null ? Icon(textInputModel.icon) : null,
          title: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(textInputModel.maxLength),
            ],
            controller: textInputModel.textEditingController,
            focusNode: textInputModel.focusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: textInputModel.hintText),
            onChanged: (value) {
              if (!textInputModel.isPassword &&
                  textInputModel.currentLength != null)
                textInputModel.currentLength!.value =
                    textInputModel.textEditingController!.text.length;
            },
            obscureText: isObscure.value,
            maxLines: isObscure.value ? 1 : null,
            onTap: () {
              // KeyBoard.hide();
              // if (!textInputModel.focusNode!.hasFocus)
              //   Future.delayed(
              //     100.milliseconds,
              //     () => {textInputModel.focusNode!.requestFocus()},
              //   );
            },
            validator: (text) {
              if (textInputModel.isValidated ?? false) {
                return FncUtils.validateField(text,
                    isEmail: textInputModel.isEmail!);
              }
              return null;
            },
          ),
          trailing: textInputModel.isPassword
              ? IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    isObscure.toggle();
                  },
                  icon: Icon(isObscure.value
                      ? Icons.visibility_off
                      : Icons.remove_red_eye),
                )
              : (textInputModel.currentLength != null)
                  ? Text(
                      '${textInputModel.currentLength!.value}/${textInputModel.maxLength}',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    )
                  : SizedBox(),
          minLeadingWidth: AppDimens.padding10,
        ),
      ),
    ),
  );
}

Widget buildFooter(String title, Function function) {
  return BaseButton.buildButton(
    title,
    () async {
      function.call();
    },
  ).paddingAll(AppDimens.paddingSmall);
}

Widget buildHint(Widget textWidget) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: AppDimens.defaultPadding,
        backgroundColor: AppColors.colorEKYC(),
        child: Icon(
          Icons.lightbulb,
          color: AppColors.bg(),
        ),
      ).paddingOnly(right: AppDimens.paddingVerySmall),
      textWidget
    ],
  ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
}

Widget buildDateInput(TextInputModel textInputModel) {
  // RxBool hasFocus = textInputModel.focusNode!.hasFocus.obs;
  return buildCardBase(
    child: Center(
      child: Container(
        child: ListTile(
          leading: Icon(Icons.date_range),
          title: TextFormField(
            controller: textInputModel.textEditingController,
            focusNode: textInputModel.focusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: textInputModel.hintText),
            readOnly: true,
            onTap: () {
              pickDatetime(textInputModel);
            },
            validator: (text) {
              return FncUtils.validateField(text,
                  isEmail: textInputModel.isEmail!);
            },
          ),
          minLeadingWidth: AppDimens.padding10,
        ),
      ),
    ),
  );
}

void pickDatetime(TextInputModel textInputModel) async {
  DatePicker.showDatePicker(
    Get.context!,
    minDateTime: DateTime.utc(DateTime.now().year - 100),
    maxDateTime: DateTime.now(),
    pickerTheme: DateTimePickerTheme(
      confirm:
          Text(AppStr.done.tr, style: TextStyle(color: AppColors.bgBtnBlue())),
      cancel:
          Text(AppStr.cancel.tr, style: TextStyle(color: AppColors.colorRed())),
    ),
    initialDateTime: convertStringToDate(
        textInputModel.textEditingController!.text.isNotEmpty
            ? textInputModel.textEditingController!.text
            : convertDateToString(DateTime.now(), PATTERN_1),
        PATTERN_1),
    dateFormat: "dd/MM/yyyy",
    pickerMode: DateTimePickerMode.date,
    onConfirm: (dateTime, List<int> index) {
      textInputModel.textEditingController!.text =
          convertDateToString(dateTime, PATTERN_1);
    },
  );
}

Widget buildChoiceInput(RadioButtonModel ratioButtonModel) {
  return Obx(
    () => Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.bg(),
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.paddingSmall)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.male),
            title: Text(ratioButtonModel.title!),
            minLeadingWidth: AppDimens.padding10,
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          ),
          Row(
            children: [
              Expanded(
                child: buildRatioButton(ratioButtonModel.choices![0],
                    ratioButtonModel.isTrue!, true),
              ),
              Expanded(
                child: buildRatioButton(ratioButtonModel.choices![1],
                    ratioButtonModel.isTrue!, false),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget buildRatioButton(String title, RxBool isTrue, bool value) {
  return GestureDetector(
    onTap: () {
      isTrue.value = value;
    },
    child: ListTile(
      horizontalTitleGap: 4,
      visualDensity: VisualDensity(vertical: -4),
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        title.tr,
      ),
      leading: Radio<bool>(
        groupValue: isTrue.value,
        value: value,
        onChanged: (bool? value) {
          isTrue.value = value!;
        },
      ),
    ).marginOnly(top: AppDimens.paddingVerySmall),
  );
}

Widget buildBaseText(
  String text, {
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? textColor,
  int? maxLine,
  double? fontSize,
}) {
  return AutoSizeText(
    text,
    textAlign: textAlign ?? TextAlign.center,
    style: Get.textTheme.bodySmall!.copyWith(
      color: textColor ?? AppColors.bg(),
      fontWeight: fontWeight,
      // overflow: TextOverflow.ellipsis,
      fontSize: fontSize ?? AppDimens.fontMedium,
    ),
    maxLines: maxLine ?? null,
  );
}
