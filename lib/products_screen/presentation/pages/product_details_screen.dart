// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:slash/core/utils/app_colors.dart';
// import 'package:slash/core/utils/app_strings.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import '../../../config.dart';
// import '../../../core/utils/styles.dart';
// import '../../domain/use_cases/get_products.dart';
// import '../manager/product_bloc.dart';
//
// class ProductDetailsScreen extends StatelessWidget {
//   const ProductDetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     int ind = ModalRoute.of(context)?.settings.arguments
//         as int; //getting the index of current item from product list page
//
//     List<Color> productColors = [Colors.red, Colors.blue, Colors.green];
//
//     Widget buildColorIcon(Color color) {
//       return Icon(Icons.circle, color: color, size: 24.0);
//     }
//
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: AppColors.secondaryColor, //change your color here
//         ),
//         title: Text(Strings.productDetails, style: Styles.textStyle3),
//         backgroundColor: AppColors.primaryColor,
//       ),
//       body: BlocProvider(
//         create: (context) =>
//             ProductBloc(getIt<ProductListUseCase>())..add(FetchAllProducts()),
//         child: BlocBuilder<ProductBloc, ProductState>(
//           builder: (context, state) {
//             var item = state.productModel?.data?[ind];
//             return state.screenStatus ==
//                     ScreenStatus
//                         .success //in this step i make sure that the images is loaded first before showing the carousal slider to avoid getting null value
//                 ? Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CarouselSlider.builder(
//                             options: CarouselOptions(
//                               animateToClosest: true,
//                               height: 350.h,
//                               aspectRatio: 16 / 9,
//                               enableInfiniteScroll: true,
//                               enlargeCenterPage: true,
//                               enlargeFactor: 0.4,
//                               scrollDirection: Axis.horizontal,
//                             ),
//                             itemCount: item?.productVariations?[0]
//                                 .productVarientImages?.length,
//                             itemBuilder: (BuildContext context, int index,
//                                     int realIndex) =>
//                                 CachedNetworkImage(
//                                     fit: BoxFit.cover,
//                                     //  height: 400.h,
//                                     imageUrl: item
//                                             ?.productVariations?[0]
//                                             .productVarientImages?[index]
//                                             .imagePath ??
//                                         "",
//                                     errorWidget: (context, url, error) =>
//                                         const Icon(Icons
//                                             .error))), //show error icon in case of any error in the image
//                         Row(children: [
//                           Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(item?.description ?? "",
//                                     style: Styles.textStyle1),
//                                 Text(item?.name ?? "",
//                                     style: Styles.textStyle1),
//                               ]),
//                           const Spacer(),
//                           Column(
//                             children: [
//                               CachedNetworkImage(
//                                   fit: BoxFit.fill,
//                                   width: 70.w,
//                                   height: 70.h,
//                                   imageUrl:
//                                       item?.brands?.brandLogoImagePath ?? "",
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error)),
//                               Text(item?.brands?.brandName ?? "",
//                                   style: Styles.textStyle1),
//                             ],
//                           )
//                         ]),
//                         Text(
//                             "${Strings.egp} ${item?.productVariations?[0].price.toString()}",
//                             style: Styles.textStyle1),
//
//                         Visibility(
//                           visible: true,
//                           child: Padding(
//                             padding: const EdgeInsets.all(20),
//                             child: Row(
//                                 children: productColors
//                                     .map((color) => buildColorIcon(color))
//                                     .toList()),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : const Center(
//                     child:
//                         CircularProgressIndicator()); // if data not loaded from api yet an empty sized box is being shown till data is getting fetched
//           },
//         ),
//       ),
//     );
//   }
// }
