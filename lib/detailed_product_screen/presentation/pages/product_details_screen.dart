import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/utils/app_colors.dart';
import 'package:slash/core/utils/app_strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:slash/detailed_product_screen/presentation/manager/product_details_bloc.dart';
import 'package:slash/products_screen/data/models/ProductModel.dart';
import '../../../config.dart';
import '../../../core/utils/styles.dart';
import '../../domain/use_cases/get_product_details.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)?.settings.arguments
        as Data; //getting the index of current item from product list page
    return Scaffold(
      backgroundColor: Colors.black54,
      //  backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.secondaryColor, //change your color here
        ),
        title: Text(Strings.productDetails, style: Styles.textStyle3),
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocProvider(
        create: (context) => ProductDetailsBloc(getIt<ProductDetailsUseCase>())
          ..add(FetchProductDetails(product.id.toString())),
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            //print(state.areThereColors);
            // print(state.sizesList?.length);
            // print(state.areThereMaterials);
            //  print(state.areThereSizes);
            return state.screenState ==
                    ScreenState
                        .success // in this step i make sure that the images is loaded first before showing the carousal slider to avoid getting null value
                ? SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider.builder(
                              options: CarouselOptions(
                                animateToClosest: true,
                                height: 350.h,
                                aspectRatio: 16 / 9,
                                enableInfiniteScroll: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.4,
                                scrollDirection: Axis.horizontal,
                              ),
                              itemCount: state
                                  .detailedProduct
                                  ?.data
                                  ?.variations?[state.variationIndex ?? 0]
                                  .productVarientImages
                                  ?.length,
                              itemBuilder: (BuildContext context, int index,
                                      int realIndex) =>
                                  CachedNetworkImage(
                                      fit: BoxFit.fitWidth,
                                      width: 250.w,
                                      imageUrl: product
                                              .productVariations?[0]
                                              .productVarientImages?[index]
                                              .imagePath ??
                                          "",
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons
                                              .error))), //show error icon in case of any error in the image
                          Row(children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.description ?? "",
                                      style: Styles.textStyle1),
                                  Text(product.name ?? "",
                                      style: Styles.textStyle1),
                                ]),
                            const Spacer(),
                            Column(
                              children: [
                                CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    width: 70.w,
                                    height: 70.h,
                                    imageUrl:
                                        product.brands?.brandLogoImagePath ??
                                            "",
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error)),
                                Text(product.brands?.brandName ?? "",
                                    style: Styles.textStyle1),
                              ],
                            )
                          ]),
                          Text(
                              "${Strings.egp} ${product.productVariations?[0].price.toString()}",
                              style: Styles.textStyle1),
                          SizedBox(height: 10.h),
                          state.areThereColors == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.selectColor,
                                      style: Styles.textStyle1,
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 70.w),
                                      child: SizedBox(
                                        height: 45.h,
                                        child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.w),
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: state.colorsList
                                                    ?.length, // number of available colors
                                                itemBuilder: (context, index) {
                                                  print(int.parse(
                                                          "0XFF${state.colorsList!.elementAt(index)}")
                                                      .toRadixString(
                                                          16)); // print the colors in hex code
                                                  return InkWell(
                                                    onTap: () {
                                                      getIt<ProductDetailsBloc>()
                                                          .add(ChangeImages(state
                                                                  .detailedProduct
                                                                  ?.data
                                                                  ?.avaiableProperties?[
                                                                      0]
                                                                  .values?[
                                                                      index]
                                                                  .id ??
                                                              0));
                                                    },
                                                    child: Icon(Icons.circle,
                                                        size: 50.sp,
                                                        color: Color(int.parse(
                                                            "0XFF${state.colorsList!.elementAt(index)}"))),
                                                  );
                                                })),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          SizedBox(height: 10.h),
                          state.areThereSizes == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.selectSize,
                                      style: Styles.textStyle1,
                                    ),
                                    SizedBox(height: 15.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: SizedBox(
                                        height: 40.h,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: state.sizesList?.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Container(
                                                width: 65.w,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.h,
                                                    horizontal: 20.w),
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .lightBlackColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                                child: Text(
                                                    state.sizesList!
                                                        .elementAt(index),
                                                    style: Styles.textStyle1),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          SizedBox(height: 15.h),

                          state.areThereMaterials == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.selectMaterial,
                                      style: Styles.textStyle1,
                                    ),
                                    SizedBox(height: 15.h),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: SizedBox(
                                        height: 40.h,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              state.materialsList?.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              child: Container(
                                                width: 85.w,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 8.h,
                                                    horizontal: 20.w),
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .lightBlackColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                                child: Text(
                                                    state.materialsList!
                                                        .elementAt(index),
                                                    style: Styles.textStyle1),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child:
                        CircularProgressIndicator()); // if data not loaded from api yet an empty sized box is being shown till data is getting fetched
          },
        ),
      ),
    );
  }
}
