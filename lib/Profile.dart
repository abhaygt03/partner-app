import 'package:flutter/material.dart';
import "package:partner/login.dart";

class ProfilePage extends StatefulWidget {
  
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {



  @override
  Widget build(BuildContext context) {
    double hPadding = 40;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://i.pinimg.com/originals/93/25/7d/93257da860d6ff6ac907190300ecda57.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.4,
            child: Container(
              decoration:BoxDecoration(
              borderRadius:BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
              color: Color(0xFF1a1a1a),
                         ),

              child:  Container(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _titleSection(),
                _infoSection(),
                _actionSection(hPadding: hPadding),
              ],
            ),
          ),
            ),
          ),

          /// Sliding Panel
        
        ],
      ),
    );
  }



  /// Action Section
  Row _actionSection({double hPadding}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: true,
          child: Expanded(
            child: OutlineButton(
              onPressed:()=>print("pressed") ,
              borderSide: BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Profile Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'NimbusSanL',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: true,
          child: SizedBox(
            width: 16,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: true
                  ? (MediaQuery.of(context).size.width - (2 * hPadding)) / 1.6
                  : double.infinity,
              child: FlatButton(
                onPressed:()async{
           Navigator.pushAndRemoveUntil(context, 
           MaterialPageRoute(builder: (context)=>LoginScreen()),
            (route) => false);
         },
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    fontFamily: 'NimbusSanL',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Info Section
  Row _infoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _infoCell(title: 'Age', value: '35'),
        Container(
          width: 1,
          height: 40,
          color: Colors.grey,
        ),
        _infoCell(title: 'Hourly Rate', value: "Rs 200"),
        Container(
          width: 1,
          height: 40,
          color: Colors.grey,
        ),
        _infoCell(title: 'Location', value: 'Patiala'),
      ],
    );
  }

  /// Info Cell
  Column _infoCell({String title, String value}) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Colors.white
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.white

          ),
        ),
      ],
    );
  }

  /// Title Section
  Column _titleSection() {
      String name="Rohan";
      int indsp=name.indexOf(" ");
    return Column(
      children: <Widget>[
        Text(
          indsp>0?
          name[0].toUpperCase()+name.substring(1,indsp)+" "+name[indsp+1].toUpperCase()+name.substring(indsp+2):
           name[0].toUpperCase()+name.substring(1),
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Colors.white

          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Worker",
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
            color: Colors.white

          ),
        ),
      ],
    );
  }
}