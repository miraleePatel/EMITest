import 'package:emi_app/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'Routes/router.dart';


void main() {
  runApp(const MyApp());
}
const Color darkBlue = Color.fromARGB(0, 0, 0, 0);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'EMI App',
          // builder: EasyLoading.init(),
            theme: ThemeData(
              useMaterial3: false,
       ),
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL_ROUTE,
          debugShowCheckedModeBanner: false,
          // scrollBehavior: AppScrollBehavior(),
          // home:DashboardScreen(),
        );
      },
    );
  }
}

