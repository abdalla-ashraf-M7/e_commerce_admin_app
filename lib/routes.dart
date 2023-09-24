import 'package:admin_ecommerce/view/screens/cats/add.dart';
import 'package:admin_ecommerce/view/screens/cats/edit.dart';
import 'package:admin_ecommerce/view/screens/cats/view.dart';
import 'package:admin_ecommerce/view/screens/homescreen.dart';
import 'package:admin_ecommerce/view/screens/items/add.dart';
import 'package:admin_ecommerce/view/screens/items/edit.dart';
import 'package:admin_ecommerce/view/screens/items/view.dart';
import 'package:admin_ecommerce/view/screens/notifications/notificationsendscreen.dart';
import 'package:admin_ecommerce/view/screens/orders/accepted.dart';
import 'package:admin_ecommerce/view/screens/orders/orderdetails.dart';
import 'package:get/get.dart';
import 'core/constants/approutes.dart';
import 'core/middleware/mymiddleware.dart';
import 'view/screens/auth/forgetpassword/forgetpasswordscreen.dart';
import 'view/screens/auth/forgetpassword/resetpasswordscreen.dart';
import 'view/screens/auth/forgetpassword/sucessressetpasswordscreen.dart';
import 'view/screens/auth/login.dart';
import 'view/screens/orders/archive.dart';
//import 'view/screens/orders/orderdetails.dart';
import 'view/screens/orders/pendings.dart';
import 'view/screens/orders/orderscreen.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: Approutes.language, page: () => const LogInScreen(), middlewares: [MyMiddleWare()]),
  GetPage(name: Approutes.login, page: () => const LogInScreen()),
  // GetPage(name: "/", page: () => Test()),
  GetPage(name: Approutes.notifications, page: () => NotificationSendScreen()),

  //GetPage(name: Approutes.onboarding, page: () => const OnBoardingScreen()),

  //GetPage(name: Approutes.signup, page: () => const SignUpScreen()),
  GetPage(name: Approutes.forgetpassword, page: () => const ForgetPasswordScreen()),
  // GetPage(name: Approutes.verifycode, page: () => const VerifyCodeScreen()),
  GetPage(name: Approutes.ressetpassword, page: () => const RessetPasswordScreen()),
  //GetPage(name: Approutes.verifyemailsignup, page: () => const VerifyEmailSignupScreen()),
  // GetPage(name: Approutes.sucesssignup, page: () => const ScuccessSignUpScreen()),
  GetPage(name: Approutes.sucessressetpassword, page: () => const ScuccessRessetPasswordScreen()),
  GetPage(name: Approutes.orderscreen, page: () => const OrderScreen()),
  GetPage(name: Approutes.homescreen, page: () => const HomeScreen()),
  // GetPage(name: Approutes.items, page: () => const ItemsScreen()),
  //GetPage(name: Approutes.itemsdetails, page: () => const ItemsDetailsScreen()),
  //GetPage(name: Approutes.favorite, page: () => const MyfavScreen()),
  //GetPage(name: Approutes.cart, page: () => const CartScreen()),
  //GetPage(name: Approutes.address, page: () => const AddressViewScreen()),
  // GetPage(name: Approutes.addNewAddress, page: () => const AddNewAddress()),
  //GetPage(name: Approutes.addressDetails, page: () => const AddressDetailsScreen()),
  //GetPage(name: Approutes.checkout, page: () => const PaymentMethodScreen()),
  GetPage(name: Approutes.pendings, page: () => PendingsScreen()),
  //GetPage(name: Approutes.notifications, page: () => NotificationScreen()),
  GetPage(name: Approutes.orderdetails, page: () => OrderDetailsScreen()),
  GetPage(name: Approutes.archive, page: () => ArchiveScreen()),
  GetPage(name: Approutes.catsview, page: () => ViewCatsScreen()),
  GetPage(name: Approutes.catsadd, page: () => AddCatsScreen()),
  GetPage(name: Approutes.catsedit, page: () => EditCatsScreen()),
  GetPage(name: Approutes.itemsview, page: () => ViewItemsScreen()),
  GetPage(name: Approutes.itemsadd, page: () => AddItemsScreen()),
  GetPage(name: Approutes.itemsedit, page: () => EditItemsScreen()),
  GetPage(name: Approutes.accepted, page: () => AcceptdScreen()),
  //GetPage(name: "/", page: () => const PaymentMethodScreen()),
];
