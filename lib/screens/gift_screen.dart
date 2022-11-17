import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({Key? key}) : super(key: key);

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Scratch Cards'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: Colors.red,
          height: _heightScale * 90,
          width: _widthScale * 375,
          child: Padding(
            padding: EdgeInsets.all(18.0 * _widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Earnings',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18 * _widthScale,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    // Icon(
                    //   Icons.currency_rupee,
                    //   color: Colors.white,
                    // ),
                    Text(
                      '0.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24 * _widthScale,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8 * _widthScale),
                child: Row(
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 17 * _widthScale,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8 * _heightScale,
              ),
              Container(
                decoration: BoxDecoration(),
                // borderRadius: BorderRadius.all(Radius.circular(15))),
                // height: 400,
                // width: 400,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150 * _widthScale,
                        childAspectRatio: 2 / 2,
                        crossAxisSpacing: 15 * _widthScale,
                        mainAxisSpacing: 20 * _widthScale),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.red,
                        //height: 80,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80 * _heightScale,
                              child: InkWell(
                                onTap: (() {
                                  showPhotoBottomSheet();
                                }),
                                child: Image.asset(
                                  'assets/Logo.png', fit: BoxFit.fill,
                                  //style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Text(
                              'Games',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 8 * _heightScale,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8 * _widthScale),
                child: Row(
                  children: [
                    Text(
                      'Scratch Cards',
                      style: TextStyle(
                          fontSize: 17 * _widthScale,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 38 * _heightScale,
              ),
              Text(
                'Please select a category to see scratch cards',
                style: TextStyle(
                    fontSize: 16 * _widthScale, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        )

        //white screen
      ]),
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
                  "You will get Scratch Card when will you complete the milestone of 7 successfully played Leagues.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                )),
                contentPadding:
                    EdgeInsets.only(top: 12, bottom: 30, left: 20, right: 20),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        "You will earn maximum 5 Scratch Cards a day",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Note Point : Cancel Leagues/Free Leagues will not be consider",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      height: 48,
                      minWidth: 170,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onPressed: () {
                        // Storage.instance.selected = [];
                        // Navigation.instance.goBack();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "OK",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      color: Color.fromARGB(255, 116, 11, 3),
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
