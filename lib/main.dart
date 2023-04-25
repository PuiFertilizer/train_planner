import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:train_planner/db/db_helper.dart';
import 'screens/home.dart';
import 'screens/favourite.dart';
import 'screens/planner.dart';
import 'screens/others.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DBHelper.initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(home: MyHomePage()); //หน้าหลัก
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      //สิขรีปีโตรเลี่ยม
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color.fromARGB(255, 98, 231, 173),
      navBarHeight: 70, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(0.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const Favourite(),
      const Planner(),
      const Others()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/home.png',
          height: 20,
        ),
        activeColorPrimary: const Color.fromARGB(255, 0, 0, 0),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/favourite.png',
          height: 20,
        ),
        activeColorPrimary: const Color.fromARGB(255, 0, 0, 0),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/travelplan.png',
          height: 20,
        ),
        activeColorPrimary: const Color.fromARGB(255, 0, 0, 0),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          'assets/images/otherinfo.png',
          height: 20,
        ),
        activeColorPrimary: const Color.fromARGB(255, 0, 0, 0),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
