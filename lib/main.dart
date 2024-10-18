import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas1mobile/app/modules/article_detail/views/medicine_view.dart';
import 'app/routes/app_pages.dart';
import 'views/medicine_view.dart'; // Make sure the path is correct if the file is in the views folder

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MedicineApp',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: MedicineView(),
    );
  }
}
