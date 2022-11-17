import 'dart:async';
import 'package:flutter/material.dart';
import 'package:khiladi_adda/screens/home_screen.dart';
import 'package:khiladi_adda/screens/sign_in_screen.dart';
import 'package:khiladi_adda/sign_in.dart';
import 'package:khiladi_adda/widgets/token_preference.dart';
import 'package:khiladi_adda/widgets/token_profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  @override
  void initState() {
    //super.initState();
    tokenPreference = TokenPreference();
  }

  var val;
  Future screen() async {
    print('inside screen()');
    // bool val = await loginPreference!.getLoginStatus();
    // bool valu = await loginPreference!.getLoginStatu();
    // bool value = await loginPreference!.getLoginStat();
    // bool values = await loginPreference!.getLoginSta();
    // isLogin = val;
    // isVerify = valu;
    // isDone = value;
    // isFinal = values;
    // return val;
    val = await tokenPreference.getTokenPreferenceData();
    tokenProfile =
        TokenProfile.fromJson(await tokenPreference.getTokenPreferenceData());
    print('token value is $val ');
    print('next value is ${tokenProfile?.token}');
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FutureBuilder(
          future: screen(),
          builder: (context, snap) {
            return MyHomePage(val);
          }),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  var token;
  MyHomePage(@required this.token);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    widget.token == null ? SignInscreen() : HomePage(0))));
    //initstate() is used to initialize the contents of an already existing object.
    super.initState();
    print('loginPreference in initState');
    //  loginPreference = LoginPreference();

    //   getUserData();
  }

  // void getUserData() async {
  //   if (await loginPreference!.getLoginStatus()) {
  //     tokenProfile =
  //         TokenProfile.fromJson(await tokenPreference.getTokenPreferenceData());
  //     print("User Data");
  //     //  print(constant.api);
  //   }
  // }

  bool isLogin = false;
  bool isVerify = false;
  bool isDone = false;
  bool isFinal = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Image.asset('assets/Logo.png'),

      //FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GeeksForGeeks")),
      body: Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}
