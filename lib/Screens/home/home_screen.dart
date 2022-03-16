import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      color: Colors.green[50],
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 80, 20, 0),
            child: Text('what do you need to recycle ? ' ,
              style: TextStyle(
                fontSize: 24 ,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),),
          ),
          Container(
            height: 114,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                IconButton(
                  icon: Image.asset('assets/images/plastic.png'),
                  iconSize: 117,
                  onPressed: () {},
                ),

                IconButton(
                  icon: Image.asset('assets/images/paper.png'),
                  iconSize: 117,
                  onPressed: () {},
                ),

                IconButton(
                  icon: Image.asset('assets/images/metal.png'),
                  iconSize: 117,
                  onPressed: () {},
                ),

                IconButton(
                  icon: Image.asset('assets/images/glass.png'),
                  iconSize: 117,
                  onPressed: () {},
                ),

                IconButton(
                  icon: Image.asset('assets/images/organic.png'),
                  iconSize: 117,
                  onPressed: () {},
                ),

                IconButton(
                  icon: Image.asset('assets/images/electronics.png'),
                  iconSize: 117,
                  onPressed: () {},
                ),
              ],

            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 145, 10),
            child: Text('places near you :  ',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 24 ,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),),
          ),
        ],
      ),
    );
  }
}
