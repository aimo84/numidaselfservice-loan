import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../helpers/utils.dart';

class CurrentlyinBusiness extends StatefulWidget {
  _CurrentlyinBusinessState createState() => _CurrentlyinBusinessState();
}

class _CurrentlyinBusinessState extends State<CurrentlyinBusiness> {
  String? selectedKinone;
  String selected = "";
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
                                "Principal:  25,000 KES / Interest: 2,000",
                                style: subtitle2.copyWith(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
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
                    )
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 50,
              ),

              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.shade100
                ),
                child: const Center(
                  child: Icon(Icons.back_hand_outlined, size: 90, color: Colors.black54,),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "We require photos of your business before we can give you a loan.",
                    textAlign: TextAlign.center,
                    style: subtitle.copyWith(color: Colors.grey),
                  ),
              ),

              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "Are you currently at your business?",
                    style: subtitle.copyWith(color: Colors.grey),
                  ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = "yes";
                      });
                    },
                    child: Text(
                      "Yes",
                      style: subtitle1.copyWith(),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = "yes";
                      });
                    },
                    child: selected == "yes" ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank)),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = "no";
                      });
                    },
                    child: Text(
                      "No",
                      style: subtitle1.copyWith(),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = "no";
                      });
                    },
                    child: selected == "no" ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank)),
                ],
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
                    Get.offNamed('/photoofbusiness');
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
