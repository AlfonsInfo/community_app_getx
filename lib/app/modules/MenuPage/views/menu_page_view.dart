import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:jdlcommunity_getx/app/constants/constants.dart';

import '../controllers/menu_page_controller.dart';

class MenuPageView extends GetView<MenuPageController> {
  const MenuPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: gridMenu());
  }

  GridView gridMenu() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        menuItem(),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const Text('Friends chats'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Column(
            children: [
              Icon(FontAwesomeIcons.evernote),
              Text('Idea'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Bills & Canteen ngutang'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Forum disscusion'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Personal Space & show your todo count'),
        ),
      ],
    );
  }

  Widget menuItem() {
    return InkWell(
      onTap: (){
      },

      child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.lightBlue[200],
          child: SizedBox(
            child: Column(
              children: [
                Container(
                  height  : 120,
                  child: Image.asset(IconPaths.events)),
                const Text('Events'),
                
              ],
            ),
          ),
        ),
    );
  }
}
