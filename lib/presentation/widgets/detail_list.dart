import 'package:cat_breed_app/utils/color_manager.dart';
import 'package:cat_breed_app/utils/style_manager.dart';
import 'package:flutter/material.dart';

class DetailList extends StatelessWidget {
  const DetailList({super.key, required this.detail, required this.title});

  final String? detail;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Text(
            "$title: ",
            style:
                getRegularStyle(color: ColorManager.whiteColor, fontSize: 12),
          ),
          Text(
            detail ?? '',
            style:
                getRegularStyle(color: ColorManager.whiteColor, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
