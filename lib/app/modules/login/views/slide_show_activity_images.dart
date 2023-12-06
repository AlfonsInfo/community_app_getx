import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/modules/login/controllers/slide_show_controller.dart';

class SlideShowActivityImages extends GetView<SlideShowController>{
  const SlideShowActivityImages({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    var images = controller.imageList.map((image) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Image.asset(image, fit: BoxFit.cover),
        );
    }).toList();
    return  Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CarouselSlider(
                options: CarouselOptions(
                      height: 200,
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
      ),
    );
  }
}