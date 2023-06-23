import 'package:cat_breed_app/utils/color_manager.dart';
import 'package:cat_breed_app/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDetail extends StatelessWidget {
  const RatingDetail({super.key, required this.rating, required this.title});

  final double? rating;
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
          RatingBar.builder(
            initialRating: rating ?? 0,
            itemSize: 20,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            ignoreGestures: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
    );
  }
}
