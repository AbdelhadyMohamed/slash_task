import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/utils/app_colors.dart';
import 'package:slash/core/utils/routes.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../../data/models/ProductModel.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final ProductModel? productModel;
  const ProductItem(
      {required this.productModel, super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.screenDetails);
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child:
                  CachedNetworkImage // used cached image instead of normal network image to cache the images
                      (
                width: double
                    .infinity, // make the width constant to be equal in all items
                fit: BoxFit.cover,
                imageUrl: productModel?.data?[index].productVariations?[0]
                        .productVarientImages?[0].imagePath ??
                    "",
                errorWidget: (context, url, error) => const Icon(Icons
                    .error_outline), // in case of error(or nullability) in the image url
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(children: [
            SizedBox(
              width: 100.w,
              child: Flexible(
                child: Text(
                    "${productModel?.data?[index].brands?.brandName} - ${productModel?.data?[index].name}",
                    maxLines: 2,
                    //overflow: TextOverflow.fade,
                    style: Styles.textStyle1),
              ),
            ),
            const Spacer(),
            CachedNetworkImage(
                width: 35.w,
                height: 35.h,
                imageUrl:
                    productModel?.data?[index].brands?.brandLogoImagePath ?? "",
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline)),
          ]),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text("${Strings.egp}  ", style: Styles.textStyle1),
              Text(
                  productModel?.data?[index].productVariations?[0].price
                          .toString() ??
                      "",
                  style: Styles.textStyle1),
              const Spacer(),
              Icon(Icons.favorite_border_outlined,
                  color: AppColors.greyColor, size: 19.sp),
              SizedBox(width: 7.w),
              Icon(Icons.shopping_cart_rounded,
                  color: AppColors.greyColor, size: 19.sp),
            ],
          )
        ],
      ),
    );
  }
}
