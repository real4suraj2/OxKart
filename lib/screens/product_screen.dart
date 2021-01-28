import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:oxkart/constants.dart';
import 'package:oxkart/services/store.dart';
// import 'package:oxkart/mock.dart'; --> Shift to firestore complete

// import 'package:oxkart/widgets/image_card.dart';

class Product extends StatefulWidget {
  Product(this.url, this.info, this.price);

  final String url;
  final String info;
  final String price;
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  Store store = Store();
  //Product(this.id);
  //final String id; //---> fetch data based on id
  // bool _toggle = false;

  // final List<Widget> detailItems = List.generate(DETAILS.length, (i) {
  //   return Container(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         SizedBox(height: 12.0),
  //         Text(
  //           DETAILS[i]['title'][LANG],
  //           style: TextStyle(
  //             fontSize: 17.0,
  //           ),
  //         ),
  //         SizedBox(height: 6.0),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: List.generate(DETAILS[i]['content'].length, (j) {
  //             return Container(
  //               margin: EdgeInsets.only(bottom: 4.0),
  //               child: Text(
  //                 "\u2022 " + DETAILS[i]['content'][j],
  //                 style: TextStyle(
  //                   fontSize: 12.0,
  //                 ),
  //               ),
  //             );
  //           }),
  //         ),
  //         SizedBox(height: 12.0),
  //       ],
  //     ),
  //   );
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbeff3f6),
      appBar: AppBar(
        title: Text(widget.info),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, cartRoute);
              },
              child: Icon(Icons.shopping_cart, size: 26.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.share, size: 26.0),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl: widget.url,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    // child: new Swiper(
                    //   itemBuilder: (BuildContext context, int index) {
                    //     return Container(
                    //       // child: Center(child: Image.asset(data['uri'])),
                    //       child: Center(
                    //         child: Image.asset('assets/images/logo.png'),
                    //       ),
                    //     );
                    //   },
                    //   control: new SwiperControl(),
                    //   itemCount: SLOGANS.length,
                    //   viewportFraction: 1.0,
                    //   scale: 0.9,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.info,
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '${widget.price}.00',
                      style: TextStyle(
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  SizedBox(
                      height: 1.0,
                      width: double.infinity,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey[600]),
                      )),
                  // SizedBox(height: 12.0),
                  // Text(
                  //   "Check Availability at your Pin Code",
                  //   style: TextStyle(
                  //     fontSize: 15.0,
                  //   ),
                  // ),
                  SizedBox(height: 24.0),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: <Widget>[
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Container(
                  //           width: 230.0,
                  //           child: Text(
                  //             "Delivering to PIN Code :",
                  //             style: TextStyle(
                  //               fontSize: 20.0,
                  //               color: Colors.grey[700],
                  //             ),
                  //           ),
                  //         ),
                  //         Container(
                  //           width: 230.0,
                  //           child: Text(
                  //             "487001, Narsinghpur",
                  //             style: TextStyle(
                  //               fontSize: 20.0,
                  //               color: Colors.grey[700],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     GestureDetector(
                  //       child: Container(
                  //         color: Colors.green,
                  //         width: 100.0,
                  //         child: Padding(
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 24.0, vertical: 12.0),
                  //           child: Center(
                  //             child: Text(
                  //               'Change',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 12.0),
                  // Text(
                  //   'Delivery within 5-7 working days',
                  //   style: TextStyle(
                  //     color: Colors.blue,
                  //   ),
                  // ),
                  // SizedBox(height: 36.0),
                  Row(
                    children: <Widget>[
                      Icon(Icons.list, size: 28.0),
                      SizedBox(width: 12.0),
                      Text(
                        'Product Description',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.info,
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        // Text(
                        //   'Magic soil is a premium potting soil, rich in Bio-Available Macro & Micro Nutrients such as Nitrogen, Phosphorous, Potassium, Magnesium, Calcium etc. The product ensures healthier vegetative and reproductive growth of the plant throughout the growing period by enhancing the proper nutrient uptake of the plant, while providing the right aeration and moisture.',
                        //   style: TextStyle(
                        //     fontSize: 12.0,
                        //     height: 1.8,
                        //   ),
                        // ),
                        // SizedBox(height: 12.0),
                        // RichText(
                        //   text: TextSpan(
                        //     text: "Manufactured and Packed by :  ",
                        //     style: TextStyle(
                        //       fontSize: 17.0,
                        //       fontFamily: 'Nunito',
                        //       color: Colors.black,
                        //     ),
                        //     children: <TextSpan>[
                        //       TextSpan(
                        //         text: 'Oxkart Pvt. Ltd.',
                        //         style: TextStyle(
                        //           fontSize: 12.0,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        SizedBox(height: 12.0),
                        RichText(
                          text: TextSpan(
                            text: "Marketed By :  ",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Nunito',
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Oxkart Pvt. Ltd.',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.0),
                        RichText(
                          text: TextSpan(
                            text: "Sold By :  ",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontFamily: 'Nunito',
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Oxkart Pvt. Ltd.',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.0),
                        // _toggle
                        //     ? SizedBox(
                        //         height: 1.0,
                        //         width: double.infinity,
                        //         child: DecoratedBox(
                        //           decoration:
                        //               BoxDecoration(color: Colors.grey[600]),
                        //         ))
                        //     : SizedBox(),
                        // _toggle
                        //     ? Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: List.generate(detailItems.length,
                        //             (i) => detailItems[i]),
                        //       )
                        //     : GestureDetector(
                        //         onTap: () {
                        //           setState(() {
                        //             _toggle = true;
                        //           });
                        //         },
                        //         child: Center(
                        //           child: Text(
                        //             'Read More',
                        //             style: TextStyle(
                        //               color: Colors.blue,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        // _toggle
                        //     ? GestureDetector(
                        //         onTap: () {
                        //           setState(() {
                        //             _toggle = false;
                        //           });
                        //         },
                        //         child: Center(
                        //           child: Text(
                        //             'Read Less',
                        //             style: TextStyle(
                        //               color: Colors.blue,
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //     : SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.0),
                  // SizedBox(
                  //     height: 1.0,
                  //     width: double.infinity,
                  //     child: DecoratedBox(
                  //       decoration: BoxDecoration(color: Colors.grey[600]),
                  //     )),
                  SizedBox(height: 12.0),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 12.0),
                  //   child: Text(
                  //     "Related Products",
                  //     style: TextStyle(
                  //       fontSize: 17.0,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   height: 300.0,
                  //   child: ListView.builder(
                  //     itemCount: 10,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (BuildContext context, int index) =>
                  //         ImageCard(
                  //             'assets/images/logo.png',
                  //             'Oxkart Diet(Instant Plant Food) - 500 ml',
                  //             "\u20B9" + "250.00"),
                  //   ),
                  // ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                await store.addProduct(widget.info);
                Navigator.pushNamed(context, cartRoute);
              },
              child: Container(
                height: 50.0,
                width: double.infinity,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.shopping_basket,
                        size: 32.0, color: Colors.white),
                    SizedBox(width: 12.0),
                    Text(
                      'Add To Bag',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//'Manufactured and Packed by : ,
