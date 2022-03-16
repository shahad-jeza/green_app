import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' ;
import 'package:green_app/Screens/Login/login_screen.dart';
import 'package:green_app/constants.dart';

import '../../signup/signup_screen.dart';



class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: Color(0xFFA9D7CC),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: size.width,height: 70),
          SvgPicture.asset(
              "assets/images/recycle.svg" ,
              width:441.4,
              height: 294 ,
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 7, 0),
            child:
            Text("lets make saving the planet easy !",
              style: TextStyle(
                  fontSize: 48 ,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),

           const Padding(
            padding: EdgeInsets.fromLTRB(27, 10, 110, 0),
            child:
            Text("start recycling and earn some money ",
              style: TextStyle(
                  fontSize: 20 ,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
              ),
            ),
          ),

      SizedBox(width: size.width,height: 70),

      // login button
      SizedBox(
        width: 297,
        height: 71,
        child: ElevatedButton(
          style:ElevatedButton.styleFrom(
            primary: kPrimaryPopColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
            )
          ) ,
            onPressed: (){},
            child: const Text("login",
              style: TextStyle(
                  color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),)),
      ),

          //sign up button
          SizedBox(
            height: 70,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {},
              child: const Text('sign up',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
            ),
          )

        ],
        
      ),
    );
  }
}
