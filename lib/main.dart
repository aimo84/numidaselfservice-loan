import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numidaselfservice/views/aboutnumida.dart';
import 'package:numidaselfservice/views/fullnameexactly.dart';
import 'package:numidaselfservice/views/over18years.dart';
import 'package:numidaselfservice/views/havenationalid.dart';
import 'package:numidaselfservice/views/homeapproval.dart';
import 'package:numidaselfservice/views/homepage.dart';
import 'package:numidaselfservice/views/howlonginbusiness.dart';
import 'package:numidaselfservice/views/loanagreement.dart';
import 'package:numidaselfservice/views/mobilemoney.dart';
import 'package:numidaselfservice/views/payapplicationfee.dart';
import 'package:numidaselfservice/views/paymentsuccesspage.dart';
import 'package:numidaselfservice/views/photosofbusiness.dart';
import 'package:numidaselfservice/views/referalpage.dart';
import 'package:numidaselfservice/views/salesweekbefore.dart';
import 'package:numidaselfservice/views/splashscreen.dart';
import 'package:numidaselfservice/views/startpage.dart';
import 'package:numidaselfservice/views/successpage.dart';
import 'package:numidaselfservice/views/monthlyincome.dart';
import 'package:numidaselfservice/views/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/aboutnumidacontroller.dart';
import 'views/currentlyinbusiness.dart';
import 'views/enterkycdetails.dart';
import 'views/nextofkin.dart';
import 'views/salesmadelastweek.dart';
import 'views/verifyidentity.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initdependencies();
  runApp(const MyApp());
}

Future initdependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences);
  Get.lazyPut(() => AboutController());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowMaterialGrid: false,
      initialRoute: '/splash',
      defaultTransition: Transition.cupertino,
      getPages: [
        GetPage(name: '/splash', page: () => SplashScreen()),

        GetPage(
            name: '/welcome',
            page: () => WelcomePage(),
            customTransition: SizeTransitions()),
        GetPage(
            name: '/about',
            page: () => AboutNumida(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/start',
            page: () => StartPage(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/over18years',
            page: () => Over18Years(),
            customTransition: SizeTransitions()),

          GetPage(
            name: '/monthlyincome',
            page: () => MonthlyIncome(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/havenationalid',
            page: () => HaveNationalId(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/mobilemoney',
            page: () => HaveMobileMoney(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/howlongpage',
            page: () => HowLongInBusiness(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/salesmade',
            page: () => SalesLastWeek(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/weekbefore',
            page: () => SalesWeekBefore(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/homepage',
            page: () => HomePage(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/enterkyc',
            page: () => EnterKYCDetails(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/nextofkin',
            page: () => NextofKin(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/verifyidentity',
            page: () => VerifyIdentity(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/fullnamepage',
            page: () => FullNamePage(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/photoofbusiness',
            page: () => PhotoofBusiness(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/currentlyinbusiness',
            page: () => CurrentlyinBusiness(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/homeapproval',
            page: () => HomeApproval(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/successpage',
            page: () => OrderSuccess(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/payapplicationfee',
            page: () => PayApplicationFee(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/paymentsuccesspage',
            page: () => PaymentSuccessPage(),
            customTransition: SizeTransitions()),

        GetPage(
            name: '/agreement',
            page: () => LoanAgreement(),
            customTransition: SizeTransitions()),
        GetPage(
            name: '/referalpage',
            page: () => ReferalPage(),
            customTransition: SizeTransitions()),



      ],
    );
  }
}

class SizeTransitions extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return Align(
      alignment: Alignment.center,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animation,
          curve: curve!,
        ),
        child: child,
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
