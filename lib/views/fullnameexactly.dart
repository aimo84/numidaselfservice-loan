import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/utils.dart';

class FullNamePage extends StatefulWidget {
  _FullNamePageState createState() => _FullNamePageState();
}

class _FullNamePageState extends State<FullNamePage> {
  String? selectedGender;
  String? selectedLanguage;
  final fullnameController = TextEditingController();
  final phoneIdController = TextEditingController();

  String loanAmount = "0";
  String fee = "0";
  String interest = "0";
  late SharedPreferences mprefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        mprefs = value;
        loanAmount = value.getString('loan_amount')!;
        fee = value.getString('fee')!;
        interest = value.getString('interest')!;
      });
    });
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 100,
                            animation: true,
                            lineHeight: 20.0,
                            animationDuration: 2000,
                            percent: 0.80,
                            center: Text(
                              "80% complete",
                              style: subtitle1,
                            ),
                            progressColor: primaryColor,
                          ),
                          Row(
                            children: [
                              Text(
                                "Principal:  $loanAmount KES / Interest: $interest",
                                style: subtitle2.copyWith(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
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
                "Enter your full name exactly as written on your National ID",
                style: subtitle.copyWith(color: Colors.grey),
              ),
              TextFormField(
                controller: fullnameController,
                decoration: InputDecoration(hintStyle: subtitle1, hintText: ""),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Is This the Phone Number registered with this ID?",
                style: subtitle.copyWith(color: Colors.grey),
              ),
              TextFormField(
                controller: phoneIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintStyle: subtitle1, hintText: ""),
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
                    if (fullnameController.text.isNotEmpty) {
                      if (phoneIdController.text.isNotEmpty) {
                        mprefs.setString('name', fullnameController.text);
                        mprefs.setString('phoneid', phoneIdController.text);
                        Get.offNamed('/photoofbusiness');
                      } else {
                        showToast("Enter Phone Number", Colors.red);
                      }
                    } else {
                      showToast("Enter Full Name", Colors.red);
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
