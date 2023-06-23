// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:cat_breed_app/data/providers/data_provider.dart';
import 'package:cat_breed_app/presentation/screens/cat_breed_detail_screen.dart';
import 'package:cat_breed_app/utils/color_manager.dart';
import 'package:cat_breed_app/utils/style_manager.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedCard extends StatefulWidget {
  final int index;
  const BreedCard({super.key, required this.index});

  @override
  State<BreedCard> createState() => _BreedCardState();
}

class _BreedCardState extends State<BreedCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<DataProvider>(context, listen: false);
    int maxCharacterLimit = 250;
    String description = provider.catBreed?[widget.index].description ?? '';
    String limitedDescription = description.length > maxCharacterLimit
        ? description.substring(0, maxCharacterLimit)
        : description;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CatBreedDetailScreen(
            index: widget.index,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: ColorManager.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.grey.shade300,
                      offset: const Offset(5, 8.5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.srcOver,
                      ),
                      child: FastCachedImage(
                          url:
                              "https://cdn2.thecatapi.com/images/${provider.catBreed?[widget.index].referenceImageId}.jpg",
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 150,
                              width: size.width,
                              color: ColorManager.textColor,
                            );
                          },
                          loadingBuilder: (p0, p1) {
                            return Container(
                              height: 150,
                              width: size.width,
                              color: ColorManager.lightBlue,
                            );
                          },
                          height: 150,
                          width: size.width,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //   padding: const EdgeInsets.fromLTRB(15, 100, 15, 20),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                child: Text(
                                  provider.catBreed?[widget.index].name ?? '',
                                  style: getRegularStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: size.width * .5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                limitedDescription,
                                style: getRegularStyle(
                                    color: ColorManager.whiteColor,
                                    fontSize: 9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
