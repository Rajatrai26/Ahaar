import 'package:ahaar/pages/details.dart';
import 'package:ahaar/widget/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool meal = false, snacks = false, package = false, drinks = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello Rajat,", style: AppWidget.boldTextFeildStyle()),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text("Delicious Food", style: AppWidget.HeadLineTextFeildStyle()),
            Text("Discover and Get Great Food",
                style: AppWidget.LightTextFeildStyle()),
            SizedBox(
              height: 20.0,
            ),
            Container(margin: EdgeInsets.only(right: 20.0), child: showItem()),
            SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/chola.png",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Text("Chola & Bhatura",
                                  style: AppWidget.semiBoldTextFeildStyle()),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text("Hot and tasty",
                                  style: AppWidget.LightTextFeildStyle()),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "\₹25",
                                style: AppWidget.semiBoldTextFeildStyle(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "images/dosa.png",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text("Dosa  & Sambhar",
                                style: AppWidget.semiBoldTextFeildStyle()),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text("Hot and tasty",
                                style: AppWidget.LightTextFeildStyle()),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "\₹20",
                              style: AppWidget.semiBoldTextFeildStyle(),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/samosa.png",
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Samosa",
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Hot & Tasty",
                              style: AppWidget.LightTextFeildStyle(),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "\₹10",
                              style: AppWidget.semiBoldTextFeildStyle(),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // GestureDetector(
        //   onTap: () {
        //     setState(() {
        //       meal =
        //           !meal; // Toggle state to give pressed effect
        //       snacks = false;
        //       package = false;
        //       drinks = false;
        //     });
        //   },
        //   child: Material(
        //     elevation:
        //         meal ? 2.0 : 10.0, // Lower elevation when pressed
        //     borderRadius: BorderRadius.circular(10),
        //     child: AnimatedContainer(
        //       duration: Duration(
        //           milliseconds:
        //               200), // Smooth transition for press effect
        //       decoration: BoxDecoration(
        //         color: meal
        //             ? Colors.grey[800]
        //             : Colors.white, // Darker when pressed
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       padding: EdgeInsets.all(
        //           8), // Increased padding for button-like effect
        //       child: Image.asset(
        //         "images/meal.png",
        //         height: 60,
        //         width: 60,
        //         fit: BoxFit.cover,
        //         color: meal
        //             ? Colors.white
        //             : null, // Change color when pressed
        //       ),
        //     ),
        //   ),
        // ),

        GestureDetector(
          onTap: () {
            setState(() {
              meal = true;
              snacks = false;
              package = false;
              drinks = false;
            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: meal ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(1),
              child: Image.asset(
                "images/meal.png",
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                color: meal ? Colors.white : null,
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            setState(() {
              snacks = true;
              meal = false;
              package = false;
              drinks = false;
            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: snacks ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(1),
              child: Image.asset(
                "images/snacks.png",
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                color: snacks ? Colors.white : null,
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            setState(() {
              snacks = false;
              meal = false;
              package = true;
              drinks = false;
            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: package ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(1),
              child: Image.asset(
                "images/package.png",
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                color: package ? Colors.white : null,
              ),
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            setState(() {
              snacks = false;
              meal = false;
              package = false;
              drinks = true;
            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: drinks ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(1),
              child: Image.asset(
                "images/drinks.png",
                height: 60,
                width: 60,
                fit: BoxFit.cover,
                color: drinks ? Colors.white : null,
              ),
            ),
          ),
        ),

        // Material(
        //   elevation: 5.0,
        //   borderRadius: BorderRadius.circular(10),
        //   child: Container(
        //     padding: EdgeInsets.all(1),
        //     child: Image.asset(
        //       "images/pizza.png",
        //       height: 60,
        //       width: 60,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        // Material(
        //   elevation: 5.0,
        //   borderRadius: BorderRadius.circular(10),
        //   child: Container(
        //     padding: EdgeInsets.all(1),
        //     child: Image.asset(
        //       "images/package.png",
        //       height: 60,
        //       width: 60,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        // Material(
        //   elevation: 5.0,
        //   borderRadius: BorderRadius.circular(10),
        //   child: Container(
        //     padding: EdgeInsets.all(1),
        //     child: Image.asset(
        //       "images/drinks.png",
        //       height: 60,
        //       width: 60,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
