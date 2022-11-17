import 'package:flutter/material.dart';
import 'package:khiladi_adda/screens/gift_screen.dart';
import 'package:khiladi_adda/screens/home.dart';
import 'package:khiladi_adda/screens/leaderboard.dart';
import 'package:khiladi_adda/screens/notification_screen.dart';
import 'package:khiladi_adda/screens/support.dart';
import 'package:khiladi_adda/screens/support_screen.dart';
import 'package:khiladi_adda/screens/wallet_screen.dart';
import 'package:khiladi_adda/screens/winner.dart';
import 'package:khiladi_adda/widgets/app_drawer.dart';
import 'package:khiladi_adda/widgets/token_profile.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);
  var ino;
  HomePage(@required this.ino);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isSelected = false;
  var ind = 0;
  int _selectedIndex = 0;
  // List<Widget> _widgetOptions = <Widget>[
  //   HomePage(),
  //   Calendar(),
  //   NotificationsPage(),
  //   ProfileScreen(),
  // ];
  @override
  void initState() {
    super.initState();
    // Provider.of<CardProvider>(context, listen: false);
    setState(() {
      _selectedIndex = 0;
    });

    //  getData();
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
      isSelected = true;
      //isSelected++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('erer${tokenProfile?.token}');
    List _widgetOptions = [
      const Home(),
      //  Winner(),
      Home(),
      //Imageee(),
      //  ObjectiveTwoScreen(),
      // Dummy(),
      Home(),
      Home()
      //BuddyMatchScreen()
      // ProfileScreen(),
      //     Navigator.of(context).pushNamed(ProfileScreen.route)
      //  ee(),
    ];
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: CustomAppDrawer(),
      appBar: AppBar(
        // leading:
        title: Row(
          children: [
            Builder(builder: (context) {
              return InkWell(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Icon(Icons.menu)
                  //  Image.asset(
                  //   "assets/Logo.png",
                  //   height: _heightScale * 23,
                  //   width: _widthScale * 22,
                  // ),
                  );
            }),
            SizedBox(width: 15 * _widthScale),

            //  SizedBox(width: 15 * _widthScale),
            // SizedBox(width: 50 * _widthScale),

            SizedBox(width: 126.5 * _widthScale),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WalletScreen()));
              },
              child: Container(
                height: 35 * _heightScale,
                width: 110 * _widthScale,
                child: Row(
                  children: [
                    SizedBox(width: 5 * _widthScale),
                    Icon(
                      Icons.wallet_travel,
                      size: 20 * _widthScale,
                    ),
                    SizedBox(width: 5 * _widthScale),
                    Icon(
                      Icons.currency_rupee,
                      size: 20 * _widthScale,
                    ),
                    Text('100'),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 213, 55, 52),
                    borderRadius:
                        BorderRadius.all(Radius.circular(5 * _widthScale))),
              ),
            ),
            SizedBox(
              width: 15 * _widthScale,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 26 * _widthScale,
                ))
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: _heightScale * 65.5,
        width: _widthScale * 330,
        // margin: EdgeInsets.only(
        //     left: _widthScale * 15,
        //     right: _widthScale * 15,
        //     bottom: _widthScale * 8),
        decoration: BoxDecoration(
          color: Colors.red,
          //    borderRadius: BorderRadius.all(Radius.circular(_widthScale * 15)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: _widthScale * 10,
                ),
                Expanded(
                    child: buildNavBarItem(
                        Icons.home, Icons.home_outlined, 0, 27, 14, 'Home')),
                // Expanded(
                //     child: buildNavBarItem(
                //         Icons.group, Icons.group_add, 1, 29, 12, 'Messages')),
                Expanded(
                    child: buildNavBarItem(
                        Icons.now_widgets_rounded,
                        Icons.now_widgets_outlined,
                        1,
                        26,
                        14,
                        'Gifts')), //dashboard customizr or now icons
                Expanded(
                    child: buildNavBarItem(Icons.leaderboard, Icons.leaderboard,
                        2, 26, 14, 'Winners')),
                Expanded(
                    child: buildNavBarItem(Icons.support_agent_sharp,
                        Icons.support_agent, 3, 26, 14, 'Support')),
                SizedBox(
                  width: _widthScale * 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, IconData icon2, int index, int size,
      double height, var str) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return GestureDetector(
      onTap: () {
        // widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
        // if (index == 2) {
        //   Navigator.of(context).pushNamed(ChallengeScreen.route);
        // } else
        if (index == 3) {
          setState(() {
            index == 0;
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SupportScreen()));
        } else if (index == 2) {
          setState(() {
            index == 0;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LeaderBoard()));
        } else if (index == 1) {
          setState(() {
            index == 0;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GiftScreen()));
        }
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: _heightScale * height / 2, bottom: height * _heightScale),
            child: Column(
              children: [
                Icon(
                  _selectedIndex == index ? icon : icon2, color: Colors.white,
                  // color: index == _selectedIndex ? Colors.black : Colors.grey,
                  size: _widthScale * size,
                ),
                Text(
                  str,
                  style: TextStyle(
                    color: Colors.white,
                    // color: index == _selectedIndex ? Colors.black : Colors.grey,
                    fontSize: _widthScale * size / 2,
                  ),
                ),
              ],
            ),
          ),

          // SizedBox(
          //   height: _widthScale * 12,
          // ),
          // Container(
          //   height: _heightScale * 5,
          //   width: _widthScale * 16,
          //   decoration: BoxDecoration(
          //     color: index == _selectedIndex ? Colors.white : Colors.blue,
          //     borderRadius: BorderRadius.all(Radius.circular(_widthScale * 2)),
          //   ),
          // ),
        ],
      ),
    );
  }
}
