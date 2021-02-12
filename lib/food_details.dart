import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodDetailPage extends StatefulWidget {
  final String heroTag;
  final String imageAsset;

  FoodDetailPage({this.heroTag, this.imageAsset});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.more_vert)],
        elevation: 0,
      ),
      body: Container(
        color: Color(0xffBDDFFB),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Hero(
                tag: widget.heroTag,
                child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, snapshot) {
                      return Transform.rotate(
                        angle: _animationController.value * 1.2,
                        child: Image.asset(
                          widget.imageAsset,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    "Egg Currey",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Spacer(),
                  Icon(Icons.access_time_outlined),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("25 Min"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Text(
                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur",
                style: TextStyle(height: 1.3, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text("Total Price"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    "\$ 15.00",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.favorite_border),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Material(
                              color: Colors.white,
                              child: Icon(Icons.add),
                              shape: CircleBorder(),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
