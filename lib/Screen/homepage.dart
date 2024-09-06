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

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
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
            text: 'Movie',
            color: button,
            fontWeight: FontWeight.w600,
            size: 18.sp),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              color: text.withOpacity(0.6),
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
                    text: 'Popular Movie',
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
                future: apiController.getDataApi(Constant().popular),
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
                                    tittle: data.title.toString(),
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
                    borderRadius: BorderRadius.circular(15.r),
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
                          text: 'Upcoming',
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
                          text: 'Trending Movie',
                          color: text,
                          fontWeight: FontWeight.w500,
                          size: 14.sp),
                    )
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                FutureBuilder(
                  future: apiController.getDataApi(Constant().upComing),
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
                                    tittle: data.title.toString(),
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
                  future: apiController.getDataApi(Constant().topRated),
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
                                    tittle: data.title.toString(),
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
                  future: apiController.getDataApiTrending(),
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
                                    tittle: data.title.toString(),
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
