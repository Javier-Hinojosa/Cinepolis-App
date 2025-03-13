import 'package:Cinepolis/app/pages/login/login.controller.dart';
import 'package:Cinepolis/app/pages/login/widgets/recovery.controller.dart';
import 'package:Cinepolis/app/pages/main/home/home.controller.dart';
import 'package:Cinepolis/app/pages/main/main.controller.dart';
import 'package:Cinepolis/app/pages/profile/profile.controller.dart';
import 'package:Cinepolis/app/pages/splash/splash.controller.dart';
import 'package:Cinepolis/data/services/audit/audit.api.service.dart';
import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:Cinepolis/data/services/branch/branch.api.service.dart';
import 'package:Cinepolis/data/services/branch/branch.contract.dart';
import 'package:Cinepolis/data/services/employees/employees.contract.dart';
import 'package:Cinepolis/data/services/filemanager/file_manager.contract.dart';
import 'package:Cinepolis/data/services/menu/menu.api.service.dart';
import 'package:Cinepolis/data/services/news/news.api.service.dart';
import 'package:Cinepolis/data/services/quizzer/quizzers.api.service.dart';
import 'package:Cinepolis/data/services/summary/summary.api.service.dart';
import 'package:Cinepolis/data/services/users/users.contract.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  final IAuthService authService;
  SplashBinding(this.authService);
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(authService));
  }
}

class LoginBinding implements Bindings {
  final IUserService userService;
  final IAuthService authService;

  LoginBinding(this.userService, this.authService);

  @override
  void dependencies() {
    Get.lazyPut(() => RecoveryPasswordController(userService));
    Get.lazyPut<LoginController>(() => LoginController(authService));
  }
}

class MainBinding implements Bindings {
  final IAuthService authService;
  final IEmployeeService employeeService;

  MainBinding(this.authService, this.employeeService);

  @override
  void dependencies() {
    Get.lazyPut(
        () => MainController(authService, employeeService, MenuApiService()));
    Get.lazyPut(() => HomeController(authService, employeeService,
        SummaryApiService(), NewsApiService(), QuizzersService()));
  }
}

class ProfileBinding implements Bindings {
  final IAuthService authService;
  final IEmployeeService employeeService;

  ProfileBinding(this.authService, this.employeeService);

  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
        () => ProfileController(authService, employeeService));
  }
}

