part of 'tab_navigator_view.dart';

extension MenuView on TabNavigatorView {
  List<Widget> get bodyView {
    return [
      const HomePageView(),
      const MenuPageView(),
      ProfilePageView()
    ];
  }

  BottomNavigationBar homeNavbar() {
    return BottomNavigationBar(
        selectedFontSize: 20,
        onTap: (indexTab) => controller.onTapNavigation(indexTab),
        currentIndex: controller.navIndex.value,
        items: homeNavItems);
  }

  List<BottomNavigationBarItem> get homeNavItems {
    return [
      menuHomePage(),
      menuMenu(),
      menuProfile(),
      // menuChats(),
    ];
  }
}

extension LogoutComponent on TabNavigatorView {

  snackBarInstructionForLogout() {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
        WidgetConstant.basicSnackBar(
            AppLocalizations.of(Get.context!).double_tap_for_logout));
  }
}

extension ArchiveView on TabNavigatorView {
  BottomNavigationBarItem menuMenu() => const BottomNavigationBarItem(
      label: "Menu", icon: Icon(Icons.grid_view_rounded));

  BottomNavigationBarItem menuHomePage() => const BottomNavigationBarItem(
      label: "Beranda", icon: Icon(FontAwesomeIcons.house));

  BottomNavigationBarItem menuChats() {
    return BottomNavigationBarItem(
        label: "Chat",
        icon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline_sharp)));
  }

  BottomNavigationBarItem menuProfile() {
    return const BottomNavigationBarItem(
        label: "Profil", icon: Icon(Icons.person));
  }

  GridView gridMenu() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("Activity"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const Text('Heed not the rabble'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Text('Sound of screams but the'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Who scream'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Revolution, they...'),
        ),
      ],
    );
  }
}
