import 'package:flutter/material.dart';
import 'package:khiladi_adda/apis/login.dart';
import 'package:khiladi_adda/apis/register.dart';
import 'package:khiladi_adda/screens/home_screen.dart';
import 'package:pinput/pin_put/pin_put.dart';

//import 'apis/register_otp.dart';

class LoginOtp extends StatefulWidget {
  // const Otp({Key? key}) : super(key: key);
  
  final String phone;
  
  LoginOtp( @required this.phone);
  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  final TextEditingController _pinPutController = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.red),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  _onSubmit(BuildContext context, var pin) async {
    var response =
        await Login.signUp( widget.phone , pin ); 

        if(response['status'] == true){
            Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
            
            HomePage(0)
            ));
        }else{
            var snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Error ${response['message']}!",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(milliseconds: 2000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        SizedBox(
          height: 38 * _heightScale,
        ),
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/Logo.png',
            fit: BoxFit.fill,
            width: 250 * _widthScale,
            height: 250 * _heightScale,
          ),
        ),
        SizedBox(
          height: 30 * _heightScale,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 23.0 * _widthScale, right: 24 * _widthScale),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Enter Otp',
              style: TextStyle(
                  fontSize: 16 * _widthScale,
                  color: Color(0xFFB6B6B6),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          height: 15 * _heightScale,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 23.0 * _widthScale, right: 24 * _widthScale),
          child: Container(
            color: Colors.black,
            // margin: const EdgeInsets.all(20.0),
            // padding: const EdgeInsets.all(20.0),
            child: PinPut(
              textStyle: TextStyle(color: Colors.white),
              //  cursorHeight: 70,
              fieldsCount: 4,
              eachFieldHeight: 56 * _heightScale,
              eachFieldWidth: 75 * _widthScale,
              onSubmit: (String pin) {
                _onSubmit(context, pin);
              },
              //=> _onSubmit(context, pin),
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(20.0),
              ),
              selectedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 32 * _heightScale,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23 * _widthScale),
          child: ElevatedButton(
            onPressed: () async {
              //  await _onSubmit(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              height: _heightScale * 56,
              width: _widthScale * 328,
              child:
                  // isLoading1
                  //     ? Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           SizedBox(
                  //             height: _heightScale * 20,
                  //             width: _widthScale * 20,
                  //             child: CircularProgressIndicator(
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             width: _widthScale * 20,
                  //           ),
                  //           Text("Please Wait...")
                  //         ],
                  //       )
                  //     :
                  Text(
                'Sign in',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18 * _widthScale, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
