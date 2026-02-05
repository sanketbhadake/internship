import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"name": "Grocery", "image": "assets/grocery.png"},
    {"name": "Restaurant", "image": "assets/pizza.png"},
    {"name": "Fruits/Veg", "image": "assets/fruit.png"},
    {"name": "Grocery", "image": "assets/grocery.png"},
  ];

  final List<Map<String, dynamic>> newRegister = [
    {"name": "Dabur", "image": "assets/dabaur.png"},
    {"name": "Parachute", "image": "assets/parachute.png"},
    {"name": "India Gate", "image": "assets/fruit.png"},
    {"name": "Grocery", "image": "assets/grocery.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                  color: Color.fromRGBO(0, 217, 174, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu, color: Colors.white),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your location",
                            style: TextStyle(color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                "Mumbai",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.shopping_bag, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 40,
                child: Container(
                  height: 35,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 1),
                        color: Colors.grey,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_sharp),
                      border: InputBorder.none,
                      hint: Text(
                        "Search here",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  CarouselSlider(
                    items: [
                      Container(
                        height: sizeHeight,
                        width: sizeWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/Mask.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        height: sizeHeight,
                        width: sizeWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/Mask.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        height: sizeHeight,
                        width: sizeWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/Mask.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        height: sizeHeight,
                        width: sizeWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/Mask.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 120,
                      viewportFraction: 0.7,
                      autoPlay: true,
                      autoPlayCurve: Curves.easeInOut,
                      enlargeCenterPage: true,
                      animateToClosest: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: 10),
                  Center(
                    child: SmoothPageIndicator(
                      controller: PageController(initialPage: _currentIndex),
                      count: 4,
                      effect: WormEffect(
                        dotHeight: 7,
                        dotWidth: 7,
                        activeDotColor: Color.fromRGBO(0, 217, 174, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 60,

                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 20,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 1),
                              color: Colors.grey,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/gift.png"),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  "Send Packages",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // SizedBox(width: 5),
                              Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color.fromRGBO(0, 217, 174, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                  color: Colors.grey,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(categories[index]['image']),
                          ),
                          SizedBox(height: 5),
                          Text(
                            categories[index]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Text(
                    "Newly Registered on DOOSY",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      itemCount: newRegister.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(0, 1),
                                  color: Colors.grey,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(newRegister[index]['image']),
                          ),
                          SizedBox(height: 5),
                          Text(
                            newRegister[index]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
