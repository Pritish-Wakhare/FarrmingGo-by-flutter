import 'package:flutter/material.dart';
import 'Payment_Screen.dart';


class description extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new describe();
// TODO: implement createState

}

class describe extends State<description>{
  String amount='1000';
  String name;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  Widget build(BuildContext context) {
    const h3 = TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w800,
        fontFamily: 'Poppins');



    return Scaffold(
      appBar: AppBar(
        title: Text('Help Farmer'),
      ),
      body: Center(
        child: Container(
          height:100000000.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              children: <Widget>[
                Text('Help ', style: h3),
                SizedBox(
                  height: 140.0,
                  child: Image.asset(
                    "one.jpg",
                    fit: BoxFit.contain,
                  ),
                ),

                Text('He as gone through a Rough Year\n Because of the heavy floods caused this year he was not able to get income from his crop. Your Donation will help him get through this crisis'),

                Container(
                    width: 300.0,
                    height:45.0,
                    child: TextField(
                        style: TextStyle(
                            fontSize: 20.0,
                            height: 2.0,
                            color: Colors.black
                        ),
                        decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Donate in name of",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                    )
                ),

                Container(
                    width: 300.0,
                    height:45.0,
                    child: TextField(
                      onChanged: (value){
                        amount= value;
                        print(amount);

                      },

                      style: TextStyle(
                          fontSize: 20.0,
                          height: 2.0,
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Donation amount",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                    )
                ),


              Container(
                width: 200.0,
                height: 45.0,
                child: OutlineButton(
                    borderSide: BorderSide(color: Colors.blue),

                    child: const Text('Donate'),
                    textColor: Colors.amber.shade500,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Patment(data: int.parse(amount))));
                    },
                    shape: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )

              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );





    
  }
}