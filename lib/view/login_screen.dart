import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_desktop_app/state/signup_bloc/signup_bloc.dart' hide EmailChangedEvent, PasswordChangedEvent;

import '../config/app_colors.dart';
import '../state/login_bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Row(
              children: [
                Image.asset('assets/images/side.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 270.0,),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.68,
                    width: MediaQuery.of(context).size.width * 0.38,
                    // width: 501,
                    decoration: BoxDecoration(
                      color: AppColors.mutedMauve,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Log-in',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _buildTextField(context, _emailController, 'Email', 'Enter you email', EmailChangedEvent),
                        SizedBox(height: 10),
                        _buildTextField(context, _passwordController, 'Password', 'Enter your password', PasswordChangedEvent),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 400,
                          child: Row(
                            children: [
                              Checkbox(
                                value: state.isRemembered,
                                onChanged: (bool? newValue) {
                                  context.read<LoginBloc>().add(
                                    ToggleRememberMeEvent(),
                                  );
                                },

                                fillColor:
                                    MaterialStateProperty.resolveWith<
                                      Color
                                    >((Set<MaterialState> states) {
                                      if (states.contains(
                                        MaterialState.selected,
                                      )) {
                                        return Colors
                                            .black; // fill color when checked
                                      }
                                      return Colors
                                          .white; // fill color when unchecked
                                    }),
                              ),
                              Text('Remember for 30 days'),
                              Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildSignIn(context),
                        SizedBox(height: 20),
                        _buildGoogleSignIn(context),
                        SizedBox(height: 10),
                        _buildAccount(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


Widget _buildTextField(
    BuildContext context,
    controller,
    String title,
    String text,
    event,
    ) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('$title*', style: TextStyle(fontSize: 14)),
      SizedBox(height: 5),
      ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 380,
          minWidth: 300,
          maxHeight: 37,
          minHeight: 30,
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hint: Text(text),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (value) =>
              context.read<LoginBloc>().add(event(value)),
        ),
      ),
    ],
  );
}

Widget _buildSignIn (BuildContext context){
  return  ElevatedButton(
    onPressed: () {
      context.read<LoginBloc>().add(
        SubmitLoginEvent(),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.chocolateColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(390, 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    child: Text('Sign in'),
  );
}

Widget _buildGoogleSignIn (BuildContext context){
  return SizedBox(
    width: 385,
    child: ElevatedButton(
      onPressed: () {
        context.read<LoginBloc>().add(
          GoogleLoginEvent(),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/google_icon.png',
            height: 17,
          ),
          SizedBox(width: 10),
          Text('Sign in with Google'),
        ],
      ),
    ),
  );
}

Widget _buildAccount (BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Don\'t have an account?',
        style: TextStyle(
          color: AppColors.darkGreyColor,
        ),
      ),
      TextButton(
        onPressed: () => Navigator.pushNamed(context, 'signup'),
        child: Text(
          'Sign up',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    ],
  );
}