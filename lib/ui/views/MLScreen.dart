import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class MLScreen extends StatelessWidget {
  const MLScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.green[50],
      width: double.infinity,
      height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image(image: AssetImage('assets/images/ml.png') , width: 250, height: 250,),

            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 5, 20),
                child: Text('''not sure which recycling bin ?
try our machine learning model ! ''' ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24 ,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),),
            ),

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
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                        child: Icon(Icons.camera_enhance_rounded , size: 40,),
                      ),
                      Text("take image",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),),
                    ],
                  )
              ),
            ),

          ],
        ),
    );
  }
}
