import 'package:flutter/material.dart';
import 'package:ekyc/const/const.dart';

abstract class BaseImage {
  static Widget getImageNetwork(
      {required String src, String placeHolder = AppStr.imgNoImage}) {
    return FadeInImage.assetNetwork(
      placeholder: placeHolder,
      image: src,
      fit: BoxFit.fill,
    );
  }

  static Widget getImageCO(String img,
      {String placeHorderAsset = AppStr.imgNoImage}) {
    return img.isNotEmpty
        ? img.startsWith('https://') || img.startsWith('http://')
            ? getImageNetwork(src: img, placeHolder: placeHorderAsset)
            : getImageNetwork(
                src: AppConst.imageUrl + '/' + img,
                placeHolder: placeHorderAsset)
        : Image.asset(placeHorderAsset);
  }

  static Widget buildLogoImage(String urlImage,
      {double? width, double? height}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppDimens.paddingVerySmall,
          AppDimens.paddingVerySmall, AppDimens.paddingVerySmall, 0),
      child: Container(
          height: height ?? 80,
          width: width ?? 80,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: AppColors.bg(),
              borderRadius: const BorderRadius.all(
                  Radius.circular(AppDimens.paddingVerySmall))),
          child: getImageCO(urlImage)),
    );
  }

  static Widget buildImageNetwork(String url) {
    return Image.network(
      url,
      fit: BoxFit.fill,
      width: double.infinity,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }
}
