import 'package:cat_breed_app/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalWebsite extends StatelessWidget {
  const ExternalWebsite({super.key, required this.url, required this.image});

  final String? url;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        splashColor: ColorManager.primary,
        borderRadius: BorderRadius.circular(5),
        onTap: () async {
          await launchUrl(Uri.parse(url ?? ''));
        },
        child: Image.asset(
          image ?? '',
          width: 80,
          height: 80,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
