import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_app/Screens/signup/signup_screen.dart';
import 'package:green_app/authentication.dart';
import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView ;
  LoginScreen({required this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Authentication _auth = Authentication();
  final _formKey = GlobalKey<FormState>();

  String error = '' ;
  String email='';
  String password = '' ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Color(0xFF64A195),
        child: Column(
            children: [Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 70, 0, 10),
                    child: Image(image: AssetImage('assets/images/logo.png') ),
                  ),

                Padding(
                  padding: EdgeInsets.fromLTRB(23, 0, 0, 0),
                  child: Text("Welcome back ! ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal
                    ),),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 23),
                  child: Text("sign in to your account",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal)
                  ),
                ),
              ],
            ),
              Container(
                  height: 506,
                  width: double.infinity,
                  decoration:  const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Column(
                    children: [
                   Form(
                    key: _formKey,
                    child: Column(
                      children:  [
                         Padding(
                          padding: EdgeInsets.fromLTRB(23, 40, 23, 16),
                            child: TextFormField(
                              validator: (value) => value!.isEmpty? 'Enter an email': null,
                              onChanged: (val){
                                setState(() {
                                  email = val ;
                                });

                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(color:Color(0xFFB3B3B3),width: 0.3)),
                                prefixIcon: Icon(Icons.email),
                                iconColor: Colors.white54,
                                hintText: 'email address',
                              ),
                            ),
                        ),

                         Padding(
                          padding: EdgeInsets.fromLTRB(23, 0, 23, 5),
                            child: TextFormField(
                              validator: (value) => value!.length < 6 ? 'Enter a password 6+ charts long': null,
                              obscureText: true,
                              onChanged: (val){
                                setState(() {
                                  password = val ;
                                });
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(40)),
                                    borderSide: BorderSide(color:Color(0xFFB3B3B3),width: 0.3)),
                                prefixIcon: Icon(Icons.lock),
                                iconColor: Colors.white54,
                                hintText: 'password',
                              ),
                            ),

                        ),

                      ],

                    ),
                  ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(170, 0, 0, 10),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                alignment: Alignment.centerRight,
                              ),
                              onPressed: (){},
                              child: const Text('forgot password ?',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),),
                            ),
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
                                onPressed: ()async{
                                  if(_formKey.currentState!.validate()) {
                                    dynamic result = await _auth.signIn(
                                        email, password);
                                    if (result == null) {
                                      setState(() {
                                        error =
                                        'Could not sign in with the credentials';
                                      });
                                    }
                                  }
                                },
                                child: const Text("login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                  ),)
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: SizedBox(
                              width: 297,
                              height: 71,
                              child: ElevatedButton(
                                style:ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40)
                                    )
                                ) ,
                                onPressed: (){},
                                child: Row(
                                  children:  [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
                                      child: Image.asset('assets/icons/google.png' ,
                                        width: 48,
                                        height: 48,),
                                    ),
                                    const Text("login with google",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold
                                      ),)
                                  ],
                                ),

                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: TextButton(
                              onPressed: (){
                                widget.toggleView();
                              },
                              child: const Text('not a member ? sign up',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),),
                            ),
                          ),
                        ],
                      )
                  ]
              ),

              ),
        ],

        ),


      ),
    );
  }
}

