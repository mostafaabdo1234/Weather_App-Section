import 'package:flutter/material.dart';


class RowComponent extends StatelessWidget {
  const RowComponent({super.key, required this.status, required this.type,required this.onTap});
  final String status;
  final String type;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          status,
          style:const TextStyle(
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            type,
            style:const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}