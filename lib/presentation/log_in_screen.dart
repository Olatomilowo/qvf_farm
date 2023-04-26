import 'package:flutter/material.dart';
import 'package:qvf_farm/presentation/sign_up_screen.dart';
import 'package:qvf_farm/presentation/snackbar.dart';
import 'package:qvf_farm/presentation/welcome_screen.dart';
import '../core/constants.dart';
import '../core/loading_widget.dart';
import '../core/size_config.dart';
import '../core/widgets/custom_input_widget.dart';
import '../data/data_storage/token_local_storage.dart';
import '../data/model/request_model/log_in_request_model.dart';
import '../data/services/log_in_service.dart';
import '../validator.dart';
import 'all_farm_produce_categories_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _logInKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
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
        child: Form(
          key: _logInKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Log In',
                  style: TextStyle(
                      color: Palette.primaryTextColor1,
                      fontStyle: FontStyle.normal,
                      fontSize: getProportionateScreenWidth(30),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                CustomInputField(
                    keyboard: TextInputType.emailAddress,
                    inputController: _emailController,
                    hintText: 'E-mail',
                    validator: (value) => Validator.validateEmail(value ?? '')),
                SizedBox(height: getProportionateScreenHeight(30)),
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
                SizedBox(height: getProportionateScreenHeight(210)),
                SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(52),
                  child: ElevatedButton(
                    onPressed: () {
                      logInUser();
                    },
                    child: Text(
                      'Log In',
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
                SizedBox(height: getProportionateScreenHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
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
                                builder: ((context) => SignUpScreen())));
                      },
                      child: Text(
                        'SignUp',
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

  void logInUser() async {
    if (_logInKey.currentState?.validate() ?? false) {
      _logInKey.currentState?.save();
      LogInRequestModel logInUser = LogInRequestModel(
          email: _emailController.text, password: _passwordController.text);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              ProgressDialog(message: 'Loading...'));
      var response = await LogInService.logIn(logInUser);
      if (response!.message == 'Login Successful') {
        Navigator.pop(context);

        await TokenStorage.storeToken(response.token.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
      } else {
        Navigator.pop(context);
        showSnackBar(context, Colors.brown, response.message);
        print(response.message);
      }
    }
  }
}
