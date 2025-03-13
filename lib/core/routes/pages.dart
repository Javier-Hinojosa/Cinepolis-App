import 'package:Cinepolis/app/pages/login/login.page.dart';
import 'package:Cinepolis/app/pages/profile/profile.page.dart';
import 'package:Cinepolis/app/pages/splash/splash.page.dart';
import 'package:Cinepolis/app/widgets/menu/menu_zoom_drawer.widget.dart';
import 'package:Cinepolis/core/routes/bindings.dart';
import 'package:Cinepolis/data/services/auth/auth.api.service.dart';
import 'package:Cinepolis/data/services/branch/branch.api.service.dart';
import 'package:Cinepolis/data/services/employees/employees.api.service.dart';
import 'package:Cinepolis/data/services/filemanager/file_manager.api.service.dart';
import 'package:Cinepolis/data/services/users/users.api.service.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class Pages {
  static final authService = AuthApiService();
  static final userService = UserApiService();
  static final branchService = BranchApiService();
  static final employeeService = EmployeesApiService();
  static final fileManagerService = FileManagerApiService();

  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding(authService)),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding(userService, authService)),
    GetPage(
        name: Routes.MAIN,
        page: () => MenuZoomDrawer(),
        binding: MainBinding(authService, employeeService)),
    GetPage(
        name: Routes.PROFILE,
        page: () => ProfilePage(),
        binding: ProfileBinding(authService, employeeService))
  ];
}
