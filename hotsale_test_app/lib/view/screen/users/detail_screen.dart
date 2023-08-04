import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class DetailUserScreen extends StatefulWidget {
  const DetailUserScreen({super.key});

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Detail',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black54,
                          fontSize: 40,
                        ),
                  ),
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.close, color: Colors.grey, size: 35))
                ],
              ),
              SizedBox(height: 50),
              Center(child:  Image.network(
                'https://reqres.in/img/faces/2-image.jpg',
              )),
              Spacer(),
              Text('ID', style: Theme.of(context).textTheme.titleLarge),
              Spacer(),
              Text('NAME', style: Theme.of(context).textTheme.titleLarge),
              Spacer(),
              Text('email', style: Theme.of(context).textTheme.caption),
              Spacer()
            ]),
      ),
    );
  }
}
