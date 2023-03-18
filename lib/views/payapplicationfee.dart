import 'dart:convert';

import 'package:ars_progress_dialog/dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numidaselfservice/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class PayApplicationFee extends StatefulWidget {
  _PayApplicationFeeState createState() => _PayApplicationFeeState();
}

class _PayApplicationFeeState extends State<PayApplicationFee> {
  String loanAmount = "0";
  String fee = "0";
  String interest = "0";
  late SharedPreferences mprefs;
  final applicationController = TextEditingController();
  late ArsProgressDialog progressDialog = ArsProgressDialog(context,
      blur: 2,
      backgroundColor: const Color(0x33000000),
      animationDuration: const Duration(milliseconds: 500));
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
        applicationController.text = fee.toString();
      });
    });
  }

  void showAwesome() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Awesome',
      desc: 'Wait for MPESA Notification to confirm payment',
      btnCancelOnPress: () {},
      btnOkText: "Ok",
      btnOkOnPress: () {
        Get.back();
      },
    ).show();
  }

  void validateSubmit() async {
    final mpref = await SharedPreferences.getInstance();
    progressDialog.show();
    var data = {'amount': applicationController.text};
    var body = json.encode(data);
    var response = await http.post(Uri.parse("${mainUrl}payApplication"),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer ${mpref.getString('token')}',
        },
        body: body);

    Map<String, dynamic> json1 = json.decode(response.body);
    if (response.statusCode == 200) {
      if (json1['success'] == "1") {
        progressDialog.dismiss();
        showToast(json1['message'], Colors.green);
        showAwesome();
      } else if (json1['success'] == "0") {
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
      body: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        "PAY APPLICATION FEE",
                        style: titleText3,
                      )
                    ],
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      colors: [secondaryColor, primaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 90,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/money.png"))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Loan Amount",
                                style:
                                    subtitle1.copyWith(color: Colors.white70),
                              ),
                              const Spacer(),
                              Text(
                                "$loanAmount KES",
                                style: subtitle.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Application Fees",
                                style:
                                    subtitle2.copyWith(color: Colors.white70),
                              ),
                              const Spacer(),
                              Text(
                                "$fee KES",
                                style: subtitle1.copyWith(color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: primaryColor, width: 3)),
                height: 60,
                width: getWidth(context),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: applicationController,
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
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                    if (applicationController.text.isEmpty) {
                      showToast("Enter application fee", Colors.red);
                    } else {
                      if (double.parse(applicationController.text) <
                          double.parse(fee)) {
                        showToast(
                            "Make sure the application fee is paid in full",
                            Colors.red);
                      } else {
                        validateSubmit();
                      }
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
                            "SUBMIT FEES",
                            style: subtitle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
