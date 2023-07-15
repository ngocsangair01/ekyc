import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../const/colors.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double height;
  final BorderRadius? borderRadius;

  const ShimmerWidget({this.width, required this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: AppColors.baseColorShimmer(),
        highlightColor: AppColors.highlightColorShimmer(),
        child: Container(
          height: this.height,
          width: this.width ?? double.infinity,
          decoration: BoxDecoration(
              color: AppColors.colorShimmer(),
              borderRadius: this.borderRadius ?? BorderRadius.zero),
        ),
      );
}
