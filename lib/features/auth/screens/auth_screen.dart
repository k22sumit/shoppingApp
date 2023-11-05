import 'package:amazonclone/common/widgets/custom_button.dart';
import 'package:amazonclone/common/widgets/custom_textfield.dart';
import 'package:amazonclone/constant/global_variables.dart';
import 'package:amazonclone/services/auth_services.dart';
import 'package:flutter/material.dart';

enum Auth { signUp, signIn }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const String id = "authScreen";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

    final _signUpFormKey = GlobalKey<FormState>();
    final _signInFormKey = GlobalKey<FormState>();
    final TextEditingController _nameTextController = TextEditingController();
    final TextEditingController _emailTextController = TextEditingController();
    final TextEditingController _passwordTextController =
    TextEditingController();
    AuthServices authServices = AuthServices();

    Auth? _auth = Auth.signUp;

  @override
  void dispose() {
    super.dispose();
    _passwordTextController.dispose();
    _emailTextController.dispose();
    _nameTextController.dispose();
  }

    void _signUp() {
      authServices.signUp(
          email: _emailTextController.text,
          name: _nameTextController.text,
          password: _passwordTextController.text,
          context: context);
    }

    void _signIn() {
    print("In sign function");
      authServices.signIn(
          email: _emailTextController.text,
          password: _passwordTextController.text,
          context:context);
    }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signUp
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameTextController,
                          hint: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _emailTextController,
                          hint: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordTextController,
                          hint: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign Up',
                          onPress: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              _signUp();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signIn
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  'Sign-In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signIn)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailTextController,
                          hint: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordTextController,
                          hint: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign In',
                          onPress: () {
                            if (_signInFormKey.currentState!.validate()) {
                              _signIn();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}