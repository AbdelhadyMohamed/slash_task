import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash/core/utils/routes.dart';
import 'package:slash/products_screen/presentation/pages/product_details_screen.dart';
import 'package:slash/products_screen/presentation/pages/product_screen.dart';

import 'config.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(400, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.productScreen,
          routes: {
            AppRoutes.productScreen: (context) => const ProductScreen(),
            AppRoutes.screenDetails: (context) => const ProductDetailsScreen(),
          },
        ));
  }
}
