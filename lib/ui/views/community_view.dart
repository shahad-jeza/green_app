import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      color: Colors.green[50],
      child: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 20),
                child: Image(image: AssetImage('assets/images/communication.png') , width: 150, height: 150,),
              ),
              Text('''Ask Questions ...
Share Thoughts !''' ,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),)
            ],
          )
        ],
      ),
    );
  }
}
