import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final void Function() onTap;

  const CustomCard({
    super.key,
    required this.image,
   required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Theme.of(context).colorScheme.onPrimary;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 144.61.w,
        height: 210.h,
        margin: const EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(16.r),
            color: card),
      ),
    );
  }
}
