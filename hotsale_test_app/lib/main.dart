
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hotsale_test_app/until/internet/check_internet.dart';
import 'package:hotsale_test_app/view/screen/users/users_screen.dart';
import 'package:hotsale_test_app/view/tamplate/main.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
          ChangeNotifierProvider(
            create: (_) => CheckConnectionToInternet(),
            child:const MyApp()
          )
        );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    return  GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainTamplateScren(screen: UsersScreen()),
    );
  }
}