import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:numidaselfservice/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MorePage extends StatefulWidget {
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  String name = "";
  String phone = "";
  String expenditure = "";
  String income = "";
  String rent = "";
  String employment = "";
  String token = "";
  String photo = "";
  String referal = "";

  late SharedPreferences mprefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        mprefs = value;
        name = value.getString('name')!;
        token = value.getString('token')!;
        phone = value.getString('phone')!;
        expenditure = value.getString('expenditure')!;
        employment = value.getString('employtype')!;
        income = value.getString('income')!;
        rent = value.getString('houserent')!;
        photo = value.getString('photo')!;
        referal = value.getString('referal_code')!;
      });
    });
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // const Icon(
              //   Icons.chat_rounded,
              //   color: primaryColor,
              // ),
              const Spacer(),
              Text(
                "PROFILE",
                style: titleText3.copyWith(color: Colors.black),
              ),
              const Spacer(),
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
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade200),
                child: photo != ""
                    ? Image.memory(
                        base64.decode(photo),
                        fit: BoxFit.cover,
                      )
                    : const Center()),
            const Positioned(
                right: 10, bottom: 10, child: Icon(Icons.camera_alt_outlined))
          ],
        ),
        Text(
          name,
          style: titleText3,
        ),
        Text(
          phone,
          style: subtitle1.copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey.shade200)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Name",
                      style: subtitle1.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      name,
                      style: subtitle1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "Phone Number",
                      style: subtitle1.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      phone,
                      style: subtitle1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "Monthly Rent",
                      style: subtitle1.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      rent,
                      style: subtitle1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "Monthly Expenditure",
                      style: subtitle1.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      "Ksh $expenditure",
                      style: subtitle1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "Monthly Income",
                      style: subtitle1.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(
                      "Ksh $income",
                      style: subtitle1.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      "Employment Status",
                      style: subtitle1.copyWith(color: Colors.grey),
                    ),
                    const Spacer(),
                    Text(employment,
                        style: subtitle1.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            onTap: () {
              share();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(Icons.share),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "Share And Earn",
                    style: subtitle,
                  )),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
          ),
        ),
        // Card(
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: Row(
        //       children: [
        //         const Icon(Icons.help),
        //         const SizedBox(
        //           width: 10,
        //         ),
        //         Expanded(
        //             child: Text(
        //           "Help/Contact Info",
        //           style: subtitle,
        //         )),
        //         const Icon(Icons.arrow_forward_ios_rounded)
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
