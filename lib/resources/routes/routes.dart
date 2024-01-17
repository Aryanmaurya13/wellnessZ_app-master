import 'package:get/get.dart';
import 'package:wellnessz_app/resources/routes/route_names.dart';
import 'package:wellnessz_app/view/client_side/client_account_view/clinet_account_view.dart';
import 'package:wellnessz_app/view/client_side/client_home_view/client_home_view.dart';
import 'package:wellnessz_app/view/client_side/client_profile_view/client_profile_view.dart';
import 'package:wellnessz_app/view/coach_side/coach_account_view/coach_account_view.dart';
import 'package:wellnessz_app/view/intro_view/intro_view.dart';
import 'package:wellnessz_app/view/login_views/signin_view.dart';
import 'package:wellnessz_app/view/login_views/verify_otp_view.dart';
import 'package:wellnessz_app/view/registration_view/registration_view.dart';
import 'package:wellnessz_app/view/splash_view/splash_view.dart';
import 'package:wellnessz_app/view/user_type_view/user_type_view.dart';

import '../../view/coach_side/coach_account_view/coach_invitefriends_view.dart';
import '../../view/coach_side/coach_account_view/coach_profile_view.dart';
import '../../view/coach_side/coach_account_view/coach_setting_view.dart';
import '../../view/coach_side/coach_account_view/coach_theme_view.dart';


class AppRoutes{
  static appRoutes()=> [

    GetPage(
      name: RouteName.splashView,
      page: ()=> const CoachInviteFriendsView(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: RouteName.introView,
      page: ()=> const IntroView(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: RouteName.userTypeView,
      page: ()=>  const UserTypeView(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: RouteName.sigInView,
      page: ()=>  const SigInView(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.verifyOtpView,
      page: ()=> const VerifyOtp(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: RouteName.registrationView,
      page: ()=>  const RegistrationView(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: RouteName.clientProfileView,
      page: ()=>  const ClientProfileView(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.clientAccountView,
      page: ()=>  const ClientAccountView(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: RouteName.clientHomeView,
      page: ()=>  const ClientHomeView(),
      transition: Transition.noTransition,
    ),

  ];
}