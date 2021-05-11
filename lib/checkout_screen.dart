import 'Payment_Screen.dart';
import 'package:flutter/material.dart';
import 'cart_model.dart';

class Checkout extends StatefulWidget {
  @override
  final  data;
  Checkout({Key key, this.data}) : super(key: key);
  State<StatefulWidget> createState() => check_out(data);
}

class Item {
  final String itemName;
  final String itemQun;
  final String itemPrice;

  Item({this.itemName, this.itemQun, this.itemPrice});
}

class check_out extends State<Checkout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  List<cart_model> data;
  check_out(this.data);
  IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }


  String toolbarname = 'CheckOut';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final double height = MediaQuery.of(context).size.height;

    AppBar appBar = AppBar(
      leading: IconButton(
        icon: Icon(_backIcon()),
        alignment: Alignment.centerLeft,
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(toolbarname),
      backgroundColor: Colors.green,
      actions: <Widget>[
        new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Container(
            height: 150.0,
            width: 30.0,
            child: new GestureDetector(
              onTap: () {
                /*Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder:(BuildContext context) =>
                      new CartItemsScreen()
                  )
              );*/
              },
            ),
          ),
        )
      ],
    );

    return new Scaffold(
      key: _scaffoldKey,
      appBar: appBar,
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(5.0),
                child: Card(
                    child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // three line description
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Delivery',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.play_circle_outline,
                                                color: Colors.blue,
                                              ),
                                              onPressed: null)
                                        ],
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            'Payment',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black38),
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.check_circle,
                                                color: Colors.black38,
                                              ),
                                              onPressed: null)
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ],
                        )))),
            _verticalDivider(),
            new Container(
              alignment: Alignment.topLeft,
              margin:
                  EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
              child: new Text(
                'Delivery Address',
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
                      height: 205.0,
                      width: 56.0,
                      child: Card(
                        elevation: 3.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                    icon: Icon(Icons.add), onPressed: null)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 105.0,
                      width: 200.0,
                      margin: EdgeInsets.all(7.0),
                      child: Card(
                        elevation: 3.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Column(
                              children: <Widget>[
                                new Container(
                                  margin: EdgeInsets.only(
                                      left: 12.0,
                                      top: 5.0,
                                      right: 0.0,
                                      bottom: 5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text(
                                        'Pritish Wakhare',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      _verticalDivider(),
                                      new Text(
                                        ' H.no 106',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13.0,
                                            letterSpacing: 0.5),
                                      ),
                                      _verticalDivider(),
                                      new Text(
                                        'shaniwar Wada ',
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
                                        margin: EdgeInsets.only(
                                            left: 00.0,
                                            top: 05.0,
                                            right: 0.0,
                                            bottom: 5.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                          ],
                        ),
                      ),
                    ),


                  ],
                )),
            _verticalDivider(),
            new Container(
              alignment: Alignment.topLeft,
              margin:
                  EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
              child: new Text(
                'Order Summary',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                    left: 12.0, top: 5.0, right: 12.0, bottom: 5.0),
                height: 170.0,
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext cont, int ind) {
                      return SafeArea(
                          child: Column(
                        children: <Widget>[
                          Divider(height: 15.0),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: Row(

                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[

                                      Text(data[ind].itemname,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold)),
                                      Text(data[ind].quantity.toString(),
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold)),
                                      Text(data[ind].itmprice.toString(),
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold)),
                                    ],

                            ),
                          ),
                        ],
                      ));
                    })),
            Container(
                alignment: Alignment.bottomLeft,
                height: 50.0,
                child: Card(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.info), onPressed: null),
                      Text(
                        'Total :',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\₹'+data[data.length-1].finalsum.toString(),
                        style: TextStyle(fontSize: 17.0, color: Colors.black54),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: OutlineButton(
                              borderSide:
                                  BorderSide(color: Colors.green),
                              child: const Text('Order Now '),
                              textColor: Colors.green,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Patment(data : data[data.length-1].finalsum)));
                              },
                              shape: new OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
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
