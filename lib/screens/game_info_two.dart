import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khiladi_adda/screens/accept_screen.dart';
import 'package:khiladi_adda/screens/view_all_challenges.dart';

class GameInfo2 extends StatefulWidget {
  const GameInfo2({Key? key}) : super(key: key);

  @override
  State<GameInfo2> createState() => _GameInfo2State();
}

class _GameInfo2State extends State<GameInfo2> {
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Games'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         dele();
        //       },
        //       icon: Icon(Icons.delete))
        // ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      // onPrimary: C,
                      //  shape: OutlinedBorder.,
                      //  alignment: Alignment.center,
                      primary: Colors.red),
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 30 * _heightScale,
                    width: 80 * _widthScale,
                    //decoration: BoxDecoration(color: Colors.black87),
                    child: Text('Classic'),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),

                      //  shape: OutlinedBorder.,
                      //  alignment: Alignment.center,
                      primary: Colors.grey),
                  onPressed: () async {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 30 * _heightScale,
                    width: 80 * _widthScale,
                    //decoration: BoxDecoration(color: Colors.black87),
                    child: Text('Popular'),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),

                      //  shape: OutlinedBorder.,
                      //  alignment: Alignment.center,
                      primary: Colors.grey),
                  onPressed: () async {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 30 * _heightScale,
                    width: 80 * _widthScale,
                    //decoration: BoxDecoration(color: Colors.black87),
                    child: Text('Popular'),
                  ))
            ],
          ),
          Container(
            height: 640 * _heightScale,
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: EdgeInsets.all(10 * _widthScale),
                      child: Container(
                        height: 186 * _heightScale,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(children: [
                          Column(children: [
                            SizedBox(
                              height: 10 * _heightScale,
                            ),
                            Text(
                              '#FreeFire Survival Premium Battle (50% Bonus Usable Prize Upto 24th Rank)',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 20 * _heightScale,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  width: 100,
                                  color: Colors.grey[200],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Entry'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '50.0 Coins',
                                        style: TextStyle(color: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  color: Colors.grey[200],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Entry'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '50.0 Coins',
                                        style: TextStyle(color: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 100,
                                  color: Colors.grey[200],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Entry'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '50.0 Coins',
                                        style: TextStyle(color: Colors.green),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Text('0/46   '),
                            //   ],
                            // ),
                            // Container(
                            //   height: 2,
                            //   width: 320,
                            //   color: Colors.red,
                            // ),
                            // SizedBox(
                            //   height: 10.5,
                            // ),
                          ]),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AcceptScreen()));
                                    //   showPhotoBottomSheet();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Accept',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    height: 28.25 * _heightScale,
                                    width: 350 * _widthScale,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 104, 21, 15),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                      ));
                })),
          ),
        ],
      ),
    );
  }

  void showPhotoBottomSheet() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    if (context != null) {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Center(
                    child: Text(
                  "USERNAME",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                )),
                contentPadding:
                    EdgeInsets.only(top: 24, bottom: 30, left: 20, right: 20),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(child: TextFormField()
                        //  Text(
                        //   "Once changed , all the services will be deleted",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.w500, fontSize: 14),
                        // ),
                        ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      height: 48,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onPressed: () {
                        // Storage.instance.selected = [];
                        // Navigation.instance.goBack();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "UPDATE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 16,
                    )
                  ],
                ));
          });
    }
  }
}
