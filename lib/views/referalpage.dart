import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/utils.dart';

class ReferalPage extends StatefulWidget {
  _FullNamePageState createState() => _FullNamePageState();
}

class _FullNamePageState extends State<ReferalPage> {
  String? selectedGender;
  String? selectedLanguage;
  final codeController = TextEditingController();

  late SharedPreferences mprefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 100,
                            animation: true,
                            lineHeight: 20.0,
                            animationDuration: 2000,
                            percent: 0.80,
                            center: Text(
                              "28% complete",
                              style: subtitle1,
                            ),
                            progressColor: primaryColor,
                          ),
                    ),
                    InkWell(
                       onTap: () {
                  
                  Get.toNamed('/agreement');
                },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.help,
                            color: primaryColor,
                          ),
                          Text(
                            "Help",
                            style: subtitle1.copyWith(color: primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Have you been referred by a friend?",
                style: subtitle.copyWith(color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: codeController,
                  decoration: InputDecoration(hintStyle: subtitle1, hintText: "Enter Referral Code"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: [secondaryColor, primaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter),
                ),
                child: InkWell(
                  onTap: () {
                    if(codeController.text.isNotEmpty){
                          SharedPreferences.getInstance().then((value) {
                            value.setString('referalcode', codeController.text);
                            Get.offNamed('/howlongpage');
                          });
                    }else{
                      SharedPreferences.getInstance().then((value) {
                            value.setString('referalcode', 'none');
                            Get.offNamed('/howlongpage');
                          });

                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "NEXT",
                            style: subtitle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
