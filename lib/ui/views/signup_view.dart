import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_app/ui/widgets/busy_button.dart';
import 'package:green_app/ui/widgets/input_field.dart';
import 'package:green_app/ui/widgets/expansion_list.dart';
import 'package:stacked/stacked.dart';
import '../../constants.dart';
import '../../viewmodles/signup_view_model.dart';


class SignUpView extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, model, child) =>
            Scaffold(
              body: Container(
                color: Color(0xFF64A195),
                child: Column(
                    children: [Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50))
                          ),
                          child: SingleChildScrollView(
                            child: Form(

                              child: Column(
                                children: [

                                  Padding(

                                    padding: EdgeInsets.fromLTRB(
                                        23, 30, 23, 16),

                                    child: InputField(
                                      placeholder: 'Full Name',
                                      controller: fullNameController,
                                    ),

                                  ),

                                     Padding(

                                      padding: EdgeInsets.fromLTRB(
                                          23, 0, 23, 16),

                                      child: InputField(
                                        placeholder: 'Email',
                                        controller: emailController,
                                      ),

                                    ),


                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          23, 0, 23, 16),

                                      child: InputField(
                                        placeholder: 'password',
                                        controller: passwordController,
                                        password: true,
                                      )

                                  ),

                                   Padding(
                                    padding: EdgeInsets.fromLTRB(23, 0, 23, 45),
                                      child: ExpansionList<String>(
                                        items: ['Company', 'Personal'],
                                        title: model.selectedRole,
                                          onItemSelected: (item) => model.setSelectedRole(item),
                                      ),


                                  ),


                                  SizedBox(
                                    width: 297,
                                    height: 71,
                                    child: BusyButton(title: 'Sign Up',
                                      busy: model.busy,
                                      onPressed: () {
                                        model.signUp(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          fullName: fullNameController.text
                                        );
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10, 0, 16),
                                    child: SizedBox(
                                      width: 297,
                                      height: 71,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(40)
                                            )
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 5, 0),
                                              child: Image.asset(
                                                'assets/icons/google.png',
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
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 0, 10),
                                    child: TextButton(
                                      onPressed: () {
                                        //model.navigateToLogin();
                                      },
                                      child: const Text(
                                        'already have an account ? login ',
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
                          ))
                    ]
                ),
              ),
            )
    );
  }
}
