import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partner/login.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';


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
      drawer: MultiLevelDrawer(
          backgroundColor: Colors.white,
          rippleColor: Colors.white,
          subMenuBackgroundColor: Colors.grey.shade100,
          header: Container( 
            margin: EdgeInsets.only(top: 30),
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network("https://i.pinimg.com/originals/93/25/7d/93257da860d6ff6ac907190300ecda57.jpg",width: 180,height: 180,),
               
              ],
            )),
          ),

          children: [           // Child Elements for Each Drawer Item
            MLMenuItem(
                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "My Profile",
                ),
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                ],
                onClick: () {}),
            MLMenuItem(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_right),
                content: Text("Settings"),
                onClick: () {},
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 2"))
                ]),
            MLMenuItem(
              leading: Icon(Icons.notifications),
              content: Text("Notifications"),
              onClick: () {},
            ),
            MLMenuItem(
                leading: Icon(Icons.payment),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Payments",
                ),
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
                ],
                onClick: () {}),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "",
            style: TextStyle(color: Colors.black),
          ),
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
                              EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Text("Toyota",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Text(
                           "This is a sample presentation of mobile aaplication. The content is a random choice. Any resemblance to persons, names or statements is random and has nothing to do with reality.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xAA000000),
                              fontWeight: FontWeight.w400,
                                    ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Text(
                          "Address Street:  811, 8 Floor, Dalamal House, Nariman Point\nCity:   Mumbai\nState/province/area:    Maharashtra\nPhone number  02222841349\nZip code  400021\nCountry calling code  +91",
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
          control: new SwiperControl(size: 0,),
          
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


