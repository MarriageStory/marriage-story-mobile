import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'routes/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ResponsiveSizer(
      builder: (context,orientation, screenType) {
        return GetMaterialApp(
          title: 'Marriage Story',
          theme: ThemeData(
            fontFamily: 'Nunito'
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initial,
          getPages: AppPages.pages,
        );
      }
    );
  }
}

