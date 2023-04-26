import 'package:flutter/material.dart';
import 'package:qvf_farm/core/constants.dart';
import 'package:qvf_farm/core/size_config.dart';
import 'package:qvf_farm/data/model/request_model/update_order_request_model.dart';
import 'package:qvf_farm/data/services/delete_order_service.dart';
import 'package:qvf_farm/data/services/update_order_service.dart';
import 'package:qvf_farm/presentation/snackbar.dart';
import 'package:qvf_farm/presentation/utils.dart';
import '../core/loading_widget.dart';
import '../data/model/request_model/create_order_request_model.dart';
import '../data/model/response_model/produce_category.dart';
import '../data/services/create_order_service.dart';

class OrderScreen extends StatefulWidget {
  final Crop item;
  final String name;

  const OrderScreen({super.key, required this.item, required this.name});
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int inittial = 0;
  bool isCompleted = false;
  String orderId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryContainerColor,
        title: isCompleted ? Text('Your Order') : Text(widget.name),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            buildDetails(key: 'Name', value: widget.item.name.toString()),
            buildDetails(
                key: 'Category', value: widget.item.category.toString()),
            buildDetails(
                key: 'Unit Price',
                value: convertBalance(widget.item.price.toString())),
            buildDetails(
                key: 'Available Quantity', value: widget.item.stock.toString()),
            SizedBox(
              height: 100,
            ),
            buildDetails(key: 'Total price', value: totalAmount()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      remove();
                    },
                    icon: Icon(Icons.remove)),
                Text(inittial.toString()),
                IconButton(
                    onPressed: () {
                      add();
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            isCompleted
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Palette.primaryContainerColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              updateOrder(orderId);
                            },
                            child: Text('Update Order')),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Palette.primaryContainerColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              deleteOrder(orderId);
                            },
                            child: Text('Delete Order'))
                      ],
                    ),
                  )
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.primaryContainerColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      createOrder();
                    },
                    child: Text('Create Order'))
          ],
        ),
      ),
    );
  }

  void remove() {
    if (inittial > 0) {
      setState(() {
        inittial--;
      });
    } else {}
  }

  void add() {
    if (inittial >= 0 && inittial < widget.item.stock!) {
      setState(() {
        inittial++;
      });
    }
  }

  String totalAmount() {
    int total = inittial * widget.item.price!;
    double newT = double.parse(total.toString());
    return convertBalance(newT.toString());
  }

  Container buildDetails({
    required String key,
    required String value,
  }) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Palette.primaryTextColor3),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(key), Text(value)],
      ),
    );
  }

  void deleteOrder(String id) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            ProgressDialog(message: 'Loading...'));
    var response = await DeleteOrderService.get(id);
    if (response!.message == 'Order deleted succesfully') {
      Navigator.pop(context);
      showSnackBar(context, Colors.green, response.message);
      Navigator.pop(context);
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      showSnackBar(context, Colors.red, response.message);
    }
  }

  void updateOrder(String id) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            ProgressDialog(message: 'Loading...'));

            UpdateOrderRequestModel request = UpdateOrderRequestModel(
          name: widget.item.name,
          category: widget.item.category,
          price: widget.item.price,
          quantity: inittial);

    var response = await UpdateOrderService.get(id, request);
    if (response!.message == 'Order updated successfully') {
      Navigator.pop(context);
      showSnackBar(context, Colors.green, response.message);
      Navigator.pop(context);
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      showSnackBar(context, Colors.red, response.message);
    }
  }

  void createOrder() async {
    if (inittial.toString() == '0') {
      showSnackBar(context, Colors.red, 'Quantity is 0');
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              ProgressDialog(message: 'Loading...'));

      CreateOrderRequestModel request = CreateOrderRequestModel(
          name: widget.item.name,
          category: widget.item.category,
          price: widget.item.price,
          quantity: inittial);
      var response = await CreateOrderService.create(request);
      Navigator.pop(context);
      if (response!.message == 'Order created successfully') {
        showSnackBar(context, Colors.green, response.message);
        setState(() {
          isCompleted = true;
          orderId = response.newOrder!.id.toString();
          print(orderId);
        });
      } else {
        Navigator.pop(context);
        showSnackBar(context, Colors.red, response.message);
      }
    }
  }
}
