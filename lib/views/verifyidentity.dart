import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/utils.dart';

class VerifyIdentity extends StatefulWidget {
  _VerifyIdentityState createState() => _VerifyIdentityState();
}

class _VerifyIdentityState extends State<VerifyIdentity> {
  String? selectedKinone;
  String? selectedLanguage;
  final ImagePicker _picker = ImagePicker();
  late File _image;
  String? base64Image;
  String? base64Imageback;
  
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

  Future<void> onImageButtonPressed(ImageSource source, from) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {}
      if (pickedFile != null) {
        if (from == "front") {
          setState(() {
            base64Image = base64Encode(_image.readAsBytesSync());
          });
        } else {
          setState(() {
            base64Imageback = base64Encode(_image.readAsBytesSync());
          });
        }
      }
    } catch (e) {}
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
                            percent: 0.70,
                            center: Text(
                              "70% complete",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Verify your identity by taking a photo of the FRONT of your ID",
                  style: subtitle.copyWith(color: Colors.grey),
                ),
              ),
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey, width: 3)),
                child: InkWell(
                  onTap: () {
                    onImageButtonPressed(ImageSource.camera, 'front');
                  },
                  child: base64Image != null
                      ? Image.memory(
                          base64.decode(base64Image!),
                          fit: BoxFit.contain,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.camera_alt,
                              size: 60,
                              color: Colors.white,
                            ),
                            Text(
                              "Tap to take photo",
                              style: subtitle4.copyWith(color: Colors.grey),
                            )
                          ],
                        ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Verify your identity by taking a photo of the BACK of your ID",
                  textAlign: TextAlign.center,
                  style: subtitle.copyWith(color: Colors.grey),
                ),
              ),
              Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey, width: 3)),
                child: InkWell(
                  onTap: () {
                    onImageButtonPressed(ImageSource.camera, 'back');
                  },
                  child: base64Imageback != null
                      ? Image.memory(
                          base64.decode(base64Imageback!),
                          fit: BoxFit.contain,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.camera_alt,
                              size: 60,
                              color: Colors.white,
                            ),
                            Text(
                              "Tap to take photo",
                              style: subtitle4.copyWith(color: Colors.grey),
                            )
                          ],
                        ),
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
                    if (base64Image != null) {
                      if (base64Imageback != null) {
                        mprefs.setString('frontid', base64Image!);
                        mprefs.setString('backid', base64Imageback!);
                        Get.offNamed('/fullnamepage');
                      } else {
                        showToast("Select back image of id", Colors.red);
                      }
                    }else {
                        showToast("Select front image of id", Colors.red);
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
