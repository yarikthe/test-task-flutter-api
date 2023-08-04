import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/users/detail_screen.dart';

class UserCardComponent extends StatelessWidget {
  int id;
  UserCardComponent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 5),
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
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: () => Get.to(DetailUserScreen()),
        child: ListTile(
        leading:  Image.network(
          'https://reqres.in/img/faces/2-image.jpg',
          height: 50,
        ),
        title:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('NAME ${id}', style: Theme.of(context).textTheme.titleLarge),
          Text('email', style: Theme.of(context).textTheme.caption),
        ]),
        trailing:  Icon(Icons.chevron_right, size: 30, color: Colors.grey)
      )
      )
    );
  }
}
