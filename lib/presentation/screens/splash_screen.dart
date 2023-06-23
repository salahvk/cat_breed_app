// ignore_for_file: use_build_context_synchronously
import 'package:cat_breed_app/config/route_manager.dart';
import 'package:cat_breed_app/data/repositories/get_breed.dart';
import 'package:cat_breed_app/data/repositories/get_images.dart';
import 'package:cat_breed_app/utils/asset_manager.dart';
import 'package:cat_breed_app/utils/color_manager.dart';
import 'package:cat_breed_app/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initFun();
  }

  initFun() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));
      await getImages(context);
      await getBreed(context);
      Navigator.pushReplacementNamed(context, Routes.mainScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Lottie.asset(ImageAssets.splashLottie),
            Padding(
              padding: const EdgeInsets.only(top: 500),
              child: Text(
                "Cat Brochure App",
                style: getSemiBoldtStyle(
                    fontSize: 20, color: ColorManager.textColor),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 430),
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
