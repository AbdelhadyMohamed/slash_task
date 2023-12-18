import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/utils/app_colors.dart';
import 'package:slash/products_screen/presentation/widgets/product_item.dart';
import '../../../config.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/styles.dart';
import '../../domain/use_cases/get_products.dart';
import '../manager/product_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(Strings.slash, style: Styles.textStyle2),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductBloc(getIt<ProductListUseCase>())..add(FetchAllProducts()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
              child: GridView.builder(
                itemBuilder: (context, index) =>
                    ProductItem(productModel: state.productModel, index: index),
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 13.w /
                      23.h, // small edit in the h/w ratio of each item to look prettier
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 40.h, // spacing between rows
                  crossAxisSpacing: 40.w,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
