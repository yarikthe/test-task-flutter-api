import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hotsale_test_app/until/controller/user_controller.dart';

import '../../components/field_detail_screen_component.dart';

class DetailUserScreen extends StatefulWidget {
  int id;
  DetailUserScreen({super.key, required this.id});

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {
  var controller = Get.put(UserController());

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    controller.single(widget.id);
  }

  @override
  void dispose() {
    controller.clearSingleUserData();
    super.dispose();
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
                            child: Image.network(
                          '${controller.singleUser?.avatar.toString() ?? '<AVATAR>'}',
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
