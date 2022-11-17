import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khiladi_adda/screens/view_all_challenges.dart';

class GameInfo1 extends StatefulWidget {
  const GameInfo1({Key? key}) : super(key: key);

  @override
  State<GameInfo1> createState() => _GameInfo1State();
}

class _GameInfo1State extends State<GameInfo1> {
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
        title: Text('Games1'),
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
          Container(
              height: 38 * _heightScale,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0 * _widthScale),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'All Upcoming Matches',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 660 * _heightScale,
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: ((context, index) {
                  return Padding(
                      padding: EdgeInsets.all(10 * _widthScale),
                      child: Container(
                        
                        height: 170 * _heightScale,
                        decoration: BoxDecoration(
                        
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          SizedBox(
                            height: 5 * _heightScale,
                          ),
                          Text('ABC TOUR OF XYZ'),
                          SizedBox(
                            height: 5 * _heightScale,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 8 * _heightScale,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 27,
                                    backgroundImage:
                                        AssetImage('assets/Logo.png'),
                                  ),
                                  Text(
                                    'ABC',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Date : 10/09/2022',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Time : 10.07 pm',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Starts in 1 hour',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 27,
                                        backgroundImage:
                                            AssetImage('assets/Logo.png'),
                                      ),
                                      Text(
                                        'XYZ',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(color: Colors.white),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),

                                  //  shape: OutlinedBorder.,
                                  //  alignment: Alignment.center,
                                  primary: Colors.green),
                              onPressed: () async {},
                              child: Container(
                                alignment: Alignment.center,
                                height: 15 * _heightScale,
                                width: 140 * _widthScale,
                                //decoration: BoxDecoration(color: Colors.black87),
                                child: Text('Win upto 2000'),
                              ))
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
