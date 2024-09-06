import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/Controller/favorite_controller.dart';
import 'package:movie_app/Custom%20Widget/custom_text.dart';

class DetailsPage extends StatelessWidget {
  final String image;
  final String image2;
  final String description;
  final String rating;
  final String tittle;
  const DetailsPage(
      {super.key,
      required this.image,
      required this.image2,
      required this.rating,
      required this.tittle,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.surface;
    final text = Theme.of(context).colorScheme.onSurface;
    final card = Theme.of(context).colorScheme.onPrimary;
    final favorite = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: text,
            )),
        actions: [
          Obx(() => IconButton(
              onPressed: () {
                favorite.addFavorite();
              },
              icon: favorite.isFavorite.value == true
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite,
                    ))),
        ],
      ),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 280.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: background),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 210.h,
                        width: 375.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(image),
                                fit: BoxFit.fill),
                            color: card,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Container(
                        height: 40.h,
                        width: 60.w,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(colors: [
                              const Color(0XFFFFFFFF).withOpacity(0.2),
                              const Color(0XFF252836).withOpacity(0.32),
                            ])),
                        child: Center(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star_border,
                                color: Colors.deepOrange,
                              ),
                              CustomText(
                                  text: rating,
                                  color: text,
                                  fontWeight: FontWeight.w500,
                                  size: 12.sp)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 120.w,
                      height: 165.h,
                      margin: EdgeInsets.only(left: 15.r),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(image2),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(16.r),
                          color: card),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15.r),
                        child: CustomText(
                            max: 3,
                            textOverflow: TextOverflow.ellipsis,
                            text: tittle,
                            color: text,
                            fontWeight: FontWeight.w600,
                            size: 18.sp),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: 'Description',
                      color: text,
                      fontWeight: FontWeight.w600,
                      size: 18.sp),
                  CustomText(
                      textAlign: TextAlign.start,
                      text: description,
                      color: text,
                      fontWeight: FontWeight.w200,
                      size: 17.sp)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
