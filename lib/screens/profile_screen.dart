import 'package:flutter/material.dart';
import 'package:khiladi_adda/apis/profile.dart';
import 'package:khiladi_adda/screens/edit_profile_screen.dart';
import 'package:khiladi_adda/widgets/token_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var res;
  var ans;
  skills() async {
    print(tokenProfile?.token);
    res = await getProfile(tokenProfile?.token);
    print('123456$res');
    ans = res['data'];
    //  print(ans.length);
    return ans;
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
              backgroundColor: Colors.white,
              appBar: AppBar(
                // leading:
                title: Row(
                  children: [
                    Builder(builder: (context) {
                      return InkWell(
                          onTap: () => Navigator.pop(context),
                          //onTap: () => Scaffold.of(context).openDrawer(),
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
                      'My Profile',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 45 * _widthScale,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: _widthScale * 45,

                          backgroundImage: res == null
                              ? NetworkImage('')
                              : NetworkImage(ans['image_url']),

                          //  backgroundImage:FileImage(uploads/97c31224-185c-4399-b050-27c9f2fd4ae9.png),
                          //    AssetImage('97c31224-185c-4399-b050-27c9f2fd4ae9.png')
                        ),
                      ),
                      SizedBox(
                        width: 30 * _widthScale,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  ans['name'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: _widthScale * 24,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: _widthScale * 5,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Username : ${ans['username']}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: _widthScale * 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: _widthScale * 5,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  ans['email'] == null
                                      ? 'Add email id'
                                      : ans['email'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: _widthScale * 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: _widthScale * 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _heightScale * 20,
                  ),
                  SizedBox(
                    height: _heightScale * 20,
                  ),
                  Stack(children: [
                    Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 30 * _heightScale,
                        ),
                        Container(
                          color: Colors.red,
                          height: 518 * _heightScale,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditProfileScreen()));
                            }),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25 * _widthScale,
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20 * _heightScale,
                        ),
                        Container(
                          color: Colors.white,
                          height: 200 * _heightScale,
                          width: 322 * _widthScale,
                          child: GridView.builder(
                              //  physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200 * _widthScale,
                                      childAspectRatio: 5 / 2,
                                      crossAxisSpacing: 100 * _widthScale,
                                      mainAxisSpacing: 5 * _widthScale),
                              itemCount: 8,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10 * _heightScale,
                                        ),
                                        Text(
                                          'Mobile Number',
                                          style: TextStyle(
                                              fontSize: 12 * _widthScale,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          ans['mobile'],
                                          style: TextStyle(
                                              fontSize: 16 * _widthScale,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (index == 1) {
                                  return Center(
                                    child: Text(
                                      'Verified',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  );
                                } else if (index == 2) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Email Address',
                                          style: TextStyle(
                                              fontSize: 12 * _widthScale,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          ans['email'] == null
                                              ? 'no email'
                                              : ans['email'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 13 * _widthScale,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (index == 3) {
                                  return Center(
                                    child: Text(
                                      'Update Email Address',
                                      style: TextStyle(
                                          color: Colors.red[800],
                                          fontWeight: FontWeight.w800,
                                          fontSize: 10 * _widthScale),
                                    ),
                                  );
                                } else if (index == 4) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Aadhar Number',
                                          style: TextStyle(
                                              fontSize: 12 * _widthScale,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          '*********',
                                          style: TextStyle(
                                              fontSize: 16 * _widthScale,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (index == 5) {
                                  return Center(
                                    child: Text(
                                      'Update Aadhar',
                                      style: TextStyle(
                                          color: Colors.red[800],
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12 * _widthScale),
                                    ),
                                  );
                                } else if (index == 6) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Invitation Code',
                                          style: TextStyle(
                                              fontSize: 12 * _widthScale,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          'IE7512',
                                          style: TextStyle(
                                              fontSize: 14 * _widthScale,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (index == 7) {
                                  return Center(
                                    child: Icon(Icons.share),
                                  );
                                } else {
                                  return Text('');
                                }
                              }),
                        )
                      ],
                    ),
                  ]),
                ],
              ),
            );
          } else {
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
}
