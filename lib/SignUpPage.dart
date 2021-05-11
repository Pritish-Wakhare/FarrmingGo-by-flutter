import 'package:flutter/material.dart';
import 'colors.dart';
import 'HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';



class SignUpPage extends StatefulWidget {
  final String pageTitle;

  SignUpPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  String username;
  String email;
  String password;
  String mobileNumber;



  static const authPlateDecoration = BoxDecoration(
      color: white,
      boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 1))
      ],
      borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(20), bottomStart: Radius.circular(20)));
  static const taglineText = TextStyle(color: Colors.grey, fontFamily: 'Poppins');
  static const contrastText = TextStyle(color: primaryColor, fontFamily: 'Poppins');
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static const h3 = TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w800,
      fontFamily: 'Poppins');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up Now"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
        padding: const EdgeInsets.all(9.0),
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Welcome to FarmmingGo!', style: h3),
                  Text('   '),
                  Text('Let\'s get started 💫 ', style: h3 , textAlign: TextAlign.center, ),
                  Text('   '),
                  Text('   '),

              TextField(
                textAlign: TextAlign.center,
                onChanged:(value){
                  username = value;
                },
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "UserName",
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              ),
                Text('   '),

              TextField(
                textAlign: TextAlign.center,
                onChanged:(value){
                  mobileNumber = value;
                },
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Phone Number",
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              ),
                Text('   '),

              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged:(value){
                  email = value;
                },
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email id",
                    border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
              ),
                Text('  '),
                  TextField(
                    textAlign: TextAlign.center,
                    onChanged:(value){
                      password = value;
                    },
                    obscureText: true,
                    style: style,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Password",
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
                  ),
                  Text('   '),

                  TextField(
                    textAlign: TextAlign.center,
                    onChanged:(value){
                      password = value;
                    },
                    obscureText: true,
                    style: style,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Address",
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
                  ),
              ],
            ),
            Positioned(
              bottom: 15,
              right: -15,
              child: FlatButton(
              onPressed: () async {
                try{
                final newuser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
                    _firestore.collection('regdetails').add({ 'email':email,
                      'password':password,
                      'mobnum':mobileNumber,
                          'username':username});
                        if(newuser != null) {
                      Navigator.pop(
                          context,

              );
              }
              }
                catch(e)
                {
                    print(e);
                }

                },


                color: primaryColor,
                padding: EdgeInsets.all(13),
               shape: CircleBorder(),

                child: Icon(Icons.double_arrow, color: white),

              ),
            )
          ],
        ),
        height: 500,
        
        width: double.infinity,

        decoration: authPlateDecoration,

      ),
        ],

      )

    );
  }
}


