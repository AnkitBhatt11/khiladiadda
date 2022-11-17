import 'package:flutter/material.dart';
import 'package:khiladi_adda/apis/login_otp.dart';
import 'package:khiladi_adda/screens/login_otp_screen.dart';
import 'package:khiladi_adda/screens/otp_screen.dart';
import 'package:khiladi_adda/sign_in.dart';

class SignInscreen extends StatefulWidget {
  const SignInscreen({Key? key}) : super(key: key);

  @override
  State<SignInscreen> createState() => _SignInscreenState();
}

class _SignInscreenState extends State<SignInscreen> {
  bool _isLoading = false;
  _onSubmit(BuildContext context) async {
    var response = await SignIn.signUp(
      _password.text,
    );
    print('lol');
    // print(response['status']);

    if (response['status'] == true) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginOtp(_password.text)));
    } else {
      print('454545465');
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
  TextEditingController _user = TextEditingController();
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
              'Login with OTP',
              style: TextStyle(
                  fontSize: 20 * _widthScale,
                  color: Color(0xFFB6B6B6),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(height: 28 * _heightScale),
        Padding(
          padding: EdgeInsets.only(
              left: 20.0 * _widthScale, right: 20 * _widthScale),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            cursorColor: Color(0xFFB6B6B6),
            controller: _password,
            autofocus: false,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black,
              prefixIcon: Icon(
                Icons.phone,
                size: 18 * _widthScale,
                color: Color(0xFFB6B6B6),
              ),
              hintText: 'Enter Phone Number',
              hintStyle: TextStyle(
                  fontSize: 16 * _widthScale,
                  color: Color(0xFFB6B6B6),
                  fontWeight: FontWeight.w500),
              contentPadding: EdgeInsets.only(
                  left: 14.0 * _widthScale,
                  bottom: 14.0 * _widthScale,
                  top: 14.0 * _heightScale),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFB6B6B6)),
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                borderRadius: BorderRadius.circular(6),
              ),
              // UnderlineInputBorder(
              //   borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
              //   borderRadius: BorderRadius.circular(6),
              // ),
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
              setState(() {
                _isLoading = true;
              });
              await _onSubmit(context);

              setState(() {
                _isLoading = false;
              });
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
              child: _isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: _heightScale * 20,
                          width: _widthScale * 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: _widthScale * 20,
                        ),
                        Text("Please Wait...")
                      ],
                    )
                  : Text(
                      'Sign in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18 * _widthScale,
                          fontWeight: FontWeight.w700),
                    ),
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
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Text(
                  'Dont have an account ?',
                  style: TextStyle(
                      fontSize: 13 * _widthScale,
                      color: Color(0xFFB6B6B6),
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpscreen()));
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        fontSize: 14 * _widthScale,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
