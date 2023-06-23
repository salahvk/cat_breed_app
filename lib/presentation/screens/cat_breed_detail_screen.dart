// ignore_for_file: use_build_context_synchronously

import 'package:cat_breed_app/data/providers/data_provider.dart';
import 'package:cat_breed_app/data/repositories/get_images.dart';
import 'package:cat_breed_app/presentation/screens/cat_image_screen.dart';
import 'package:cat_breed_app/presentation/widgets/detail_list.dart';
import 'package:cat_breed_app/presentation/widgets/external_website.dart';
import 'package:cat_breed_app/presentation/widgets/rating_widget.dart';
import 'package:cat_breed_app/utils/asset_manager.dart';
import 'package:cat_breed_app/utils/color_manager.dart';
import 'package:cat_breed_app/utils/style_manager.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatBreedDetailScreen extends StatefulWidget {
  final int index;

  const CatBreedDetailScreen({super.key, required this.index});

  @override
  State<CatBreedDetailScreen> createState() => _CatBreedDetailScreenState();
}

class _CatBreedDetailScreenState extends State<CatBreedDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<DataProvider>(context, listen: false);
    final catDetails = provider.catBreed?[widget.index];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                                "https://cdn2.thecatapi.com/images/${catDetails?.referenceImageId}.jpg",
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: size.height,
                                width: size.width,
                                color: ColorManager.textColor,
                              );
                            },
                            height: size.height,
                            width: size.width,
                            fit: BoxFit.cover),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: InkWell(
                          onTap: () async {
                            await getBreedImages(context, catDetails?.id ?? '');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CatImageScreen(
                                index: widget.index,
                              );
                            }));
                          },
                          child: const CircleAvatar(
                            child: Icon(Icons.image),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  //   padding: const EdgeInsets.fromLTRB(15, 100, 15, 20),
                                  Text(
                                    provider.catBreed?[widget.index].name ?? '',
                                    style: getRegularStyle(
                                        color: ColorManager.whiteColor,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: size.width * .8,
                                child: Text(
                                  catDetails?.description ?? '',
                                  style: getRegularStyle(
                                      color: ColorManager.whiteColor,
                                      fontSize: 9),
                                ),
                              ),
                              DetailList(
                                title: "Life Span",
                                detail: catDetails?.lifeSpan,
                              ),
                              DetailList(
                                title: "Temperament",
                                detail: catDetails?.temperament,
                              ),
                              DetailList(
                                title: "Origin",
                                detail: catDetails?.origin,
                              ),
                              RatingDetail(
                                title: "Affection Level",
                                rating: catDetails?.affectionLevel?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Adaptability",
                                rating: catDetails?.adaptability?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Child Friendly",
                                rating: catDetails?.childFriendly?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Dog Friendly",
                                rating: catDetails?.dogFriendly?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Energy Level",
                                rating: catDetails?.energyLevel?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Grooming",
                                rating: catDetails?.grooming?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Health Issues",
                                rating: catDetails?.healthIssues?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Intelligence",
                                rating: catDetails?.intelligence?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Shedding Level",
                                rating: catDetails?.sheddingLevel?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Social Needs",
                                rating: catDetails?.socialNeeds?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Stranger Friendly",
                                rating:
                                    catDetails?.strangerFriendly?.toDouble(),
                              ),
                              RatingDetail(
                                title: "Vocalisation",
                                rating: catDetails?.vocalisation?.toDouble(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text("Know More",
                                    style: getRegularStyle(
                                        color: ColorManager.whiteColor,
                                        fontSize: 22)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ExternalWebsite(
                                      url: catDetails?.wikipediaUrl,
                                      image: ImageAssets.wiki),
                                  ExternalWebsite(
                                    url: catDetails?.cfaUrl,
                                    image: ImageAssets.cfa,
                                  ),
                                  ExternalWebsite(
                                    url: catDetails?.vcahospitalsUrl,
                                    image: ImageAssets.vca,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 3),
                                    child: ExternalWebsite(
                                      url: catDetails?.vetstreetUrl,
                                      image: ImageAssets.vetStreet,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
