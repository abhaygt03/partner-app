import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partner/login.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 var pic=["https://images.unsplash.com/flagged/photo-1564153296137-400b51e1ff6d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8dG95b3RhfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
 "https://images.unsplash.com/photo-1603138461788-8090d5c00bf7?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTh8fHRveW90YXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
 "https://images.unsplash.com/photo-1477863194645-f73e9c71b296?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NjN8fHRveW90YXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
 "https://images.unsplash.com/photo-1588440983028-d53e24fa96cc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8ODB8fHRveW90YXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"];
  String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
          )
        ],
      ),
      body: SizedBox(
        // height: 300,
        
        child: new Swiper(
          itemBuilder: (BuildContext context,int index){
            return new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18.0),
                                child: Image.network(pic[index],),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Text("Toyota car"),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                          child: Text(
                           "A red coloured car need to be washed on today",
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
          },
          itemCount: 4,
          loop: false,
          // pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
  }
}


