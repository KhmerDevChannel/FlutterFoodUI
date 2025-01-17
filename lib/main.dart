import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_food/food_details.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffBDDFFB),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomMenuIndex = 1;
  int tabItemIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu_open),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Material(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              shape: CircleBorder(),
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xffBDDFFB),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                "Delicious Food",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 8, right: 20),
              child: Text(
                "We made fresh and Healthy food",
                style: TextStyle(color: Colors.black.withOpacity(0.7)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabTypeItem(
                    iconData: Icons.fastfood,
                    isActive: tabItemIndex == 1,
                    onTabItemClick: () {
                      setState(() {
                        tabItemIndex = 1;
                      });
                    },
                  ),
                  TabTypeItem(
                    iconData: Icons.local_drink,
                    isActive: tabItemIndex == 2,
                    onTabItemClick: () {
                      setState(() {
                        tabItemIndex = 2;
                      });
                    },
                  ),
                  TabTypeItem(
                    iconData: Icons.emoji_food_beverage,
                    isActive: tabItemIndex == 3,
                    onTabItemClick: () {
                      setState(() {
                        tabItemIndex = 3;
                      });
                    },
                  ),
                  TabTypeItem(
                    iconData: Icons.no_food_rounded,
                    isActive: tabItemIndex == 4,
                    onTabItemClick: () {
                      setState(() {
                        tabItemIndex = 4;
                      });
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 270,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        FoodItem(
                          heroTag: "food1",
                          imageAsset: "assets/food1.png",
                          itemClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodDetailPage(
                                          heroTag: "food1",
                                          imageAsset: "assets/food1.png",
                                        )));
                          },
                        ),
                        FoodItem(
                          heroTag: "food2",
                          imageAsset: "assets/food2.png",
                          itemClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodDetailPage(
                                          heroTag: "food2",
                                          imageAsset: "assets/food2.png",
                                        )));
                          },
                        ),
                        FoodItem(
                          heroTag: "food3",
                          imageAsset: "assets/food3.png",
                          itemClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FoodDetailPage(
                                        heroTag: "food3",
                                        imageAsset: "assets/food3.png")));
                          },
                        )
                      ],
                    ),
                  ),
                  FoodItem2(
                    imageAsset: "assets/food4.png",
                  ),
                  FoodItem2(
                    imageAsset: "assets/food5.png",
                  ),
                  FoodItem2(
                    imageAsset: "assets/food6.png",
                  ),
                  FoodItem2(
                    imageAsset: "assets/food7.png",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xffBDDFFB),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(25)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MenuBottomItem(
                  iconData: Icons.home_outlined,
                  isActive: bottomMenuIndex == 1,
                  onItemClick: () {
                    setState(() {
                      bottomMenuIndex = 1;
                    });
                  },
                ),
                MenuBottomItem(
                  iconData: Icons.account_balance_wallet_outlined,
                  isActive: bottomMenuIndex == 2,
                  onItemClick: () {
                    setState(() {
                      bottomMenuIndex = 2;
                    });
                  },
                ),
                MenuBottomItem(
                  iconData: Icons.messenger_outline,
                  isActive: bottomMenuIndex == 3,
                  onItemClick: () {
                    setState(() {
                      bottomMenuIndex = 3;
                    });
                  },
                ),
                MenuBottomItem(
                  iconData: Icons.account_circle_outlined,
                  isActive: bottomMenuIndex == 4,
                  onItemClick: () {
                    setState(() {
                      bottomMenuIndex = 4;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String heroTag;
  final String imageAsset;
  final VoidCallback itemClick;

  FoodItem({Key key, this.heroTag, this.imageAsset, this.itemClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        itemClick();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Crab Ramen",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 0),
                      child: Text("Spicy with garlic"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$ 24.00"),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(0.3, 20),
                          blurRadius: 18,
                          spreadRadius: -15),
                    ]),
                child: Hero(
                  tag: heroTag,
                  child: Image.asset(
                    imageAsset,
                    width: 140,
                    height: 140,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FoodItem2 extends StatelessWidget {
  final String imageAsset;

  FoodItem2({Key key, this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Crab Ramen",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 0),
                    child: Text("Spicy with garlic"),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$ 24.00")),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(-15, 1),
                        blurRadius: 18,
                        spreadRadius: -15),
                  ]),
              child: Image.asset(
                imageAsset,
                width: 140,
                height: 140,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TabTypeItem extends StatelessWidget {
  final IconData iconData;
  final bool isActive;
  final VoidCallback onTabItemClick;

  TabTypeItem({Key key, this.iconData, this.isActive, this.onTabItemClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTabItemClick();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? Colors.black : Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            color: isActive ? Colors.white : Colors.black,
            size: isActive ? 20 : 18,
          ),
        ),
      ),
    );
  }
}

class MenuBottomItem extends StatelessWidget {
  final IconData iconData;
  final bool isActive;
  final VoidCallback onItemClick;

  MenuBottomItem({Key key, this.iconData, this.isActive, this.onItemClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClick();
      },
      child: AnimatedContainer(
        width: isActive ? 50 : 40,
        height: isActive ? 50 : 40,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(isActive ? 0.2 : 0.0),
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
