import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/modules/login/controllers/slide_show_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class SlideShowActivityImages extends GetView<SlideShowController>{
  const SlideShowActivityImages({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    var images = controller.imageList.map((image) {
      return SizedBox(
        width: 100.h,
        height: 30.h,
        child: Image.asset(image, fit: BoxFit.fill),
        );
    }).toList();
    return  Container(
      color: Colors.black,
      child: CarouselSlider(
              options: CarouselOptions(
                    height: 30.h,
                    enlargeFactor: 0.9,
                    aspectRatio: 16/9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.slowMiddle,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                ),
                 items: images,
            ),
    );
  }
}