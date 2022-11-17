import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khiladi_adda/screens/view_all_challenges.dart';

class GameInfo extends StatefulWidget {
  const GameInfo({Key? key}) : super(key: key);

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Colors.red,
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
            height: 50 * _heightScale,
          ),
          Container(
              height: 38 * _heightScale,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0 * _widthScale),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Challenges',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewAllChallenge()));
                      }),
                      child: Row(
                        children: [
                          Text(
                            'View All Challenges',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15 * _widthScale,
                            color: Colors.red,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Container(
            alignment: Alignment.center,
            height: 60 * _heightScale,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hey you have not participated in any challenge today .Create or accept challenges now to play and earn',
                style:
                    TextStyle(color: Colors.white, fontSize: 12 * _widthScale),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
              height: 38 * _heightScale,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0 * _widthScale),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Live Challenges',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
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
                    height: 50 * _heightScale,
                    width: 140 * _widthScale,
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
                    height: 50 * _heightScale,
                    width: 140 * _widthScale,
                    //decoration: BoxDecoration(color: Colors.black87),
                    child: Text('Popular'),
                  ))
            ],
          ),
          Container(
            height: 460 * _heightScale,
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: EdgeInsets.all(10 * _widthScale),
                      child: Container(
                        height: 110 * _heightScale,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 12 * _heightScale,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 24 * _widthScale,
                                backgroundImage: AssetImage('assets/Logo.png'),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'ABC_XYZZZ',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Text(
                                    'has challenged for',
                                    style: TextStyle(
                                        fontSize: 12 * _widthScale,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '10.0 Coins',
                                    style: TextStyle(color: Colors.green),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 24 * _widthScale,
                                    backgroundImage:
                                        AssetImage('assets/Logo.png'),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20 * _heightScale,
                          ),
                          Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Winning : 18.0 Coins',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                                height: 28.25 * _heightScale,
                                width: 177.5 * _widthScale,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10))),
                              ),
                              InkWell(
                                onTap: () {
                                  showPhotoBottomSheet();
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
                                  width: 177.5 * _widthScale,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 15, 68, 112),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10))),
                                ),
                              )
                            ],
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
