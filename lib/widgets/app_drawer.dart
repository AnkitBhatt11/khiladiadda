import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khiladi_adda/apis/profile.dart';
import 'package:khiladi_adda/screens/leaderboard.dart';
import 'package:khiladi_adda/screens/profile_screen.dart';
import 'package:khiladi_adda/screens/referrals.dart';
import 'package:khiladi_adda/screens/setting_screen.dart';
import 'package:khiladi_adda/screens/stats.dart';
import 'package:khiladi_adda/screens/wallet_screen.dart';
import 'package:khiladi_adda/widgets/token_profile.dart';

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  @override
  _CustomAppDrawerState createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  var res;
  var ans;
  @override
  void initState() {
    super.initState();
    skills();
  }

  skills() async {
    print(tokenProfile?.token);
    res = await getProfile(tokenProfile?.token);
    // await MultipartFile.fromFile(pic.path)
    print('123456$res');
    ans = res['data'];
    //  print(ans.length);
    return ans;
  }

  bool isSwitch = false;

  var val;

  @override
  Widget build(BuildContext context) {
    // chooseLogin();
    print("ddd ${val}");
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    var size = MediaQuery.of(context).size;

    Widget spacevert6 = SizedBox(height: size.height * 0.12);

    Widget spacehort = SizedBox(
      width: size.width * 0.1,
    );
    // Widget spacehort1 = SizedBox(
    //   width: size.width * 0.07,
    // );
    // Widget spacevert1 = SizedBox(
    //   height: size.height * 0.0038,
    // );
    // Widget spacevert2 = SizedBox(
    //   height: size.height * 0.1,
    // );
    // Widget spacevert3 = SizedBox(
    //   height: size.height * 0.07,
    // );

    return Container(
      color: Colors.black,
      width: size.width * 0.8,
      child: Drawer(
        backgroundColor: Color.fromARGB(255, 92, 11, 11),
        child: Column(
          children: [
            SizedBox(
              height: 40 * _heightScale,
            ),
            FutureBuilder(
                future: skills(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    return SizedBox(
                      height: 110 * _heightScale,
                      child: Column(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 35 * _widthScale,
                              backgroundImage: NetworkImage(
                                ans['image_url'] ?? '',

                                //fit: BoxFit.fitHeight,
                              )),
                          Text(
                            ans['name'],
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            ans['email'] == null ? "" : ans['email'],
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 110 * _heightScale,
                    );
                  }
                }),
            SizedBox(height: _heightScale * 27),
            Container(
              color: Colors.white,
              height: _heightScale * 635,
              child: Column(children: [
                SizedBox(
                  height: 10 * _heightScale,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25 * _widthScale,
                      ),
                      Icon(
                        Icons.person_pin,
                        size: 35 * _widthScale,
                      ),
                      SizedBox(
                        width: 8 * _widthScale,
                      ),
                      Text(
                        'My Profile',
                        style: TextStyle(
                            fontSize: 15 * _widthScale,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 13 * _heightScale,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => stats()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25 * _widthScale,
                      ),
                      Icon(
                        Icons.stacked_bar_chart,
                        size: 35 * _widthScale,
                      ),
                      SizedBox(
                        width: 8 * _widthScale,
                      ),
                      Text(
                        'My Stats & Voucher ',
                        style: TextStyle(
                            fontSize: 15 * _widthScale,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 13 * _heightScale,
                ),
                InkWell(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WalletScreen()));
                  }),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25 * _widthScale,
                      ),
                      Icon(
                        Icons.monitor_heart_rounded,
                        size: 35 * _widthScale,
                      ),
                      SizedBox(
                        width: 8 * _widthScale,
                      ),
                      Text(
                        'My Wallet',
                        style: TextStyle(
                            fontSize: 15 * _widthScale,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 13 * _heightScale,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LeaderBoard()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25 * _widthScale,
                      ),
                      Icon(
                        Icons.leaderboard,
                        size: 35 * _widthScale,
                      ),
                      SizedBox(
                        width: 8 * _widthScale,
                      ),
                      Text(
                        'Leaderboard',
                        style: TextStyle(
                            fontSize: 15 * _widthScale,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 13 * _heightScale,
                ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: 25 * _widthScale,
                //     ),
                //     Icon(
                //       Icons.gamepad,
                //       size: 35 * _widthScale,
                //     ),
                //     SizedBox(
                //       width: 8 * _widthScale,
                //     ),
                //     // Text(
                //     //   'My Played Quiz',
                //     //   style: TextStyle(
                //     //       fontSize: 15 * _widthScale,
                //     //       fontWeight: FontWeight.bold),
                //     // )
                //   ],
                // ),
                // SizedBox(
                //   height: 13 * _heightScale,
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Referrals()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25 * _widthScale,
                      ),
                      Icon(
                        Icons.groups_rounded,
                        size: 35 * _widthScale,
                      ),
                      SizedBox(
                        width: 8 * _widthScale,
                      ),
                      Text(
                        'My Referrals',
                        style: TextStyle(
                            fontSize: 15 * _widthScale,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 13 * _heightScale,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingScreen()));
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 25 * _widthScale,
                      ),
                      Icon(
                        Icons.settings,
                        size: 35 * _widthScale,
                      ),
                      SizedBox(
                        width: 8 * _widthScale,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 15 * _widthScale,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 13 * _heightScale,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25 * _widthScale,
                    ),
                    Icon(
                      Icons.question_mark,
                      size: 35 * _widthScale,
                    ),
                    SizedBox(
                      width: 8 * _widthScale,
                    ),
                    Text(
                      'Tutorials',
                      style: TextStyle(
                          fontSize: 15 * _widthScale,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10 * _heightScale,
                ),
                SizedBox(
                  height: 15 * _heightScale,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25 * _widthScale,
                    ),
                    SizedBox(
                      width: 8 * _widthScale,
                    ),
                    Text(
                      'Social Media',
                      style: TextStyle(
                          color: Colors.black26,
                          fontSize: 17 * _widthScale,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 25 * _heightScale,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25 * _widthScale,
                    ),
                    Icon(
                      Icons.telegram,
                      size: 35 * _widthScale,
                    ),
                    SizedBox(
                      width: 8 * _widthScale,
                    ),
                    Text(
                      'Telegram',
                      style: TextStyle(
                          fontSize: 15 * _widthScale,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 13 * _heightScale,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25 * _widthScale,
                    ),
                    Icon(
                      Icons.inbox,
                      size: 35 * _widthScale,
                    ),
                    SizedBox(
                      width: 8 * _widthScale,
                    ),
                    Text(
                      'Instagram',
                      style: TextStyle(
                          fontSize: 15 * _widthScale,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 13 * _heightScale,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25 * _widthScale,
                    ),
                    Icon(
                      Icons.video_collection_sharp,
                      size: 35 * _widthScale,
                    ),
                    SizedBox(
                      width: 8 * _widthScale,
                    ),
                    Text(
                      'YouTube',
                      style: TextStyle(
                          fontSize: 15 * _widthScale,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ]),
            ),

            // SizedBox(height: _heightScale * 9),
            // Padding(
            //   padding: EdgeInsets.only(
            //     right: 23 * _widthScale,
            //     left: 23 * _widthScale,
            //     // top: 650 * _heightScale
            //   ),
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       //  Navigator.of(context).pushNamed(NotificationScreen.route);
            //     },
            //     style: ElevatedButton.styleFrom(
            //       elevation: 0,
            //       primary: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //     ),
            //     child: Container(
            //       alignment: Alignment.centerLeft,
            //       height: _heightScale * 56,
            //       width: size.width * 0.8,
            //       child: Text(
            //         'Notifications',
            //         textAlign: TextAlign.center,
            //         style: GoogleFonts.poppins(
            //             textStyle: TextStyle(
            //                 color: Color(0xFF464646),
            //                 fontSize: 14 * _widthScale,
            //                 fontWeight: FontWeight.w500)),
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //  height: _heightScale*600,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     right: 23 * _widthScale,
            //     left: 23 * _widthScale,
            //     top: 515 * _heightScale,
            //   ),
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       //  var rr = await tokenPreference.cleartTokenPreferenceData();

            //       // await loginPreference!.setLoginSta(false);
            //       // await loginPreference!.setLoginStat(false);
            //       // await loginPreference!.setLoginStatu(false);
            //       // await loginPreference!.setLoginStatus(false);
            //       // tokenProfile = null;
            //       // await tokenPreference.cleartTokenPreferenceData();
            //       // await tokenPreference.setTokenPreferenceData('');
            //       //   if (tokenProfile?.token == null) {
            //       //  print('[[[[${tokenProfile?.token}');
            //       // Navigator.pushAndRemoveUntil(
            //       //     context,
            //       //     MaterialPageRoute(
            //       //         builder: (context) => onboardingscreen()),
            //       //     (route) => false);
            //       // }
            //       // Navigator.pushReplacement(
            //       //     context,
            //       //     MaterialPageRoute(
            //       //         builder: (context) => onboardingscreen()));
            //       //}
            //     },
            //     style: ElevatedButton.styleFrom(
            //       // primary: BoxColor.PurpleBox(context),
            //       shape: new RoundedRectangleBorder(
            //         borderRadius: new BorderRadius.circular(10.0),
            //       ),
            //     ),
            //     child: Container(
            //       alignment: Alignment.center,
            //       height: _heightScale * 56,
            //       width: size.width * 0.8,
            //       child: Text(
            //         'Log Out',
            //         textAlign: TextAlign.center,
            //         style: GoogleFonts.poppins(
            //             textStyle: TextStyle(
            //                 fontSize: 18 * _widthScale,
            //                 fontWeight: FontWeight.w700)),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
