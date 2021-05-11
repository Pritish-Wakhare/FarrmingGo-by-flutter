import 'package:farmfresheasy/farmsScreen.dart';
import 'item_model.dart';
import 'Cart_Screen.dart';
import 'help_screen.dart';
import 'item_screen.dart';
import 'orderhistory_screen.dart';
import 'main.dart';
import 'setting_screen.dart';
import 'package:flutter/material.dart';
//import 'package:loader_search_bar/loader_search_bar.dart';
//import 'package:flutter/foundation.dart';
import 'Account_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class Home_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new home();
// TODO: implement createState

}

class Photo {
  Photo({
    this.assetName,
    this.assetPackage,
    this.title,
    this.caption,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;
}

class home extends State<Home_screen> {
  final _auth =FirebaseAuth.instance;
  FirebaseUser  loggedinUser;
  @override
  void initState() {

    super.initState();
    getCurrentUser();

  }
  dynamic data;

 /* Future<dynamic> getData() async {

  try {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedinUser = user;
      print(loggedinUser.email);
    }
    final DocumentReference document = await Firestore.instance.collection(
        "regdetails").document(loggedinUser.email);

    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data;
      });
    });
    print(data['mobnum']);
  }
  catch(e)
    {
      print(e);
    }

  }*/
  String email,mobnum,username;

  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.email);
        if(loggedinUser.email == 'neha@gmail.com')
          {
            email = 'neha@gmail.com';
            mobnum = '9291233566';
            username= 'Neha Guptha';

          }
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  List list = ['12', '11'];
  List<item_model> fruits = [
    item_model('apple.jpg', 'Apple', 10),
    item_model('kiwi.jpg', 'Kiwi Fruit', 10),
    item_model('guava.jpg', 'Guava', 5),
    item_model('grapes.jpg', 'Grapes', 20),
    item_model('strawberry.jpg', 'Strawberry', 8),
    item_model('banana.jpg', 'Banana', 5),
    item_model('orange.jpg', 'Orange', 20),
    item_model('pineapple.jpg', 'Pineapple', 8),
  ];
  List<item_model> vegetables =[
    item_model('lemons.jpg', 'Lemon', 5),
    item_model('tomato.jpg', 'Tomato', 5),
    item_model('cauliflower.jpeg', 'Cauliflower', 10),
    item_model('cucumber.jpeg', 'cucumber', 10),
    item_model('carrots.jpeg', 'Carrots', 2),
    item_model('potato.jpeg', 'Potato', 2),
    item_model('onion.jpeg', 'Onions', 2),
  ];
  List<item_model> spices =[
    item_model('cinnamon.jpg', 'Cinnamon  per 100g', 10),
    item_model('cardamom.jpg', 'Cardamom per 100g', 10),
    item_model('turmeric.jpeg', 'Turmeric per 100g', 10),
    item_model('ginger.jpeg', 'Ginger per 100g', 10),
    item_model('clove.jpg', 'Clove per 100g', 10),
    item_model('coriander.jpg', 'Coriander per 100g', 10),
    item_model('garlic.jpg', 'Garlic per 100g', 2),
  ];
  List<item_model> cashcrops =[
    item_model('coffee.jpg', 'Coffee  per 100g', 10),
    item_model('groundnut.jpg', 'Ground nut per 100g', 10),
    item_model('cotton.jpeg', 'Cotton per 100g', 10),
    item_model('tea.jpg', 'Tea leaves per 100g', 10),
    item_model('sugarcane.jpg', 'Sugarcane per 100g', 10),

  ];
  List<item_model> grains =[
    item_model('bajra.jpg', 'Bajra  per 500g', 10),
    item_model('basmati.jpeg', 'Basmati Rice per 500g', 10),
    item_model('barley.jpeg', 'Barley per 500g', 10),
    item_model('rice.jpeg', 'Rice per 500g', 10),
    item_model('sorghum.jpg', 'Sorghum per 500g', 10),
    item_model('wheat.jpeg','Wheat per 500g',50),

  ];
  List<item_model> pulses =[
    item_model('greengram.jpg', 'greengram  per 500g', 10),
    item_model('rajma.jpg', 'Basmati Rice per 500g', 10),
    item_model('roastedgram.jpg', 'Barley per 500g', 10),
    item_model('til.jpg', 'Rice per 500g', 10),
  ];
  List<item_model> dairy =[
    item_model('curd.jpeg', 'curd per 500g', 10),
    item_model('cheese.jpg', 'cheese Rice per 500g', 10),
    item_model('panner.jpg', 'paneer per 500g', 10),
    item_model('milk.jpeg', 'milk per 500ml', 10),
    item_model('butter.jpeg', 'butter per 500g', 10),

  ];
  List<item_model> nonveg =[
    item_model('chicken.jpg', 'chicken per 500g', 10),
    item_model('fish.jpg', 'Fish per 500g', 10),
    item_model('prawns.jpg', 'prawns per 500g', 10),


  ];
  
  String searched;

  List<item_model> itemList;

  List<Photo> photos = <Photo>[
    Photo(
      assetName: 'veg.jpg',
      title: 'Fruits',
      caption: 'fruits',
    ),
    Photo(
      assetName: 'frozen.jpg',
      title: 'Vegetables',
      caption: 'vegetables',
    ),
    Photo(
      assetName: 'bev.jpg',
      title: 'Cash crops',
      caption: 'cashcrops',
    ),
    Photo(
      assetName: 'brand_f.jpg',
      title: 'Pulses',
      caption: 'pulses',
    ),
    Photo(
      assetName: 'be.jpg',
      title: 'Spices',
      caption: 'spices',
    ),
    Photo(
      assetName: 'home.png',
      title: 'Grains',
      caption: 'grains',
    ),
    Photo(
      assetName: 'nonveg.jpg',
      title: 'Non Veg',
      caption: 'nonveg',
    ),
    Photo(
      assetName: 'eggs.jpg',
      title: 'Dairy, Bakery & Eggs',
      caption: 'dairy',
    ),
  ];

  final List<String> items = ['Balbhadra', 'Maulik', 'Roshi'];
  static const double height = 366.0;
  String name ='My Wishlist';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Orientation orientation = MediaQuery.of(context).orientation;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.black54);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    ShapeBorder shapeBorder;


    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,

        title: Text("FarmmingGo"),
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
                child: Stack(
                  children: <Widget>[
                    new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart_screen()));
                        }),
                    list.length == 0
                        ? new Container()
                        : new Positioned(
                            child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.orange.shade500),
                              new Positioned(
                                  top: 4.0,
                                  right: 5.5,
                                  child: new Center(
                                    child: new Text(
                                      list.length.toString(),
                                      style: new TextStyle(
                                          color: Colors.green,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new Card(
              child: UserAccountsDrawerHeader(
                accountName: new Text("Pritish Wakhare"),
                accountEmail: new Text("abc@gmail.com"),
                onDetailsPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Account_Screen()));
                },
                decoration: new BoxDecoration(
                  backgroundBlendMode: BlendMode.difference,
                  color: Colors.green,

                  image: new DecorationImage(
               image: new ExactAssetImage('User.jpg'),
                  fit: BoxFit.cover,
                ),
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "User.jpg")),
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.favorite),
                      title: new Text(name),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Item_Screen(itemList: fruits)));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.history),
                      title: new Text("Order History "),


                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Oder_History(toolbarname: ' Order History',)));

                      }),

                ],
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.settings),
                      title: new Text("Settings"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting_Screen(toolbarname: 'Setting',)));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.help),
                      title: new Text("Help"),
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Help_Screen(toolbarname: 'Help',)));

                      }),
                  new Divider(),


                ],
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: new Text(
                    "Logout",
                    style:
                        new TextStyle(color: Colors.red, fontSize: 17.0),
                  ),
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => MyHomePage()));
                  }),
            )
          ],
        ),
      ),
      body: new SingleChildScrollView(
        child: Container(
          child: new Column(children: <Widget>[
            new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _verticalD(),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Item_Screen(itemList: fruits)));
                    },
                    child: new Text(
                      'Top Sellers',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _verticalD(),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => farmsScreen()),);
                    },
                    child: new Text(
                      'Search for farms',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _verticalD(),
                  IconButton(
                    icon: keyloch,
                    color: Colors.black26,
                  )

                ]),
            new Container(
              height: 188.0,
              margin: EdgeInsets.only(left: 5.0),
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'grthre.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )


                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'grtwo.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )


                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'groceries.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )


                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'back.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )


                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
              ]),
            ),
            new Container(
              margin: EdgeInsets.only(top: 7.0),
              child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _verticalD(),
                    new GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Item_Screen(itemList : fruits)));
                      },
                      child: new Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _verticalD(),
                    new GestureDetector(
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Item_Screen(itemList : fruits)));
                      },
                      child: new Text(
                        'Popular',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold),
                      ),


                    ),
                    _verticalD(),
                    new Row(
                      children: <Widget>[
                        new GestureDetector(
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Item_Screen(itemList : fruits)));
                          },
                          child: new Text(
                            'What"s New',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
            new Container(
              alignment: Alignment.topCenter,
              height: 700.0,

              child: new GridView.builder(
                  itemCount: photos.length,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                      onTap: (){
                        switch(photos[index].caption){
                          case 'fruits': itemList = fruits;
                          break;
                          case 'vegetables': itemList = vegetables;
                          break;
                          case 'cashcrops': itemList = cashcrops;
                          break;
                          case 'pulses': itemList = pulses;
                          break;
                          case 'spices': itemList = spices;
                          break;
                          case 'grains': itemList = grains;
                          break;
                          case 'nonveg': itemList = nonveg;
                          break;
                          case 'dairy': itemList = dairy;
                          break;
                          default: itemList = fruits;
                        }
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Item_Screen(itemList : itemList)));
                      },

                        child: new Container(
                            margin: EdgeInsets.all(5.0),
                            child: new Card(
                              shape: shapeBorder,
                              elevation: 3.0,
                              child: new Container(
                                //  mainAxisSize: MainAxisSize.max,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 152.0,
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                              child: Image.asset(
                                            photos[index].assetName,
                                            fit: BoxFit.cover,
                                          )),
                                          Container(
                                            color: Colors.black38,
                                          ),
                                          Container(
                                            //margin: EdgeInsets.only(left: 10.0),
                                            padding: EdgeInsets.only(
                                                left: 3.0, bottom: 3.0),
                                            alignment: Alignment.bottomLeft,
                                            child: new GestureDetector(
                                              onTap: () {
                                                switch(photos[index].caption){
                                                  case 'fruits': itemList = fruits;
                                                  break;
                                                  case 'vegetables': itemList = vegetables;
                                                  break;
                                                  case 'cashcrops': itemList = cashcrops;
                                                  break;
                                                  case 'pulses': itemList = pulses;
                                                  break;
                                                  case 'spices': itemList = spices;
                                                  break;
                                                  case 'grains': itemList = grains;
                                                  break;
                                                  case 'nonveg': itemList = nonveg;
                                                  break;
                                                  case 'dairy': itemList = dairy;
                                                  break;
                                                  default: itemList = fruits;
                                                }
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Item_Screen(itemList : itemList)));
                                              },
                                              child: new Text(
                                                photos[index].title,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    // new Text(photos[index].title.toString()),
                                  ],
                                ),
                              ),
                            )
                        )

                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }

  Icon keyloch = new Icon(
    Icons.arrow_forward,
    color: Colors.black26,
  );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
      );


}
