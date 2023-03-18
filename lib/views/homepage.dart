import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:numidaselfservice/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
      backgroundColor: primaryColor,
      body: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: SafeArea(
            child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "NUMIDA",
                          style: titleText3.copyWith(color: Colors.white),
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
                              style: subtitle1.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
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
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/money.png'))),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "You qualify for up to:",
                                    style:
                                        subtitle1.copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "$loanAmount KES",
                                    style: titleText1.copyWith(
                                        color: Colors.black, fontSize: 30),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed('/enterkyc');
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.edit_square,
                                  color: primaryColor,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "EDIT LOAN",
                                  style: titleText4.copyWith(color: primaryColor),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 20,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  width: getWidth(context),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Loan Terms",
                                  style: subtitle1.copyWith(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Loan Terms",
                                        style: subtitle1.copyWith(
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      "$loanAmount KES",
                                      style: subtitle1.copyWith(
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Loan Interest",
                                        style: subtitle1.copyWith(
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Text(
                                      "$interest KES",
                                      style: subtitle1.copyWith(
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Total Due",
                                        style: subtitle.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "${double.parse(loanAmount) + double.parse(interest)} KES",
                                      style: subtitle1.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Due in 60 Days",
                                  style: subtitle1.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Padding(
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
                        Get.toNamed('/enterkyc');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "CONTINUE APPLICATION",
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
                ))
          ],
        )),
      ),
    );
  }
}
