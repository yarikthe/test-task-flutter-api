import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FieldComponent extends StatelessWidget {
  String field;
  String value;
  FieldComponent({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(field, style: Theme.of(context).textTheme.caption),
        Spacer(),
        Text(value, style: Theme.of(context).textTheme.titleLarge),
      ]),
    );
  }
}
