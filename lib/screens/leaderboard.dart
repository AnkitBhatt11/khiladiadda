import 'package:flutter/material.dart';
import 'package:khiladi_adda/apis/game_leaderboard.dart';
import 'package:khiladi_adda/widgets/token_profile.dart';
import 'package:sliding_switch/sliding_switch.dart';

class LeaderBoard extends StatefulWidget {
  // var str;
  // LeaderBoard({required this.str});
  //const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  var hh = 'all';

  var res;
  var ans;
  skills() async {
    print(tokenProfile?.token);
    res = await getLeaderBoard(tokenProfile?.token, hh);
    print('123456ppp$res');
    ans = res['data'];
    print(ans.length);
    return ans;
  }

  kk(var val) {
    setState(() {
      if (val == false) {
        hh = 'all';
      } else {
        hh = 'monthly';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('LeaderBoard'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         dele();
        //       },
        //       icon: Icon(Icons.delete))
        // ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SlidingSwitch(
              value: false,
              width: 150,
              onChanged: (bool value) {
                print(value);
                kk(value);
                setState(() async {
                  await skills();
                  print('rvrv${hh}');
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => LeaderBoard(
                  //               str: hh,
                  //             )));
                  WidgetsBinding.instance!
                      .addPostFrameCallback((_) => skills());
                });
              },
              height: 25,
              animationDuration: const Duration(milliseconds: 400),
              onTap: () {},
              onDoubleTap: () {},
              onSwipe: () {},
              textOff: "All",
              textOn: "Monthly",
//  iconOff: Icons.human-female,
//  iconOn: Icons.human-male,
              contentSize: 15,
              colorOn: Color(0xFFDC6C73),
              colorOff: const Color(0xff6682c0),
              background: const Color(0xffe4e5eb),
              buttonColor: const Color(0xfff7f5f7),
              inactiveColor: const Color(0xff636f7b),
            ),
          ),
          erer(context),
          // Container(
          //     height: 50 * _heightScale,
          //     width: 375,
          //     color: Color.fromARGB(255, 208, 46, 105),
          //     child: Center(
          //       child: Text(
          //         'Push notifications not working ? Click here ',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     )),
        ],
      ),
    );
  }

  Widget erer(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return FutureBuilder(
        future: skills(),
        builder: (context, snap) {
          if (snap.hasData) {
            return Container(
                height: 650 * _heightScale,
                width: 375,
                color: Color.fromARGB(255, 255, 255, 255),
                child: ListView.builder(
                    itemCount: ans.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 15.0 * _widthScale,
                            right: 15 * _widthScale,
                            top: 1.5 * _widthScale,
                            bottom: 1.5 * _widthScale),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 5,
                          child: Container(
                              //   color: Colors.grey,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    // BoxShadow(
                                    //   color: Colors.black,
                                    //   blurRadius: 20.0,
                                    // )
                                  ]),
                              height: 90 * _heightScale,
                              width: 30 * _widthScale,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 25 * _widthScale,
                                        backgroundImage: NetworkImage(
                                            ans[index]['image_url'])
                                        // AssetImage('assets/Logo.png'),
                                        ),
                                    SizedBox(width: 8 * _widthScale),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 15 * _heightScale),
                                          Text(
                                            ans[index]['name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(height: 5 * _heightScale),
                                          Text(
                                            'Sep7 , 2022 4:00pm  ',
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 13 * _widthScale,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ]),
                                    SizedBox(
                                      width: 75 * _widthScale,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '# ${index + 1}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      );
                    }));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
