import 'package:flutter/material.dart';
import 'package:pro007/Constants/constants.dart';

class GetQuoteForm extends StatefulWidget {
  @override
  _GetQuoteFormState createState() => _GetQuoteFormState();
}

class _GetQuoteFormState extends State<GetQuoteForm> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primarycolor,
            elevation: 0,
            bottom: TabBar(
              //physics: NeverScrollableScrollPhysics(),
                labelColor: primarycolor,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Computation",
                        style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                              ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Risk Info",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                              )),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Insured Info", style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                              ),),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Icon(Icons.apps),
            Icon(Icons.movie),
            Icon(Icons.games),
          ]),
        ));
  }
}
