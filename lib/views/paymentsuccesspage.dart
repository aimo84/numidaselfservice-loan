import 'dart:convert';

import 'package:ars_progress_dialog/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numidaselfservice/helpers/utils.dart';
import 'package:numidaselfservice/views/payapplicationfee.dart';
import 'package:numidaselfservice/views/morepage.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class PaymentSuccessPage extends StatefulWidget {
  _HomeApprovalState createState() => _HomeApprovalState();
}

class _HomeApprovalState extends State<PaymentSuccessPage> {
  int selected = 0;

  late ArsProgressDialog progressDialog = ArsProgressDialog(context,
      blur: 2,
      backgroundColor: const Color(0x33000000),
      animationDuration: const Duration(milliseconds: 500));

  late SharedPreferences mprefs;
  String loanAmount = "0";
  String fee = "0";
  String interest = "0";
  String token = "";
  int isApproved = 0;
  int isRejected = 0;
  bool hasPayments = false;
  String status = "submited";
  int referals = 0;
  String referal = "";
  double referalsperc = 0.1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        mprefs = value;
        loanAmount = value.getString('loan_amount')!;
        token = value.getString('token')!;
        fee = value.getString('fee')!;
        interest = value.getString('interest')!;
        referal = value.getString('referal_code')!;
        validateSubmit();
      });
    });
  }

  void calculaterefer(){
    if(referals > 0){
      setState(() {
        referalsperc = (double.parse(referals.toString()) / 20.0) * 100.0;
      });
    }
  }

  void validateSubmit() async {
    final mpref = await SharedPreferences.getInstance();
    progressDialog.show();

    var response = await http.get(Uri.parse("${mainUrl}checkStatus"), headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer ${mpref.getString('token')}',
    });

    Map<String, dynamic> json1 = json.decode(response.body);
    if (response.statusCode == 200) {
      if (json1['success'] == "1") {
        progressDialog.dismiss();
        setState(() {
          isApproved = json1['isApproved'];
          isRejected = json1['isRejected'];
          hasPayments = json1['hasPayments'];
          status = json1['status'];
          referals = json1['referals'];
          calculaterefer();
        });
      } else {
        progressDialog.dismiss();
        showToast(json1['message'], Colors.red);
      }
    } else {
      progressDialog.dismiss();
      showToast(json1['message'], Colors.red);
    }
  }


  Future<void> share() async {
    await FlutterShare.share(
        title: 'Numida Self Service',
        text: 'Get quick personal loans instantly. Use this code for referal $referal',
        linkUrl: 'https://flutter.dev/');
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: getHeight(context) * 0.58,
                    decoration: const BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.chat_rounded,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "NUMIDA",
                                  style: titleText3.copyWith(
                                      color: Colors.white),
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
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Help",
                                      style: subtitle1.copyWith(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 6,
                        // ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Reviewing your loan of",
                                    style: subtitle1.copyWith(
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "$loanAmount KES",
                                    style: titleText1.copyWith(
                                        color: primaryColor, fontSize: 30),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed('/agreement');
                                    },
                                    child: RichText(
                                      maxLines: 2,
                                      text: TextSpan(
                                        text: 'View',
                                        style: subtitle.copyWith(
                                            fontWeight: FontWeight.w300,
                                            color: primaryColor),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: " Loan Agreement",
                                            style: subtitle.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          const Icon(Icons.check_circle),
                                          Container(
                                            height: 30,
                                            width: 4,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                            status != "submited" ? Icons.check_circle :
                                              Icons.radio_button_off_rounded),
                                          Container(
                                            height: status != "submited" ? 30 : 45,
                                            width: 4,
                                            color: Colors.black,
                                          ),
                                          Icon(
                                             status != "submited" && status != "verified" ? Icons.check_circle :
                                              Icons.radio_button_off_rounded),
                                          Container(
                                            height: status != "submited" && status != "verified" ? 45 : 30,
                                            width: 4,
                                            color: Colors.black,
                                          ),
                                          isRejected == 1 ? const Icon(Icons.cancel, color: Colors.red,) :
                                          Icon(
                                            status != "submited" && status != "verified" && status != "reviewed" ? Icons.check_circle :
                                              Icons.radio_button_off_rounded,),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Submitted",
                                            style: subtitle1.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          Text(
                                            "Verifying",
                                            style: subtitle1.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          if(status == "submited")
                                            Text(
                                              "Please make sure you pay a processing fee of 10% of the loan amount ",
                                              style: subtitle3.copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Reviewing",
                                            style: subtitle1.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          if(status == "verifying")
                                            Text(
                                              "We are verifying your loan ",
                                              style: subtitle3.copyWith(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            isRejected == 1 ? "Rejected" :
                                            "Approved",
                                            style: subtitle1.copyWith(
                                                color: isRejected == 1 ? Colors.red : Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              "Refer atleast 20 friends for your loan to get approved faster and gain confidence with our creditors.",
                              textAlign: TextAlign.center,
                              style: subtitle3.copyWith(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Referral Code",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,),
                            ),
                            Text(
                              referal,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(left: 20),
                              width: getWidth(context),
                              child: LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 100,
                                  animation: true,
                                  lineHeight: 20.0,
                                  animationDuration: 2000,
                                  percent: referalsperc,
                                  center: Text(
                                    "$referals Referals of 20",
                                    style: subtitle1,
                                  ),
                                  progressColor: primaryColor,
                                ),
                            ),
                              const SizedBox(
                              height: 10,
                            ),
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
                                      
                                      share();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "REFER NOW",
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
                        ),
                      ),
                    ),
                  ),
                 
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
