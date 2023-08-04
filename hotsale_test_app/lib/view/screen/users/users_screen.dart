import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:hotsale_test_app/until/controller/user_controller.dart';
import 'package:hotsale_test_app/view/components/user_card_components.dart';

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

  void init() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text('Users'),
      //   actions: []),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .05),
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
      ),
    );
  }
}
