import 'package:get/get.dart';

import '../modules/HomePage/bindings/home_page_binding.dart';
import '../modules/HomePage/views/home_page_view.dart';
import '../modules/MenuPage/bindings/menu_page_binding.dart';
import '../modules/MenuPage/views/menu_page_view.dart';
import '../modules/ProfilePage/bindings/profile_page_binding.dart';
import '../modules/ProfilePage/views/profile_page_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tab_navigator/bindings/tab_navigator_binding.dart';
import '../modules/tab_navigator/views/tab_navigator_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  static const login = Routes.login;
  static const home = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: _Paths.login,
        page: () => LoginView(),
        binding: LoginBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(seconds: 2)),
    GetPage(
      name: _Paths.home,
      page: () => const TabNavigatorView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.MENU_PAGE,
      page: () => const MenuPageView(),
      binding: MenuPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
  ];
}
