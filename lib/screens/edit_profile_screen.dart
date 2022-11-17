import 'dart:io';

import 'package:flutter/material.dart';
import 'package:khiladi_adda/apis/edit_profile.dart';
import 'package:khiladi_adda/apis/profile.dart';
import 'package:khiladi_adda/apis/upload_image.dart';
import 'package:khiladi_adda/screens/profile_screen.dart';
import 'package:khiladi_adda/widgets/token_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var res;
  var ans;
  @override
  void initState() {
    super.initState();
    skills();
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _user = TextEditingController();
  TextEditingController email = TextEditingController();
  skills() async {
    print(tokenProfile?.token);
    res = await getProfile(tokenProfile?.token);
    // await MultipartFile.fromFile(pic.path)
    print('123456$res');
    ans = res['data'];
    //  print(ans.length);
    return ans;
  }

  var file;
  _omSubmit(context) async {
    print(ans['username']);
    file = await Upload.image(
        tokenProfile?.token, ans['name'], ans['username'], imageFile);
  }

  var fil;
  _omSubmi(context) async {
    print(ans['username']);
    fil = await Uploa.fil(
        tokenProfile?.token,
        _user.text == '' ? ans['name'] : _user.text,
        _username.text == '' ? ans['username'] : _username.text,
        email.text);
  }

  var imageFile;
  final picker = ImagePicker();

  chooseImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return FutureBuilder(
        future: skills(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Scaffold(
              backgroundColor: Colors.red,
              appBar: AppBar(
                // leading:
                title: Row(
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back)
                          //  Image.asset(
                          //   "assets/Logo.png",
                          //   height: _heightScale * 23,
                          //   width: _widthScale * 22,
                          // ),
                          );
                    }),
                    SizedBox(width: 15 * _widthScale),
                    Text(
                      'Profile Update',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 15 * _widthScale),
                    // SizedBox(width: 50 * _widthScale),

                    SizedBox(width: 15 * _widthScale),
                    // SizedBox(
                    //   width: 15 * _widthScale,
                    // ),
                  ],
                ),
                //  centerTitle: true,
                //  title: ,
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Colors.red,
              ),
              body: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.en,
                children: [
                  SizedBox(
                    height: _heightScale * 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imageFile != null
                          ? buildImages()
                          : Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  //  height: _heightScale * 327,
                                  radius: _widthScale * 65,
                                  // color: Color(0xFFF3F3F3),
                                  child: InkWell(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: _widthScale * 60,
                                      child: Image.network(
                                        ans['image_url'] == null
                                            ? ''
                                            : ans['image_url'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    // icon:
                                    //     const Icon(Icons.add_circle_outline_outlined),
                                    onTap: () {
                                      print('ttyyy$imageFile');
                                      chooseImage(ImageSource.gallery);
                                    },
                                    // iconSize: _widthScale * 39,
                                    // color: Color(0xFF775594),
                                  ),
                                ),
                                SizedBox(
                                  height: 5 * _heightScale,
                                ),
                                Text(
                                  'Click Here',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  //  shape: OutlinedBorder.,
                                  //  alignment: Alignment.center,
                                  primary: Colors.black26),
                              onPressed: () async {
                                await _omSubmit(context);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen()));
                                const snackBar = SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 145, 9, 9),
                                  content: Text(
                                    " Profile Updated Successfully",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  duration: Duration(milliseconds: 3000),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50 * _heightScale,
                                width: 70 * _widthScale,
                                //decoration: BoxDecoration(color: Colors.black87),
                                child: Text('UPLOAD'),
                              ))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _heightScale * 10,
                  ),
                  SizedBox(
                    height: _heightScale * 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30.0 * _widthScale, right: 30 * _widthScale),
                    child: TextFormField(
                      //    keyboardType: TextInputType.phone,
                      cursorColor: Colors.white,
                      controller: _user,
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.red,
                        // prefixIcon: Icon(
                        //   Icons.phone,
                        //   size: 18 * _widthScale,
                        //   color: Colors.white,
                        // ),
                        hintText: ans['name'],
                        hintStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.only(
                            left: 14.0 * _widthScale,
                            bottom: 14.0 * _widthScale,
                            top: 14.0 * _heightScale),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
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
                    height: _heightScale * 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30.0 * _widthScale, right: 30 * _widthScale),
                    child: TextFormField(
                      //  keyboardType: TextInputType.phone,
                      cursorColor: Colors.white,
                      controller: _username,
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.red,
                        // prefixIcon: Icon(
                        //   Icons.phone,
                        //   size: 18 * _widthScale,
                        //   color: Colors.white,
                        // ),
                        hintText: ans['username'],
                        hintStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.only(
                            left: 14.0 * _widthScale,
                            bottom: 14.0 * _widthScale,
                            top: 14.0 * _heightScale),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
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
                    height: _heightScale * 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 30.0 * _widthScale, right: 30 * _widthScale),
                    child: TextFormField(
                      //    keyboardType: TextInputType.phone,
                      cursorColor: Colors.white,
                      controller: email,
                      autofocus: false,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.red,
                        // prefixIcon: Icon(
                        //   Icons.phone,
                        //   size: 18 * _widthScale,
                        //   color: Colors.white,
                        // ),
                        hintText: ans['email'] == null
                            ? "Enter email address"
                            : ans['email'],
                        hintStyle: TextStyle(
                            fontSize: 16 * _widthScale,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.only(
                            left: 14.0 * _widthScale,
                            bottom: 14.0 * _widthScale,
                            top: 14.0 * _heightScale),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
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
                    height: _heightScale * 10,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: 30.0 * _widthScale, right: 30 * _widthScale),
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.phone,
                  //     cursorColor: Colors.white,
                  //     controller: _password,
                  //     autofocus: false,
                  //     style: TextStyle(
                  //         fontSize: 15.0,
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w500),
                  //     decoration: InputDecoration(
                  //       filled: true,
                  //       fillColor: Colors.red,
                  //       // prefixIcon: Icon(
                  //       //   Icons.phone,
                  //       //   size: 18 * _widthScale,
                  //       //   color: Colors.white,
                  //       // ),
                  //       hintText: 'Enter Phone Number',
                  //       hintStyle: TextStyle(
                  //           fontSize: 16 * _widthScale,
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.w500),
                  //       contentPadding: EdgeInsets.only(
                  //           left: 14.0 * _widthScale,
                  //           bottom: 14.0 * _widthScale,
                  //           top: 14.0 * _heightScale),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(6),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: const BorderSide(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(6),
                  //       ),
                  //       // UnderlineInputBorder(
                  //       //   borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                  //       //   borderRadius: BorderRadius.circular(6),
                  //       // ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 10 * _heightScale,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          //  shape: OutlinedBorder.,
                          //  alignment: Alignment.center,
                          primary: Colors.white),
                      onPressed: () async {
                        await _omSubmi(context);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                        const snackBar = SnackBar(
                          backgroundColor: Color.fromARGB(255, 145, 9, 9),
                          content: Text(
                            "Updated Successfully",
                            style: TextStyle(color: Colors.white),
                          ),
                          duration: Duration(milliseconds: 3000),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50 * _heightScale,
                        width: 190 * _widthScale,
                        //decoration: BoxDecoration(color: Colors.black87),
                        child: Text(
                          'UPDATE',
                          style: TextStyle(color: Colors.red),
                        ),
                      ))
                ],
              ),
            );
          }else{
              return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          }
        });
  }

  Widget buildImages() {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    print('ttyyyt$imageFile');
    return CircleAvatar(
        // height: _heightScale * 100,
        radius: _widthScale * 70,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: FileImage(imageFile), fit: BoxFit.fill)),
        ));
  }
}
