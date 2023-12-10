part of 'home_view.dart';

extension MenuView on HomeView {
  
  List<Widget> get bodyView{
    return [
      Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: (){}, child: const Text("PUSH")),
      ),
      const Text("1"),
      const Text("1")
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




extension ArchiveView on HomeView {


  BottomNavigationBarItem menuMenu() => const BottomNavigationBarItem(label : "Menu", icon : Icon(Icons.grid_view_rounded));

  BottomNavigationBarItem menuHomePage() => const BottomNavigationBarItem(label: "Beranda",icon: Icon(FontAwesomeIcons.house));


  BottomNavigationBarItem menuChats() {
  return BottomNavigationBarItem(
    label: "Chat",
    icon: IconButton(onPressed: (){}, icon: const Icon(Icons.chat_bubble_outline_sharp)));
  }

  BottomNavigationBarItem menuProfile() {
  return const BottomNavigationBarItem(
      label: "Profil",
      icon:  Icon(Icons.person));
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
