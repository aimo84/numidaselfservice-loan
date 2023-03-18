import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/utils.dart';

class OrderSuccess extends StatefulWidget {
  _OrderSuccessState createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  String? token;
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
      body: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: SafeArea(
            child: Container(
          color: primaryColor,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: getWidth(context),
                        child: Image.asset(
                          "assets/images/success.gif",
                          height: 250.0,
                          width: 250.0,
                        ),
                      ),
                      Text(
                        "Awesome!",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "You qualify for a loan of Ksh $loanAmount",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Pay a processing fee of 10% of loan amount to get it approved instantly",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )),
              SizedBox(
                height: 240,
                width: getWidth(context),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Processing Fee",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white70),
                    ),
                    Text(
                      "Ksh $fee",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        elevation: 3,
                        child: SizedBox(
                          width: getWidth(context),
                          child: InkWell(
                            onTap: () {
                              mprefs.setString("later", "no");
                              Get.toNamed('/payapplicationfee');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "PAY NOW",
                                  style: GoogleFonts.poppins(
                                    color: primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: secondaryColor,
                        elevation: 3,
                        child: SizedBox(
                          width: getWidth(context),
                          child: InkWell(
                            onTap: () {
                              mprefs.setString("later", "yes");
                              Get.toNamed('/homepage');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "PAY LATER",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
