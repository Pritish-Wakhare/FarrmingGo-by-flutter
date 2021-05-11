import 'package:flutter/material.dart';
import 'description.dart';



enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}
class raise extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => rais();
}

class Item {
  final String itemImage;
  final String itemName;
  final String itemPrice;

  Item({this.itemImage, this.itemName,  this.itemPrice});
}

class rais extends State<raise> {

  List<Item> itemList = <Item>[

    Item(
        itemImage: 'one.jpg',
        itemName: 'Ram Bhau',
        itemPrice: '\₹ 10000'),
    Item(
        itemImage: 'two.jpg',
        itemName: 'Jheta',

        itemPrice: '\₹ 11200'),
    Item(
        itemImage: 'three.jpg',
        itemName: 'bhide bhau ',

        itemPrice: '\₹ 10500'),
    Item(
        itemImage: 'four.jpg',
        itemName: 'Popat  ',

        itemPrice: '\₹ 9000'),
    Item(
        itemImage: 'five.jpg',
        itemName: 'Zaheer ',

        itemPrice: '\₹ 70000'),
    Item(
        itemImage: 'five.jpg',
        itemName: 'Shayam ',
        itemPrice: '\₹ 50000'),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  IconData _backIcon() {
    switch (Theme
        .of(context)
        .platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  String pincode;
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

    double dd = width * 0.77;
    double hh = height - 215.0;
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle = theme.textTheme.subhead.copyWith(
        color: theme.textTheme.caption.color);

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(_backIcon()),
          alignment: Alignment.centerLeft,
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(' Uplift Funds Now'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(10.0),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 10.0),

              child: Card(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: GestureDetector(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // three line description
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Pincode : ',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 2.0),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      'Ramtek 441106 ',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          color: Colors.black),
                                    ),
                                    onTap: () {
                                      showDemoDialog<DialogDemoAction>(
                                          context: context,
                                          child: AlertDialog(
                                              title: const Text(
                                                  'Location/Area Pincode'),
                                              content:SizedBox(
                                                height: 24.0,
                                                child: TextFormField(
                                                    keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                                                    decoration: new InputDecoration(
                                                        hintText: '******',
                                                        labelText: 'Pincode'
                                                    ),
                                                    //  validator: this._validateEmail,
                                                    onSaved: (String value) {
                                                      this.pincode = value;
                                                    }
                                                ),),

                                              actions: <Widget>[
                                                FlatButton(
                                                    child: const Text(
                                                        'CANCEL'),
                                                    onPressed: () {
                                                      Navigator.pop(context,
                                                          DialogDemoAction
                                                              .disagree);
                                                    }
                                                ),
                                                FlatButton(
                                                    child: const Text('SAVE'),
                                                    onPressed: () {
                                                      Navigator.pop(context,
                                                          DialogDemoAction
                                                              .agree);
                                                    }
                                                )
                                              ]
                                          )
                                      );
                                    },
                                  )

                                ],
                              ),
                            ],
                          ))))),
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
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding: const EdgeInsets.only(bottom: 8.0),
                                                              child:  Container(
                                                                alignment: Alignment.center,
                                                                width: 100,
                                                                height:40,
                                                                child: OutlineButton(

                                                                    borderSide: BorderSide(color: Colors.green),
                                                                    child: const Text('Donate'),
                                                                    textColor: Colors.red,
                                                                    onPressed: () {
                                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> description()));
                                                                    },
                                                                    shape: new OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(30.0),
                                                                    )),
                                                              ),
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

                                      SizedBox(
                                          height: 110.0,
                                          width: 50.0,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              itemList[ind].itemPrice,
                                            ),
                                          )

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
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 30.0);