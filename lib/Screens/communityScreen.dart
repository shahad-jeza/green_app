import 'package:flutter/material.dart';

class communityScreen extends StatelessWidget {
  const communityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "communityScreen",
          style: TextStyle(
            color: Colors.green[50],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
