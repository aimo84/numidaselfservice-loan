import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

const Color colorAcent = Color(0xFF72c66c);
const Color primaryColor = Color(0xFF1bcae9);
const Color secondaryColor = Color(0xFF0e8196);
const Color bgColor = Color(0xFFedeef9);

const Color kBlue = Color(0xFF306EFF);
const Color kLightBlue = Color(0xFF4985FD);
const Color kDarkBlue = Color(0xFF1046B3);
const Color kWhite = Color(0xFFFFFFFF);
const Color kGrey = Color(0xFFF4F5F7);
const Color kBlack = Color(0xFF2D3243);

// Padding
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 32.0;

// Spacing
const double kSpaceS = 8.0;
const double kSpaceM = 16.0;

const Duration kButtonAnimationDuration = Duration(milliseconds: 600);
const Duration kCardAnimationDuration = Duration(milliseconds: 400);
const Duration kRippleAnimationDuration = Duration(milliseconds: 400);
const Duration kLoginAnimationDuration = Duration(milliseconds: 1500);

const kGoogleApiKey = "AIzaSyCUwQCkzVToSTN9PCH2KKuIO9MjCBzS1as";

const mainUrl = "https://numida.frequencycapitalltd.com/api/";
const imageUrl = "https://numida.frequencycapitalltd.com/storage/";

const kAnimationDuration = Duration(milliseconds: 200);

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(context) {
  return MediaQuery.of(context).size.height;
}

String getdatedate(DateTime dat) {
  String formated = DateFormat('dd-MM-yyyy').format(dat).toString();
  return formated;
}

String getdatedatetime(DateTime dat) {
  String formated = DateFormat('dd-MM-yyyy HH:mm a').format(dat).toString();
  return formated;
}

String getformatSimple(DateTime dat) {
  String formated = DateFormat.yMMMd().format(dat).toString();
  return formated;
}

final titleText = GoogleFonts.poppins(
  fontSize: 42,
  fontWeight: FontWeight.bold,
);

final titleText1 = GoogleFonts.poppins(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

final titleText3 = GoogleFonts.poppins(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

final titleText4 = GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

final subtitle = GoogleFonts.poppins(
  fontSize: 18,
);

final subtitle1 = GoogleFonts.poppins(
  fontSize: 16,
);

final subtitle2 = GoogleFonts.poppins(
  fontSize: 14,
);

final subtitle3 = GoogleFonts.poppins(
  fontSize: 12,
);

final subtitle4 = GoogleFonts.poppins(
  fontSize: 10,
);

String getString(String name) {
  return name.split('-').join(" ");
}

String getdatestringformat(String date) {
  DateTime dat = DateTime.parse(date);
  if (dat.day == DateTime.now().day && dat.month == DateTime.now().month) {
    return "Today";
  }
  String formated = DateFormat.MMMd().format(dat).toString();

  return formated;
}

void showToast(message, Color color){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

const dflt = 'Default';
const noData = 'No data';
const autoRows = 'Auto rows';
const showBordersWithZebraStripes = 'Borders with Zebra';
const custPager = 'Custom pager';
const defaultSorting = 'Default sorting';
const selectAllPage = 'Select all at page';
const rowTaps = 'Row Taps';
const rowHeightOverrides = 'Row height overrides';
const fixedColumnWidth = 'Fixed column width';
const dataTable2 = 'DataTable2';
const paginatedFixedRowsCols = 'PaginatedDataTable2';
const asyncPaginatedFixedRowsCols = 'AsyncPaginatedDataTable2';
