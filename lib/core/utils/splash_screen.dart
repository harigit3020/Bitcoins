import 'package:bitcoins/core/common/widgets/logos.dart';
import 'package:bitcoins/features/bitcoins_rates/presentation/pages/home_page.dart';
import 'package:bitcoins/features/bitcoins_rates/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final username = localStorage.getString('user_name');
    if (username != null) {
      _navigate(const HomePage());
    } else {
      _navigate(LoginPage());
    }
  }

  _navigate(route) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => route), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var sizedBox = const SizedBox(
      height: 20,
    );
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              bitcoinLogoBuilder(),
              sizedBox,
              Text('Bitcoins', style: Theme.of(context).textTheme.titleLarge),
              sizedBox,
              Text(
                'v 1.0.0', //Just as a placeholder. The version name can be get with PackageInfo.
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          SpinKitSpinningLines(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            size: 40.0,
          )
        ],
      )),
    );
  }
}
