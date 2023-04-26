import 'package:flutter/material.dart';
import 'package:qvf_farm/core/size_config.dart';

class ProgressDialog extends StatelessWidget {
  final String message;
  ProgressDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(35),
            vertical: getProportionateScreenHeight(20)),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            CircularProgressIndicator(
              strokeWidth: getProportionateScreenWidth(3),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(
              width: getProportionateScreenWidth(40),
            ),
            Text(
              message,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
