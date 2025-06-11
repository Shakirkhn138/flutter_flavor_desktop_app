import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_desktop_app/state/signup_bloc/signup_bloc.dart';

import '../config/app_colors.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Scaffold(
            body: Row(
              children: [
                Image.asset('assets/images/side.png', fit: BoxFit.fitHeight),

                Padding(
                  padding: const EdgeInsets.only(left: 270.0),
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.69,
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
                            'Create an account',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          _buildTextField(
                            context,
                            _nameController,
                            'Name',
                            'Enter your name',
                          ),
                          SizedBox(height: 10),
                          _buildTextField(
                            context,
                            _emailController,
                            'Email',
                            'Enter your email',
                          ),
                          SizedBox(height: 10),
                          _buildTextField(
                            context,
                            _passwordController,
                            'Password',
                            'Create a password',
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 100.0, top: 5),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Must be at least 8 characters',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),

                          SizedBox(height: 20),
                          _buildSignUp(context),
                          SizedBox(height: 20),
                          _buildGoogleSignUp(context),
                          SizedBox(height: 10),
                          _buildHaveAccount(context),
                        ],
                      ),
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
              context.read<SignUpBloc>().add(NameChangedEvent(value)),
        ),
      ),
    ],
  );
}

Widget _buildSignUp(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      context.read<SignUpBloc>().add(SubmitButtonEvent());
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.blueColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(390, 44),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    child: Text('Get started'),
  );
}

Widget _buildGoogleSignUp(BuildContext context) {
  return SizedBox(
    width: 385,
    child: ElevatedButton(
      onPressed: () {
        context.read<SignUpBloc>().add(GoogleSignUpEvent());
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/google_icon.png', height: 17),
          SizedBox(width: 10),
          Text('Sign in with Google'),
        ],
      ),
    ),
  );
}

Widget _buildHaveAccount(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Already have an account?',
        style: TextStyle(color: AppColors.darkGreyColor),
      ),
      TextButton(
        onPressed: () {
          // Navigator.of(context).pushNamed('/');
          Navigator.of(context).pop();
        },
        child: Text('Log in', style: TextStyle(color: Colors.blue)),
      ),
    ],
  );
}
