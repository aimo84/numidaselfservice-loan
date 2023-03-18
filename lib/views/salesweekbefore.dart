import 'dart:convert';

import 'package:ars_progress_dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../controllers/aboutnumidacontroller.dart';
import '../helpers/utils.dart';

class SalesWeekBefore extends StatefulWidget {
  _SalesWeekBeforeState createState() => _SalesWeekBeforeState();
}

class _SalesWeekBeforeState extends State<SalesWeekBefore> {
  String selected = "";
  final expenditureController = TextEditingController();

  late ArsProgressDialog progressDialog = ArsProgressDialog(context,
      blur: 2,
      backgroundColor: const Color(0x33000000),
      animationDuration: const Duration(milliseconds: 500));

  String? _dropDownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void submitLogin(phone) async {
    var data = {'password': '123456', 'phone': phone};
    var body = json.encode(data);
    var response = await http.post(Uri.parse("${mainUrl}signin"),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
        },
        body: body);
    final mpref = await SharedPreferences.getInstance();
    Map<String, dynamic> json1 = json.decode(response.body);

    if (response.statusCode == 200) {
      progressDialog.dismiss();
      if (json1['success'] == "1") {
        Map<String, dynamic> user = json1['user'];
        mpref.setString("token", json1['token']);
        mpref.setString('referal_code', json1['referal_code']);
        mpref.setString("interest", json1['interest'].toString());
        mpref.setString("fee", json1['fee'].toString());
        mpref.setString("loan_amount", json1['loan_amount'].toString());
        mpref.setString("expenditure", expenditureController.text);
        mpref.setString("user_id", user['id'].toString());

        mpref.setBool('isFirst', false);

        showToast(json1['message'], Colors.green);
        Get.offNamed('/successpage');
      } else if (json1['success'] == "2") {
        showToast(json1['message'], Colors.red);
      } else {
        showToast(json1['message'], Colors.red);
      }
    } else {
      progressDialog.dismiss();
      showToast(json1['message'], Colors.red);
    }
  }

  void validateSubmit() async {
    final mpref = await SharedPreferences.getInstance();
    progressDialog.show();
    var data = {
      'name': 'none',
      'phone': mpref.getString('phone'),
      'gender': 'none',
      'employment_status': mpref.getString('employtype'),
      'expenditure': expenditureController.text,
      'referalcode': mpref.getString('referalcode'),
      'dob': 'none',
      'education_level': 'none',
      'language': 'none',
      'income': mpref.getString('income'),
      'password': '123456',
      'next_of_kin1': 'none',
      'next_of_kin2': 'none',
      'house_rent': mpref.getString('houserent'),
    };
    var body = json.encode(data);
    var response = await http.post(Uri.parse("${mainUrl}signup"),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
        },
        body: body);

    Map<String, dynamic> json1 = json.decode(response.body);
    if (response.statusCode == 200) {
      if (json1['success'] == "1") {
        progressDialog.dismiss();
        Map<String, dynamic> user = json1['user'];
        mpref.setString("token", json1['token']);
        mpref.setString("interest", json1['interest'].toString());
        mpref.setString('referal_code', json1['referal_code']);
        mpref.setString("fee", json1['fee'].toString());
        mpref.setString("loan_amount", json1['loan_amount'].toString());
        mpref.setString("expenditure", expenditureController.text);
        mpref.setString("user_id", user['id'].toString());

        mpref.setBool('isFirst', false);
        showToast(json1['message'], Colors.green);
        Get.offNamed('/successpage');
      } else if (json1['success'] == "0") {
        submitLogin(mpref.getString('phone'));
        // showToast(json1['message'], Colors.red);
      } else {
        progressDialog.dismiss();
        showToast(json1['message'], Colors.red);
      }
    } else {
      progressDialog.dismiss();
      showToast(json1['message'], Colors.red);
    }
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
                        percent: 0.40,
                        center: Text(
                          "45% complete",
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'How much ',
                    style: subtitle.copyWith(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: " is your ",
                        style: titleText4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'montly ',
                        style: subtitle.copyWith(
                            fontWeight: FontWeight.w300, color: Colors.grey),
                      ),
                      TextSpan(
                        text: " expenditure? ",
                        style: titleText4.copyWith(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Container(
                      width: getWidth(context),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "Expenditure",
                            style: titleText3.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: expenditureController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintStyle: titleText3,
                              hintText: '',
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        Text(
                          "KES",
                          style: titleText4.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
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
                    if (expenditureController.text.isNotEmpty) {
                      SharedPreferences.getInstance().then((value) {
                        value.setString(
                            'expenditure', expenditureController.text);
                        validateSubmit();
                      });
                    } else {
                      showToast("Enter your house Rent", Colors.red);
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
