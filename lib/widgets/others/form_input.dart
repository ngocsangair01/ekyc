import 'package:flutter/material.dart';
import 'package:ekyc/const/app_style.dart';
import 'package:ekyc/const/const.dart';
import 'package:sds_flutter/sds_flutter.dart';

class InputText extends StatelessWidget {
  final SdsTextFormFieldModel sdsTextFormFieldModel;

  InputText(this.sdsTextFormFieldModel);

  @override
  Widget build(BuildContext context) {
    return SdsTextFormField(
      SdsTextFormFieldModel(
        isReadOnly: sdsTextFormFieldModel.isReadOnly,
        onChanged: sdsTextFormFieldModel.onChanged,
        autofocus: sdsTextFormFieldModel.autofocus,
        inputFormatters: sdsTextFormFieldModel.inputFormatters,
        onNext: sdsTextFormFieldModel.onNext,
        submitFunc: sdsTextFormFieldModel.submitFunc,
        controller: sdsTextFormFieldModel.controller,
        obscureText: sdsTextFormFieldModel.obscureText,
        currentNode: sdsTextFormFieldModel.currentNode,
        validator: sdsTextFormFieldModel.validator,
        iconNextTextInputAction: sdsTextFormFieldModel.iconNextTextInputAction,
        autovalidateMode: sdsTextFormFieldModel.autovalidateMode,
        maxLengthInputForm: sdsTextFormFieldModel.maxLengthInputForm,
        maxLines: sdsTextFormFieldModel.maxLines,
        textInputType: sdsTextFormFieldModel.textInputType,
        isShowCounterText: false,
        nextNode: sdsTextFormFieldModel.nextNode,
        suffix: sdsTextFormFieldModel.suffix,
        iconLeading: Padding(
          padding: const EdgeInsets.fromLTRB(
              0, AppDimens.padding10, AppDimens.padding10, AppDimens.padding10),
          child: sdsTextFormFieldModel.iconLeading,
        ),
        prefixIconConstraints: const BoxConstraints(
            maxHeight: AppDimens.sizeImageLogo,
            maxWidth: AppDimens.sizeImageLogo,
            minHeight: AppDimens.sizeIcon,
            minWidth: AppDimens.sizeIcon),
        border: sdsTextFormFieldModel.border,
        hintText: sdsTextFormFieldModel.hintText,
        enabledBorder: sdsTextFormFieldModel.enabledBorder ??
            UnderlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.bgDisable(), width: 1.5)),
        hintStyle: AppStyle.styleTextHintText,
        filled: false,
      ),
    );
  }
}
