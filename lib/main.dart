import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'SignUpPage.dart';
import 'HomeScreen.dart';
import 'raise.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String email,password;
  final _auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    const h3 = TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w800,
        fontFamily: 'Poppins');



    final emailField = TextField(
      onChanged: (value){
        email = value;

      },
      keyboardType: TextInputType.emailAddress,
      textAlign: TextAlign.center,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email Id ",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      onChanged: (value){
        password = value;
      },
      textAlign: TextAlign.center,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),

    );
    showAlertDialog(BuildContext context) {
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(
            context,
          );



        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("You Have not Registered"),
        content: Text("Please Register Yourself using register button."),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );

    }

    return Scaffold(
      body: Center(
        child: Container(

          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('✨FarmmingGo✨', style: h3),
                SizedBox(
                  height: 160.0,
                  child: Image.asset(
                    "assets/logo1.png",
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: 5.0),

                emailField,
                SizedBox(height: 5.0),
                passwordField,
                SizedBox(height: 5.0),
                Container(
                  height:44,
                  width:500,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                    onPressed: () async{
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                                Home_screen()),
                          );
                        }
                      }
                      catch(e)
                      {
                        showAlertDialog(context);
                        print(e);

                      }

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                Container(
                  height:44,
                  width:500,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(' 💫 New ! Register Now ', style: TextStyle(color: Colors.white) ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height:44,
                  width:500,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(' Help Farmer by Donating💰 ', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => raise()),
                      );

                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                    ),
                ),
                ),


                Text('Designed by ✨PriTish Wakhare ✨', textAlign: TextAlign.end , ),



              ],
            ),

          ),
        ),

      ),

    );
  }
}

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 25.0);


