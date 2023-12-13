import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';
import '../controllers/menu_page_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuPageView extends GetView<MenuPageController> {
  const MenuPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: gridMenu());
  }

  Widget gridMenu() {
    return Container(
      color: Colors.grey[200],
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          menuItem(IconPaths.events,  "Events", (){}),
          menuItem(IconPaths.friends,  "Friends", (){}),
          menuItem(IconPaths.idea,  "Idea", (){}),
          menuItem(IconPaths.discussions,  "Discussion", (){}),
          menuItem(IconPaths.bills,  "Bills", (){}),
          menuItem(IconPaths.personalSpace,  "Personal Space", (){}),
          // menuItem(),
        ],
      ),
    );
  }

  Widget menuItem(String imagePath, String text, Function callback) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [shadowMenu()]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: SizedBox(
            width: 50.w,
            height: 50.h,
            child: Column(
              children: [
                SizedBox(
                  // width: 35.w,
                  height: 39.w,
                  child: Image.asset(imagePath)),
                Text(text,style: TextStyle(color: Colors.black),),
              ],
            ),
          ),
          onTap: () {
            //print("tapped");
          },
        ),
      ),
    );
  }

  BoxShadow shadowMenu() => const BoxShadow(color: Colors.grey,blurRadius: 10,blurStyle: BlurStyle.outer );
}
