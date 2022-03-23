import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:green_app/viewmodles/startup_view_model.dart';
import 'package:stacked/stacked.dart';

import '../../constants.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<StartUpViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Container(
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


                //sign up button
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor: AlwaysStoppedAnimation(Color(0xFFFEB050)),
                  ),
                )

              ],

            ),
          )
        ),
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady:(model) => model.handleStartUpLogic(),
    ) ;
  }
}
