
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotsale_test_app/until/controller/user_controller.dart';
import 'package:hotsale_test_app/until/storage/local_storage.dart';
import 'package:hotsale_test_app/view/components/user_card_components.dart';

import '../../../until/internet/check_internet.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  var controller = Get.put(UserController());

  @override
  void iniState() {
    init();
    super.initState();
  }

  void init() async {
   
  }

  @override
  void dispose() {
    LocalStorage().clearLocalData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     
    return  Container(
        height: MediaQuery.of(context).size.height * .95 - 30,
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height * .05),
              Text(
                'Users',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black54,
                      fontSize: 40,
                    ),
              ),
              Expanded(
                  child: Obx(() => controller.isLoad.value
                      ? Center(child: CircularProgressIndicator())
                      : controller.users.isEmpty
                          ? Center(child: Text('Not found users'))
                          : ListView.builder(
                            itemCount: controller.countUsers,
                            itemBuilder: (context, i) {
                            return UserCardComponent(user: controller.users[i]);
                          }))),
            ]),
      );
  }
}
