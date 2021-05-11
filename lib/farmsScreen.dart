import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'maps.dart';


enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}
class farmsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => farm();
}

class Item {
  final String itemImage;
  final String itemName;
  final String itemPrice;

  Item({this.itemImage, this.itemName,  this.itemPrice});
}

class farm extends State<farmsScreen> {

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }


  List<Item> itemList = <Item>[

    Item(
        itemImage: 'hakdairy.jpg',
        itemName: 'Hak dairy Farm',
        itemPrice: '5.1 km away'),
    Item(
        itemImage: 'mushrooms.jpg',
        itemName: 'Manikanta mushrooms',

        itemPrice: '210km away'),
    Item(
        itemImage: 'organic.jpg',
        itemName: 'Organic Farm',

        itemPrice: '200km away'),
    Item(
        itemImage: 'mango.jpg',
        itemName: 'Mango Tree Farm',

        itemPrice: '130 km away'),
    Item(
        itemImage: 'cottonfarm.jpg',
        itemName: 'Cotton farm',

        itemPrice: '120km away'),
    Item(
        itemImage: 'poultry.jpg',
        itemName: 'Sneha poultry',

        itemPrice: '20km away'),

  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();









  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    double dd = width * 0.9;
    double hh = height - 215.0;
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(
        color: theme.textTheme.caption.color);
    showAlertDialog(BuildContext context) {
      Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(
            context);



        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Setting location to your current Location"),
        content: Text(_currentAddress),
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

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,

        title: Text("Farms available"),
        leading: IconButton(
          icon: keyloch,
          color: Colors.black26,
          onPressed: () {
            _getCurrentLocation();
                  print(_currentAddress);
                  showAlertDialog(context);
                  print("entered");


          },
        ),
      ),

      body:

      Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: dd,
            height:40,
            child: OutlineButton(

                borderSide: BorderSide(color: Colors.blue),
                child: const Text('Show in map'),
                textColor: Colors.amber.shade500,
                onPressed: () {
                  /*_getCurrentLocation();
                  print(_currentAddress);
                  showAlertDialog(context);
                  print("entered");*/
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Map_Screen()));

                },
                shape: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )),

          ),

          Container(
              margin: EdgeInsets.only(
                  left: 12.0, top: 5.0, right: 12.0, bottom: 10.0),
              height: hh,
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext cont, int ind) {
                    return SafeArea(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[
                              Container(

                                  alignment: Alignment.topLeft,

                                  child: Row(
                                    children: <Widget>[
                                      Container(

                                        height: 120.0,
                                        width: dd,
                                        child: Card(
                                          child: Row(
                                            children: <Widget>[
                                              SizedBox(
                                                  height: 110.0,
                                                  width: 100.0,
                                                  child: Image.asset(
                                                    itemList[ind].itemImage,
                                                    fit: BoxFit.fill,
                                                  )),
                                              SizedBox(
                                                  height: 110.0,
                                                  child: Container(
                                                    alignment: Alignment
                                                        .topLeft,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        _verticalD(),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          children: <Widget>[
                                                            Text(
                                                              itemList[ind]
                                                                  .itemName,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  fontSize: 18.0,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                          ],
                                                        ),
                                                        _verticalD(),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          mainAxisSize: MainAxisSize.max,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(
                                                              itemList[ind]
                                                                  .itemPrice,
                                                              style: TextStyle(
                                                                  fontSize: 15.0,
                                                                  color:
                                                                  Colors
                                                                      .black54),
                                                            ),
                                                          ],
                                                        ),


                                                      ],
                                                    ),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),



                                    ],
                                  )),


                            ],

                          ),
                        ));
                  })),

        ],
      ),
    );
  }

  verticalDivider() =>
      Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() =>
      Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 07.0, bottom: 0.0),
      );

  void showDemoDialog<T>({ BuildContext context, Widget child }) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    )
        .then<void>((T value) { // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('You selected: $value')
        ));
      }
    });
  }
}
Icon keyloch = new Icon(
  Icons.arrow_forward,
  color: Colors.black26,
);
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 30.0);