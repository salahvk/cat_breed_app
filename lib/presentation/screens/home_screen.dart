import 'package:carousel_slider/carousel_slider.dart';
import 'package:cat_breed_app/data/providers/data_provider.dart';
import 'package:cat_breed_app/presentation/widgets/breed_card.dart';
import 'package:cat_breed_app/utils/color_manager.dart';
import 'package:cat_breed_app/utils/style_manager.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final List<Widget> imageSliders = provider.catImages!
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  "Cat Brochure App",
                  style: getSemiBoldtStyle(
                      color: ColorManager.textColor, fontSize: 25),
                ),
              ),
              SizedBox(
                width: size.width,
                child: CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: provider.catBreed?.length,
                  itemBuilder: (ctx, index) {
                    return BreedCard(
                      index: index,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
