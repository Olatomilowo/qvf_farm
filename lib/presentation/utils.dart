import 'package:intl/intl.dart';

String convertBalance(String balance) {
  double cardBalance = double.parse(balance);
  String _newBalance =  NumberFormat.currency(symbol: '₦').format(cardBalance)
                  ;
 
  return _newBalance;
}