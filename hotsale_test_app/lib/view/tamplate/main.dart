import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hotsale_test_app/until/internet/check_internet.dart';
import 'package:provider/provider.dart';

import '../../until/controller/user_controller.dart';

class MainTamplateScren extends StatefulWidget {
  Widget screen;

  MainTamplateScren({super.key, required this.screen});

  @override
  State<MainTamplateScren> createState() => _MainTamplateScrenState();
}

class _MainTamplateScrenState extends State<MainTamplateScren> {
  CheckConnectionToInternet? _checkInternet;

  var controller = Get.put(UserController());

  @override
  void initState() {
    _checkInternet =
        Provider.of<CheckConnectionToInternet>(context, listen: false);
    _checkInternet?.checkRealtimeConnection();

    init();
    super.initState();
  }

  void init() {
    var _statusOnline = CheckConnectionToInternet().getInternetConnectStatus();

    if (_statusOnline == 'Offline') {
      controller.localFfetch();
    } else {
      controller.fetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<CheckConnectionToInternet>(
        builder: (context, provider, child) {
      return Column(children: <Widget>[
        // SizedBox(height: 30),
        Container(
            width: double.maxFinite,
            height: 40,
            color: provider.status == "Offline" ? Colors.red : Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(provider.status)],
            )),
        widget.screen,
      ]);
    }));
  }
}
