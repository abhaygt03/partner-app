import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  final img;
  Order(this.img);
  @override
  Widget build(BuildContext context) {
    return Card(
       shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18.0),
                                  child: Image.network(img),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Text("Toyota",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Text(
                             "Licence Plate:                            XX XX XXXX\n\nOwner:                                        XXXX\n\nType:                                           Exterior+Alloy\n\nDate:                                           04/06/21\n\nTime:                                          5 PM-7 PM",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xAA000000),
                                fontWeight: FontWeight.bold,
                                      ),
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Text(
                            "",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xAA000000),
                                fontWeight: FontWeight.w400,
                                      ),
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}