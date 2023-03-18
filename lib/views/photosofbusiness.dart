import 'dart:convert';
import 'dart:io';

import 'package:ars_progress_dialog/dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../helpers/utils.dart';

class PhotoofBusiness extends StatefulWidget {
  _PhotoofBusinessState createState() => _PhotoofBusinessState();
}

class _PhotoofBusinessState extends State<PhotoofBusiness> {
  String? selectedKinone;
  String? selectedEducation;
  String? selectedLanguage;

  String loanAmount = "0";
  String fee = "0";
  String interest = "0";
  late SharedPreferences mprefs;
  final ImagePicker _picker = ImagePicker();
  late File _image;
  late ArsProgressDialog progressDialog = ArsProgressDialog(context,
      blur: 2,
      backgroundColor: const Color(0x33000000),
      animationDuration: const Duration(milliseconds: 500));
  String? base64Image;

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
        setState(() {
          base64Image = base64Encode(_image.readAsBytesSync());
        });
      }
    } catch (e) {}
  }

  void showAwesome() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Awesome',
      desc:
          'Your loan application has been submitted successfuly. Make sure you pay an application fee of Ksh $fee to get approved.',
      btnCancelOnPress: () {
        Get.toNamed('/homeapproval');
      },
      btnOkText: "Pay Now",
      btnOkOnPress: () {
        Get.toNamed('/payapplicationfee');
      },
    ).show();
  }

  void validateSubmit() async {
    final mpref = await SharedPreferences.getInstance();
    progressDialog.show();
    mprefs.setString('photo', base64Image!);
    var data = {
      'name': mpref.getString('name'),
      'user_id': mprefs.getString('user_id'),
      'gender': mpref.getString('gender'),
      'education_level': mpref.getString('education'),
      'language': mpref.getString('language'),
      'dob': mpref.getString('dob'),
      'next_of_kin1': mpref.getString('kinone'),
      'next_of_kin2': mpref.getString('kintwo')
    };
    var body = json.encode(data);
    var response = await http.post(Uri.parse("${mainUrl}updateUser"),
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
        mpref.setString('finalprocess', 'yes');
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
                            percent: 0.90,
                            center: Text(
                              "90% complete",
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Take a photo of ',
                    style: subtitle.copyWith(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                    children: <TextSpan>[
                      TextSpan(
                        text: " yourself",
                        style: titleText4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
                      :  Column(
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
                      validateSubmit();
                    } else {
                      showToast("Select your image", Colors.red);
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
                            "SUBMIT",
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
