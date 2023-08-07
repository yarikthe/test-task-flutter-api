import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hotsale_test_app/until/controller/user_controller.dart';
import 'package:hotsale_test_app/until/internet/check_internet.dart';

import '../../components/field_detail_screen_component.dart';

class DetailUserScreen extends StatefulWidget {
  int id;
  DetailUserScreen({super.key, required this.id});

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {
  var controller = Get.put(UserController());
  String? statusOnline;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    checkIsLoadFromLocalStorage();
  }

  @override
  void dispose() {
    controller.clearSingleUserData();
    super.dispose();
  }

  void checkIsLoadFromLocalStorage() async {
    var _statusOnline =
        await CheckConnectionToInternet().getInternetConnectStatus();

    if (_statusOnline == 'Offline') {
      setState(() {
        statusOnline = _statusOnline as String;
      });

      print('statusOnline ${statusOnline}');

      controller.localSingle(widget.id);
    } else {
      controller.single(widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Obx(() => controller.isUserLoad.value
            ? Center(child: CircularProgressIndicator())
            : controller.singleUser.isNull
                ? Center(child: Text('Not data about user'))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .05),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Colors.black54,
                                    fontSize: 40,
                                  ),
                            ),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: Icon(Icons.close,
                                    color: Colors.grey, size: 35))
                          ],
                        ),
                        SizedBox(height: 50),
                        Center(
                            child: FadeInImage.assetNetwork(
                          placeholderErrorBuilder: (contect, _, e) =>
                              CircularProgressIndicator(),
                          placeholder: '<AVATAR_PLACEHOLDER>',
                          imageErrorBuilder: (contect, _, e) => Padding(
                              padding: EdgeInsets.all(20),
                              child: Icon(Icons.person, size: 156)),
                          image:
                              '${controller.singleUser?.avatar.toString() ?? '<AVATAR>'}',
                          width: 150,
                        )),
                        SizedBox(height: 50),
                        FieldComponent(
                          field: 'ID',
                          value:
                              '${controller.singleUser?.id.toString() ?? '<ID>'}',
                        ),
                        FieldComponent(
                          field: 'First Name',
                          value:
                              '${controller.singleUser?.firstName.toString() ?? '<FIRST NAME>'}',
                        ),
                        FieldComponent(
                          field: 'Last Name',
                          value:
                              '${controller.singleUser?.lastName.toString() ?? '<LAST NAME>'}',
                        ),
                        FieldComponent(
                          field: 'email',
                          value:
                              '${controller.singleUser?.email.toString() ?? '<EMAIL>'}',
                        ),
                        Spacer()
                      ])),
      ),
    );
  }
}
