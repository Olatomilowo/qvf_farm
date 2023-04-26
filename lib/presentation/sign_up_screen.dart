import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/loading_widget.dart';
import '../core/size_config.dart';
import '../core/widgets/custom_input_widget.dart';
import '../data/model/request_model/sign_up_request_model.dart';
import '../data/services/sign_up_service.dart';
import '../validator.dart';
import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.primaryColor2,
      body: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(24),
            top: getProportionateScreenHeight(50),
            right: getProportionateScreenWidth(24)),
        child: SingleChildScrollView(
          child: Form(
            key: _signUpKey,
            child: Column(
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                      color: Palette.primaryTextColor1,
                      fontStyle: FontStyle.normal,
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                CustomInputField(
                  keyboard: TextInputType.name,
                  inputController: _firstNameController,
                  hintText: 'First Name',
                  validator: (value) =>
                      value!.isEmpty ? 'field required' : null,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                CustomInputField(
                  keyboard: TextInputType.name,
                  inputController: _lastNameController,
                  hintText: 'Last Name',
                  validator: (value) =>
                      value!.isEmpty ? 'field required' : null,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                CustomInputField(
                  keyboard: TextInputType.emailAddress,
                  inputController: _emailController,
                  hintText: 'E-mail',
                  validator: (value) => Validator.validateEmail(value ?? ''),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                CustomInputField(
                  keyboard: TextInputType.number,
                  inputController: _phoneNumberController,
                  hintText: 'Phone Number',
                  validator: (value) =>
                      Validator.validatePhoneNumber(value ?? ''),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                TextFormField(
                  obscureText: isVisible,
                  controller: _passwordController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: isVisible
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      ),
                      fillColor: Palette.primaryTextColor3,
                      filled: true,
                      hintText: 'Password',
                      contentPadding: EdgeInsets.only(
                          left: getProportionateScreenWidth(14),
                          right: getProportionateScreenWidth(14)),
                      focusColor: Palette.primaryTextColor4,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none)),
                  validator: (value) => Validator.validatePassword(value ?? ''),
                ),
                SizedBox(height: getProportionateScreenHeight(70)),
                SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(60),
                  child: ElevatedButton(
                    onPressed: () {
                      createAccount();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => LogInScreen())));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Palette.primaryTextColor6,
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.primaryContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Palette.primaryTextColor5,
                        fontSize: getProportionateScreenWidth(14),
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LogInScreen())));
                      },
                      child: Text(
                        'LogIn',
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Palette.primaryContainerColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void createAccount() async {
    var isValid = _signUpKey.currentState?.validate();
    if (!isValid!) return;
    // print('im am here');
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            ProgressDialog(message: 'Loading...'));

    print('waiting for endpoint');

    SignUpRequestModel registerUser1 = SignUpRequestModel(
        firstname: _firstNameController.text,
        lastname: _lastNameController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumberController.text,
        password: _passwordController.text);

    var response = await SignUpService.register(registerUser1);
    if (response!.message == 'User Created Successfully') {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LogInScreen()));
    } else {
      Navigator.pop(context);
      print(response.message);
    }
  }
}
