import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_app/ui/widgets/input_field.dart';
import 'package:green_app/ui/widgets/text_link.dart';
import 'package:stacked/stacked.dart';


import '../../constants.dart';
import '../../viewmodles/login_view_model.dart';
import '../widgets/busy_button.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
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

                      child: Column(
                        children:  [
                          Padding(
                            padding: EdgeInsets.fromLTRB(23, 40, 23, 16),
                            child: InputField(
                              placeholder: 'email',
                              controller : emailController,
                            )
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(23, 0, 23, 5),
                            child: InputField(
                              placeholder: 'password',
                              controller: passwordController,
                              password: true,
                            )

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
                          child:BusyButton(
                            title: 'Login',
                            busy: model.busy,
                            onPressed: () {
                              model.login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            },
                          )
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
                          child: TextLink(
                            'not a member ? sign up',
                            onPressed: (){
                              //model.navigateToSignup();
                            },
                          )
                        ),
                      ],
                    )
                  ]
              ),

            ),
          ],

        ),


      )),
    );

  }
}

