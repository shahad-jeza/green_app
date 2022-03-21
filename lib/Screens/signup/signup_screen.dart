import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_app/Screens/Welcome/components/body.dart';

import '../../authentication.dart';
import '../../constants.dart';
import '../Login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  String _selectedRole = 'selecet a user role' ;
  String get selectedRole => _selectedRole ;
  void setSelectedRole(String role){
    _selectedRole = role ;
  }

  final Function toggleView ;
   SignUpScreen({required this.toggleView});


  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Authentication _auth = Authentication();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;


  String email='';
  String password = '' ;
  String name = '' ;
  String error = '' ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        color: Color(0xFF64A195),
        child: Column(
            children: [Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
                  child: Text("nice to meet you ! ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal
                    ),),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 30),
                  child: Text("create a new account",
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
                  height: 669,
                  width: double.infinity,
                  decoration:  const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children:  [
                          Padding(
                            padding: EdgeInsets.fromLTRB(23, 30, 23, 16),

                              child: TextFormField(
                                validator: (val)=> val!.isEmpty ? 'Enter an email' : null ,
                              onChanged: (val) {
                                setState(() {
                                  email = val;
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
                            padding: EdgeInsets.fromLTRB(23, 0, 23, 16),

                              child: TextFormField(
                                validator: (val)=> val!.isEmpty ? 'enter user name' : null ,
                                onChanged: (val) {
                                  setState(() {
                                    name = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(40)),
                                      borderSide: BorderSide(color:Color(0xFFB3B3B3),width: 0.3)),
                                  prefixIcon: Icon(Icons.person),
                                  iconColor: Colors.white54,
                                  hintText: 'User Name',
                                ),
                              ),

                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(23, 0, 23, 16),

                              child: TextFormField(
                                validator: (value) => value!.length < 6 ? 'Enter a password 6+ charts long': null,
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() {
                                    password = val;
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

                          const Padding(
                            padding: EdgeInsets.fromLTRB(23, 0, 23, 45),

                              child: ExpansionTile(
                                title: Text("type of account"  ,
                                  style: TextStyle(
                                      fontSize: 18,
                                    color: Colors.black54
                                  ),),

                                children: [
                                  ListTile(
                                    title: Text("personal"),
                                  ),
                                  ListTile(
                                    title: Text("company"),
                                  )
                                ],

                              )

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
                                  if(_formKey.currentState!.validate()){
                                    setState(()=> loading = true);
                                    dynamic result = await _auth.signUp(email, password);
                                    if(result == null){
                                      setState(() {
                                        error = 'please try a valid email' ;
                                        loading = false ;
                                      });
                                    }
                                  }
                                },
                                child: const Text("sign up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                  ),)
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 16),
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
                                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Image.asset('assets/icons/google.png' ,
                                        width: 48,
                                        height: 48,),
                                    ),
                                    const Text("sign up with google",
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
                              child: const Text('already have an account ? login ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),),
                            ),
                          ),
                        ],

                      ),
                    ),
                  ))]
        ),
      ),
    );
  }
}
