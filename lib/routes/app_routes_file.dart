import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_connect/host_screen/chart_screen/dashboard_Screen.dart';
import 'package:go_connect/host_screen/host_add_car_info/add_car_info_tab_bar/car_info_tab_bar.dart';
import 'package:go_connect/host_screen/host_bookingDetails_CheckOut/bookingDetails_checkOut_page.dart';
import 'package:go_connect/host_screen/host_booking_details_screen/host_booking_details_page.dart';
import 'package:go_connect/host_screen/host_car_details_screen/host_car_details_page.dart';
import 'package:go_connect/host_screen/host_chat_screen/host_chat_page.dart';
import 'package:go_connect/host_screen/host_check_in_screen/host_check_in-page.dart';
import 'package:go_connect/host_screen/host_check_out_screen/host_check_out_page.dart';
import 'package:go_connect/host_screen/host_inbox_screen/host_inbox_screen_page.dart';
import 'package:go_connect/host_screen/host_navbar/host_nav_bar.dart';
import 'package:go_connect/host_screen/upload_photo_verification_screen/upload_photo_verification_screen.dart';
import 'package:go_connect/screens/auth_screens/create_account/create_account_page.dart';
import 'package:go_connect/screens/auth_screens/forgetPassword/forgetPasswordPage.dart';
import 'package:go_connect/screens/auth_screens/forgetPasswordOTP/forgetPasswordOTPPage.dart';
import 'package:go_connect/screens/auth_screens/onboard_screen/onboard_screen.dart';
import 'package:go_connect/screens/auth_screens/resetPassword/resetPasswordPage.dart';
import 'package:go_connect/screens/auth_screens/signIn/signIn_page.dart';
import 'package:go_connect/screens/auth_screens/verificationforAccount/verificationforAccountPage.dart';
import 'package:go_connect/screens/booking_details_screen/booking_details_page.dart';
import 'package:go_connect/screens/car_details_screen/car_details_page.dart';
import 'package:go_connect/screens/cars_screens/cars_page.dart';
import 'package:go_connect/screens/check_in_screen/check_in_page.dart';
import 'package:go_connect/screens/check_out_screen/check_out_page.dart';
import 'package:go_connect/screens/filter_by_screens/filter_by_page.dart';
import 'package:go_connect/screens/inbox_screen.dart/inbox_screen_page.dart';
import 'package:go_connect/screens/my_location_update_screen/my_location_update_screen.dart';
import 'package:go_connect/screens/navbar/nav_bar.dart';
import 'package:go_connect/screens/notification_screen/notification_page.dart';
import 'package:go_connect/screens/owner_details/owner_details_page.dart';
import 'package:go_connect/screens/profile_screen/about_us_screen/about_us_page.dart';
import 'package:go_connect/screens/profile_screen/choose_language_screen/choose_language_page.dart';
import 'package:go_connect/screens/profile_screen/delete_account_screen/delete_account_page.dart';
import 'package:go_connect/screens/profile_screen/edit_profile_screen/edit_profile_page.dart';
import 'package:go_connect/screens/profile_screen/faq_screens/faq_page.dart';
import 'package:go_connect/screens/profile_screen/favourits_screen/favourits_page.dart';
import 'package:go_connect/screens/profile_screen/password_screen/password_page.dart';
import 'package:go_connect/screens/profile_screen/profile_page.dart';
import 'package:go_connect/screens/profile_screen/re_submit_kyc_screen/re_submit_kyc_page.dart';
import 'package:go_connect/screens/profile_screen/terms_conditions_screen/terms_conditions_page.dart';
import 'package:go_connect/routes/app_routes.dart';
import 'package:go_connect/routes/bindings/authBindings.dart';
import 'package:go_connect/screens/request_booking_screen/request_booking_screen.dart';
import 'package:go_connect/screens/short_by_screen/short_by_page.dart';
import 'package:go_connect/screens/splash_screen/splash_screen.dart';

import '../host_screen/host_cars_list/host_cars_list.dart';

List<GetPage> appRouteFile = <GetPage>[
  GetPage(name: AppRoutes.initialPage, page: () => SplashScreen()),
  GetPage(name: AppRoutes.onboardScreen, page: () => OnboardScreen()),
  GetPage(name: AppRoutes.navbar, page: () => NavBar()),
  GetPage(name: AppRoutes.createAccountPage, page: () => CreateAccountPage(), binding: Authbindings()),
  GetPage(name: AppRoutes.signInPage, page: () => SigninPage(), binding: Authbindings()),
  GetPage(name: AppRoutes.verificationForAccountPage, page: () => Verificationforaccountpage(), binding: Authbindings()),
  GetPage(name: AppRoutes.forGetPasswordPage, page: () => Forgetpasswordpage(), binding: Authbindings()),
  GetPage(name: AppRoutes.forGetPasswordOtPage, page: () => Forgetpasswordotppage(), binding: Authbindings()),
  GetPage(name: AppRoutes.resetPasswordPage, page: () => Resetpasswordpage(), binding: Authbindings()),

  //////////////// Home /////////////////////
  GetPage(name: AppRoutes.notifications, page: () => const NotificationPage()),

  //////////////// Profile Page /////////////////////
  GetPage(name: AppRoutes.myLocationUpdateScreen, page: () => const MyLocationUpdateScreen()),
  GetPage(name: AppRoutes.profilePage, page: () => const ProfilePage()),
  GetPage(name: AppRoutes.editProfilePage, page: () => const EditProfilePage()),
  GetPage(name: AppRoutes.chooseLanguagePage, page: () => const ChooseLanguagePage()),
  GetPage(name: AppRoutes.reSubmitKycPage, page: () => const ReSubmitKycPage()),
  GetPage(name: AppRoutes.favoritesPage, page: () => const FavouritsPage()),
  GetPage(name: AppRoutes.passwordPage, page: () => const PasswordPage()),
  GetPage(name: AppRoutes.aboutUsPage, page: () => const AboutUsPage()),
  GetPage(name: AppRoutes.termsConditionsPage, page: () => const TermsConditionsPage()),
  GetPage(name: AppRoutes.faqPage, page: () => const FaqPage()),
  GetPage(name: AppRoutes.deleteAccountPage, page: () => const DeleteAccountPage()),

  //////////////// Home /////////////////////
  GetPage(name: AppRoutes.carsPage, page: () => const CarsPage()),
  GetPage(name: AppRoutes.carDetailsPage, page: () => const CarDetailsPage()),
  GetPage(name: AppRoutes.ownerDetailsPage, page: () => const OwnerDetailsPage()),
  GetPage(name: AppRoutes.bookingDetailsPage, page: () => const BookingDetailsPage()),
  GetPage(name: AppRoutes.checkIN, page: () => const CheckInPage()),
  GetPage(name: AppRoutes.checkOutPage, page: () => const CheckOutPage()),
  GetPage(name: AppRoutes.filterByPage, page: () => const FilterByPage()),
  GetPage(name: AppRoutes.shortByPage, page: () => const ShortByPage()),
  GetPage(name: AppRoutes.shortByPage, page: () => const ShortByPage()),

  //////////////// Home /////////////////////
  GetPage(name: AppRoutes.inboxScreenPage, page: () => const InboxScreenPage()),
  GetPage(name: AppRoutes.booking, page: () => const RequestBookingScreen()),


  ///////////////Host Section///////////
  GetPage(name: AppRoutes.hostNavBar, page: () => const HostNavBar()),
  GetPage(name: AppRoutes.hostChatPage, page: () => const HostChatPage()),
  GetPage(name: AppRoutes.hostInboxScreenPage, page: () => const HostInboxScreenPage()),
  GetPage(name: AppRoutes.addCarPage, page: () =>  AddCarPage()),
  GetPage(name: AppRoutes.dashboardScreen, page: () => DashboardScreen()),
  GetPage(name: AppRoutes.hostBookingDetailsPage, page: () => HostBookingDetailsPage()),
  GetPage(name: AppRoutes.hostCheckInPage, page: () => HostCheckInPage()),
  GetPage(name: AppRoutes.bookingDetailsCheckoutPage, page: () => BookingDetailsCheckoutPage()),
  GetPage(name: AppRoutes.hostCheckOutPage, page: () => HostCheckOutPage()),
  GetPage(name: AppRoutes.uploadPhotoVerificationScreen, page: () => UploadPhotoVerificationScreen()),
  GetPage(name: AppRoutes.hostCarDetailsPage, page: () => HostCarDetailsPage()),
  GetPage(name: AppRoutes.hostCarsList, page: () => const HostCarsList()),
];
