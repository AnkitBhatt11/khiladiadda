import 'package:flutter/material.dart';
import 'package:khiladi_adda/screens/messages.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Support'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         dele();
        //       },
        //       icon: Icon(Icons.delete))
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: 400,
          // width: 400,
          child: GridView.builder(
              shrinkWrap: true,
              //  physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150 * _widthScale,
                  childAspectRatio: 1.5 / 2,
                  crossAxisSpacing: 15 * _widthScale,
                  mainAxisSpacing: 18 * _widthScale),
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndividualPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      'assets/Logo.png', fit: BoxFit.cover,
                      //style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
