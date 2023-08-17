import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweet_smash_app/modules/checkout/state/checkout_state.dart';
import 'package:sweet_smash_app/modules/products/state/cart_state.dart';
import 'package:sweet_smash_app/pages/cart_page.dart';
import 'package:sweet_smash_app/pages/checkout_page.dart';
import 'package:sweet_smash_app/pages/home_page.dart';
import 'package:sweet_smash_app/pages/login_page.dart';
import 'package:sweet_smash_app/pages/register_page.dart';
import 'package:sweet_smash_app/pages/success_page.dart';
import 'package:sweet_smash_app/services/shared_service.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLoggedIn = await SharedService.isLoggedIn();

  if (isLoggedIn) {
    _defaultHome = const HomePage();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appRoutes = {
      '/': (context) => _defaultHome,
      '/home': (context) => const HomePage(),
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/cart': (context) => const CartPage(),
      '/checkout': (context) => const CheckoutPage(),
      '/success': (context) => const SuccessPage(),
    };

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartState()),
        ChangeNotifierProvider(create: (_) => CheckoutState()),
      ],
      child: MaterialApp(
        title: 'Sweet Smash',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
