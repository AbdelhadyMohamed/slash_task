import 'package:flutter/material.dart';
import 'package:slash/core/utils/app_colors.dart';
import 'package:slash/core/utils/app_strings.dart';

import '../../../core/utils/styles.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.secondaryColor, //change your color here
        ),
        title: Text(Strings.productDetails, style: Styles.textStyle3),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
