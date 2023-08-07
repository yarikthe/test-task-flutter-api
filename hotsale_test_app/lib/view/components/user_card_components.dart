import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../until/internet/check_internet.dart';
import '../../until/model/user_model.dart';
import '../screen/users/detail_screen.dart';

class UserCardComponent extends StatelessWidget {
  UserModel user;
  UserCardComponent(
      {super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 5,
        margin: EdgeInsets.only(left: 5, top: 10, right: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3)),
          ],
        ),
        // padding: EdgeInsets.all(5),
        child: InkWell(
            onTap: () => Get.to(DetailUserScreen(id: user.id)),
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FadeInImage.assetNetwork(
                      placeholderErrorBuilder: (contect, _, e) => CircularProgressIndicator(),
                      placeholder: '<AVATAR_PLACEHOLDER>',
                      imageErrorBuilder: (contect, _, e) => Padding(padding: EdgeInsets.all(20), child: Icon(Icons.person, size: 70)),
                      image: user.avatar,
                      width: 150,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${user.firstName} ${user.lastName[0]}.',
                              style: Theme.of(context).textTheme.titleLarge),
                          Text(user.email,
                              style: Theme.of(context).textTheme.caption),
                        ]),
                    Icon(Icons.chevron_right, size: 30, color: Colors.grey),
                    SizedBox(width: 10)
                  ]),
            )));
  }
}
