import 'package:flutter/material.dart';
import 'package:qvf_farm/core/loading_widget.dart';
import 'package:qvf_farm/core/size_config.dart';
import 'package:qvf_farm/data/data_storage/token_local_storage.dart';
import 'package:qvf_farm/data/services/log_out_service.dart';
import 'package:qvf_farm/presentation/all_farm_produce_categories_screen.dart';
import 'package:qvf_farm/presentation/farm_divisions_screen.dart';
import 'package:qvf_farm/presentation/snackbar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: getProportionateScreenHeight(350),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xff0C8900),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Center(
              child: Text(
                'Welcome',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(170),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(15),
                right: getProportionateScreenWidth(15)),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                AllFarmProduceCategories())));
                  },
                  child: Container(
                    height: getProportionateScreenHeight(60),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xff2BC20E),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'All Farm Produce Category',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => FarmDivisionScreen())));
                  },
                  child: Container(
                    height: getProportionateScreenHeight(60),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xff2BC20E),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'All Farm Divisions',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0C8900),
        onPressed: () {
          logOutUser();
        },
        child: Icon(Icons.logout),
      ),
    );
  }

  void logOutUser() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            ProgressDialog(message: 'Loading...'));
    var response = await LogOutService.get();
    if (response!.message == 'Logout Successful') {
      await TokenStorage.clearToken();
      Navigator.pop(context);
      showSnackBar(context, Colors.green, response.message);
      Navigator.pop(context);
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      showSnackBar(context, Colors.red, response.message);
    }
  }
}
