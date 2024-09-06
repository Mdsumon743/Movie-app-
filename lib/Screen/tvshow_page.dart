import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/Constant/const.dart';
import 'package:movie_app/Custom%20Widget/custom_card.dart';
import 'package:movie_app/Custom%20Widget/custom_card2.dart';
import 'package:movie_app/Custom%20Widget/custom_text.dart';
import 'package:movie_app/Screen/details_page.dart';
import 'package:movie_app/Service/api_service.dart';

class TvShowPage extends StatefulWidget {
  const TvShowPage({super.key});

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.surface;
    final text = Theme.of(context).colorScheme.onSurface;
    final button = Theme.of(context).colorScheme.primary;
    final card = Theme.of(context).colorScheme.onPrimary;
    TabController tabController = TabController(length: 3, vsync: this);
    final apiController = Get.put(ApiService());
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: background,
        title: CustomText(
            text: 'Tv Show',
            color: button,
            fontWeight: FontWeight.w600,
            size: 18.sp),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: text.withOpacity(0.9),
            )),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 16.r,
              backgroundColor: text,
              backgroundImage: const AssetImage('assets/images/men.jpg'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: 'Popular Tv Show',
                    color: text,
                    fontWeight: FontWeight.w500,
                    size: 18.sp),
                CustomText(
                    text: 'See more',
                    color: button,
                    fontWeight: FontWeight.w500,
                    size: 14.sp),
              ],
            ),
            SizedBox(
              height: 220.h,
              width: double.infinity,
              child: FutureBuilder(
                future: apiController.getDataApiTv(Constant().popular),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: button,
                    ));
                  } else {
                    return CarouselSlider.builder(
                        itemCount: snapshot.data!.results!.length,
                        itemBuilder: (context, index, realIndex) {
                          var data = snapshot.data!.results![index];
                          return CustomCard(
                            onTap: () {
                              Get.to(
                                  DetailsPage(
                                    description: data.overview.toString(),
                                    tittle: data.originalName.toString(),
                                    rating:
                                        data.voteAverage!.toStringAsFixed(2),
                                    image2:
                                        'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].posterPath.toString()}',
                                    image:
                                        'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].backdropPath.toString()}',
                                  ),
                                  transition: Transition.leftToRight);
                            },
                            image:
                                'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].posterPath.toString()}',
                          );
                        },
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.4,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 600),
                          autoPlayCurve: Curves.easeInOut,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.1,
                          scrollDirection: Axis.horizontal,
                        ));
                  }
                },
              ),
            ),
            Card(
              color: card,
              child: TabBar(
                  dividerColor: background,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: button,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabController,
                  tabAlignment: TabAlignment.start,
                  dragStartBehavior: DragStartBehavior.down,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: CustomText(
                          text: 'Airing Today',
                          color: text,
                          fontWeight: FontWeight.w500,
                          size: 14.sp),
                    ),
                    Tab(
                      child: CustomText(
                          text: 'Top Rated',
                          color: text,
                          fontWeight: FontWeight.w500,
                          size: 14.sp),
                    ),
                    Tab(
                      child: CustomText(
                          text: 'On The Air',
                          color: text,
                          fontWeight: FontWeight.w500,
                          size: 14.sp),
                    )
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                FutureBuilder(
                  future: apiController.getDataApiTv(Constant().airToday),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: button,
                      ));
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                childAspectRatio: 0.65,
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.results![index];
                          return CustomCard2(
                            onTap: () {
                              Get.to(
                                  DetailsPage(
                                    description: data.overview.toString(),
                                    tittle: data.originalName.toString(),
                                    rating:
                                        data.voteAverage!.toStringAsFixed(2),
                                    image2:
                                        'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].posterPath.toString()}',
                                    image:
                                        'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].backdropPath.toString()}',
                                  ),
                                  transition: Transition.leftToRight);
                            },
                            image:
                                'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].posterPath}',
                          );
                        },
                        itemCount: snapshot.data!.results!.length,
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: apiController.getDataApiTv(Constant().topRated),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: button,
                      ));
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                childAspectRatio: 0.65,
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.results![index];
                          return CustomCard2(
                            onTap: () {
                              Get.to(
                                  DetailsPage(
                                    description: data.overview.toString(),
                                    tittle: data.originalName.toString(),
                                    rating:
                                        data.voteAverage!.toStringAsFixed(2),
                                    image2:
                                        'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].posterPath.toString()}',
                                    image:
                                        'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].backdropPath.toString()}',
                                  ),
                                  transition: Transition.leftToRight);
                            },
                            image:
                                'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].posterPath}',
                          );
                        },
                        itemCount: snapshot.data!.results!.length,
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: apiController.getDataApiTv(Constant().onTheAir),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        color: button,
                      ));
                    } else {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                childAspectRatio: 0.65,
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.results![index];
                          return CustomCard2(
                            onTap: () {
                              Get.to(
                                  DetailsPage(
                                    description: data.overview.toString(),
                                    tittle: data.originalName.toString(),
                                    rating:
                                        data.voteAverage!.toStringAsFixed(2),
                                    image2:
                                        'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].posterPath.toString()}',
                                    image:
                                        'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].backdropPath.toString()}',
                                  ),
                                  transition: Transition.leftToRight);
                            },
                            image:
                                'https://image.tmdb.org/t/p/original${snapshot.data!.results![index].posterPath}',
                          );
                        },
                        itemCount: snapshot.data!.results!.length,
                      );
                    }
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
