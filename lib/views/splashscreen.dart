import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/utils.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      SharedPreferences.getInstance().then((value) {
        if (value.getString('finalprocess') != null) {
          Get.offNamed('/homeapproval');
        } else if (value.getString('phone') == null) {
          Get.offNamed('/start');
        }else if (value.getString('about') == null) {
          Get.offNamed('/about');

        }else if (value.getString('overyears') == null) {
          Get.offNamed('/over18years');

        }else if (value.getString('income') == null) {
          Get.offNamed('/monthlyincome');

        }else if (value.getString('nationalid') == null) {
          Get.offNamed('/havenationalid');

        }else if (value.getString('mobilemoney') == null) {
          Get.offNamed('/mobilemoney');
        }
        else if (value.getString('employtype') == null) {
          Get.offNamed('/howlongpage');

        } else if (value.getString('houserent') == null) {
          Get.offNamed('/salesmade');
        }else if (value.getBool('isFirst') == null) {
          Get.offNamed('/weekbefore');

        }else if (value.getString('later') == null) {
          Get.offNamed('/successpage');
        }else if (value.getString('finalprocess') == null) {
          Get.offNamed('/homepage');

        }else if (value.getString('token') != null) {
          Get.offNamed('/homeapproval');
        }else{
          Get.offNamed('/start');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/numidanames.jpeg"))),
            ),
          ],
        )),
      ),
    );
  }
}
