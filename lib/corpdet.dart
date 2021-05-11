import 'package:flutter/material.dart';



class corpdet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => det();
}

class det extends State<corpdet> {

  var list = ['Rice', 'Wheat', 'three'];

  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text('Crop Portal'),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(20, (index) {
            return Center(
                child: FlatButton(
                  onPressed: () {
                    /*...*/
                  },

                )
            );
          }),
        ),
      ),
    );

  }
}