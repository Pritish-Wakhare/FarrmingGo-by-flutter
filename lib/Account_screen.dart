import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Account_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => account();
}

class account extends State<Account_Screen> {
  final _auth =FirebaseAuth.instance;
  String email,mobnum,username;
  FirebaseUser  loggedinUser;
  void initState() {

    super.initState();

  }
  dynamic data;
  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.email);
        if(loggedinUser.email == 'abc@gmail.com')
        {
          email = 'abc@gmail.com';
          mobnum = '9270855555';
          username= 'PriTish Wakhare';

        }
      }
    }
    catch(e)
    {
      print(e);
    }
  }

  /*Future<dynamic> getData() async {

    final user = await _auth.currentUser();
    if (user != null) {
      loggedinUser = user;
      print(loggedinUser.email);
    }
    final DocumentReference document =   await Firestore.instance.collection("regdetails").document(loggedinUser.email);

    await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{
      setState(() {
        data =snapshot.data;
      });
    });
    print(data['mobnum']);

  }*/


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Icon ofericon = new Icon(
      Icons.edit,
      color: Colors.black38,
    );
    Icon keyloch = new Icon(
      Icons.vpn_key,
      color: Colors.black38,
    );
    Icon clear = new Icon(
      Icons.history,
      color: Colors.black38,
    );
    Icon logout = new Icon(
      Icons.do_not_disturb_on,
      color: Colors.black38,
    );

    Icon menu = new Icon(
      Icons.more_vert,
      color: Colors.black38,
    );
    bool checkboxValueA = true;
    bool checkboxValueB = false;
    bool checkboxValueC = false;

    //List<address> addresLst = loadAddress() as List<address> ;
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          'My Account',
        ),
      ),
      body: new Container(
          child: SingleChildScrollView(
            child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(7.0),
            alignment: Alignment.topCenter,
            height: 300.0,
            child: new Card(
              elevation: 3.0,
              child: Column(
                children: <Widget>[
                  new Container(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        margin: const EdgeInsets.all(10.0),
                        // padding: const EdgeInsets.all(3.0),
                        child: ClipOval(
                          child: Image.asset(
                              'user.jpg'),
                        ),
                      )),

                  new FlatButton(
                    onPressed: null,
                    child: Text(
                      'Change',
                      style:
                          TextStyle(fontSize: 13.0, color: Colors.blueAccent),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.blueAccent)),
                  ),

                  new Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: EdgeInsets.only(
                            left: 10.0, top: 20.0, right: 5.0, bottom: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Text(
                              "Pritish Wakhare",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            _verticalDivider(),
                            new Text(
                              "92708591555",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            ),
                            _verticalDivider(),
                            new Text(
                              "abc@gmail.com",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: ofericon,
                            color: Colors.blueAccent,
                            onPressed: null),
                      )
                    ],
                  ),
                  // VerticalDivider(),
                ],
              ),
            ),
          ),
          new Container(
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
            child: new Text(
              'Addresses',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
         new Container(
           height: 205.0,
           child: ListView(
             scrollDirection: Axis.horizontal,
             children: <Widget>[
               Container(
                 height: 300.0,
                 width: 270.0,
                 margin: EdgeInsets.all(7.0),
                 child: Card(
                   elevation: 3.0,
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: <Widget>[
                       new Column(


                         children: <Widget>[
                           new Container(

                             margin:
                             EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,

                               children: <Widget>[
                                 new Text(
                                   "Pritish Wakhare",
                                   style: TextStyle(
                                     color: Colors.black87,
                                     fontSize: 15.0,
                                     fontWeight: FontWeight.bold,
                                     letterSpacing: 0.5,
                                   ),
                                 ),
                                 _verticalDivider(),
                                 new Text(
                                   'H.no 106',
                                   style: TextStyle(
                                       color: Colors.black45,
                                       fontSize: 13.0,
                                       letterSpacing: 0.5),
                                 ),
                                 _verticalDivider(),
                                 new Text(
                                   'Shaniwar Wada',
                                   style: TextStyle(
                                       color: Colors.black45,
                                       fontSize: 13.0,
                                       letterSpacing: 0.5),
                                 ),
                                 _verticalDivider(),
                                 new Text(
                                   'Nagpur',
                                   style: TextStyle(
                                       color: Colors.black45,
                                       fontSize: 13.0,
                                       letterSpacing: 0.5),
                                 ),

                                 new Container(
                                   margin: EdgeInsets.only(left: 00.0,top: 05.0,right: 0.0,bottom: 5.0),
                                     child: Row(
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: <Widget>[
                                         new Text(
                                           'Delivery Address',
                                           style: TextStyle(
                                             fontSize: 15.0,
                                             color: Colors.black26,
                                           ),

                                         ),
                                         _verticalD(),

                                         new Checkbox(
                                           value: checkboxValueA,
                                           onChanged: (bool value) {
                                             setState(() {
                                               checkboxValueA = value;
                                             });
                                           },
                                         ),
                                       ],
                                     ),

                                 )

                               ],
                             ),
                           ),

                         ],
                       ),
                       new Container(
                         alignment: Alignment.topLeft,
                         child: IconButton(
                             icon: menu,
                             color: Colors.black38,
                             onPressed: null),
                       )
                     ],
                   ),
                 ),
               ),


             ],
           )
         ),
          new Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              elevation: 1.0,
              child: Row(
                children: <Widget>[
                  new IconButton(icon: keyloch, onPressed: null),
                  _verticalD(),
                  new Text(
                    'Change Password',
                    style: TextStyle(fontSize: 15.0, color: Colors.black87),
                  )
                ],
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              elevation: 1.0,
              child: Row(
                children: <Widget>[
                  new IconButton(icon: clear, onPressed: null),
                  _verticalD(),
                  new Text(
                    'Clear History',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                    ),
                  )
                ],
              ),
            ),
          ),
          new Container(
            margin: EdgeInsets.all(7.0),
            child: Card(
              elevation: 1.0,
              child: Row(
                children: <Widget>[
                  new IconButton(icon: logout, onPressed: null),
                  _verticalD(),
                  new Text(
                    'Deactivate Account',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.redAccent,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
          )
      ),
    );
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
      );


}
