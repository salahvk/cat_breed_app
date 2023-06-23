import 'package:carousel_slider/carousel_slider.dart';
import 'package:cat_breed_app/data/providers/data_provider.dart';
import 'package:cat_breed_app/utils/color_manager.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatImageScreen extends StatefulWidget {
  final int index;
  const CatImageScreen({super.key, required this.index});

  @override
  State<CatImageScreen> createState() => _CatImageScreenState();
}

class _CatImageScreenState extends State<CatImageScreen> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final catDetails = provider.catBreed?[widget.index];
    final List<Widget> imageSliders = provider.catBreedImages!
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      FastCachedImage(
                          url: item.url ?? '',
                          fit: BoxFit.cover,
                          loadingBuilder: (p0, p1) {
                            return Container(
                              height: 250,
                              width: size.width,
                              color: ColorManager.lightBlue,
                            );
                          },
                          width: 1000.0),
                    ],
                  )),
            ))
        .toList();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.7),
                BlendMode.srcOver,
              ),
              child: FastCachedImage(
                  url:
                      "https://cdn2.thecatapi.com/images/${catDetails?.referenceImageId}.jpg",
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: size.height,
                      width: size.width,
                      color: ColorManager.textColor,
                    );
                  },
                  loadingBuilder: (p0, p1) {
                    return Container(
                      height: size.height,
                      width: size.width,
                      color: ColorManager.lightBlue,
                    );
                  },
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.cover),
            ),
            Center(
              child: SizedBox(
                width: size.width,
                // height: size.height,
                child: CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      autoPlay: true,
                      // height: size.height * .6,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      // aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
