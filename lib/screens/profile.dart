import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro007/Constants/constants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ww = MediaQuery.of(context).size.width;
    var hh = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Container(
            height: hh * 0.3,
            width: ww,
            // padding: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: primarycolor,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 120,
                width: 120,
                child: Center(
                  child: Text('AP',
                      style: headerText()
                          .copyWith(fontSize: 60, color: primarycolor)),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(75)
                ),
              ),
            ),
          ),
          Container(
            width: ww,
            padding: EdgeInsets.only(top: hh / 40),
            child: Column(
              children: <Widget>[
                Container(
                  width: ww,
                  padding: EdgeInsets.symmetric(horizontal: ww / 20),
                  margin: EdgeInsets.only(bottom: ww / 35),
                  child: Card(
                    margin: EdgeInsets.only(left: 0, right: 0, top: 0),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: ww * .92,
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: primarycolor,
                                ),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  padding: EdgeInsets.all(13),
                                  child: Image(
                                    fit: BoxFit.fitHeight,
                                    image:
                                        AssetImage('assets/images/user1.png'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Dr. Andy Perry',
                                style: paragraphText().copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: ww,
                  padding: EdgeInsets.symmetric(horizontal: ww / 20),
                  margin: EdgeInsets.only(bottom: ww / 35),
                  child: Card(
                    margin: EdgeInsets.only(left: 0, right: 0, top: 0),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: ww * .92,
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: primarycolor,
                                ),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  padding: EdgeInsets.all(13),
                                  child: Image(
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage('assets/images/job1.png'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Dr. Andy Perry',
                                style: paragraphText().copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: ww,
            padding: EdgeInsets.symmetric(horizontal: ww / 20),
            margin: EdgeInsets.only(bottom: ww / 35),
            child: Card(
              margin: EdgeInsets.only(left: 0, right: 0, top: 0),
              elevation: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: ww * .92,
                  height: 60,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: primarycolor,
                          ),
                          child: Container(
                            height: 20,
                            width: 20,
                            padding: EdgeInsets.all(13),
                            child: Image(
                              fit: BoxFit.fitHeight,
                              image: AssetImage('assets/images/clock.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Dr. Andy Perry',
                          style: paragraphText().copyWith(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: ww,
            padding: EdgeInsets.symmetric(horizontal: ww / 20),
            margin: EdgeInsets.only(bottom: ww / 60),
            child: Card(
              margin: EdgeInsets.only(left: 0, right: 0, top: 0),
              elevation: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: ww * .92,
                  height: 60,
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: primarycolor,
                          ),
                          child: Container(
                            height: 20,
                            width: 20,
                            padding: EdgeInsets.all(13),
                            child: Image(
                              fit: BoxFit.fitHeight,
                              image: AssetImage('assets/images/key2.png'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          'Reset Password',
                          style: paragraphText().copyWith(
                              fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
