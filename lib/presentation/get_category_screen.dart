import 'package:flutter/material.dart';
import 'package:qvf_farm/core/constants.dart';
import 'package:qvf_farm/data/services/get_produce_service.dart';
import 'package:qvf_farm/presentation/order_screen.dart';
import '../data/model/response_model/produce_category.dart';

class CategoryScreen extends StatefulWidget {
  final String cat;

  const CategoryScreen({super.key, required this.cat});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Future<List<Crop>?> getproduce(String cat) async {
    var response = await GetProduceService.get();
    if (cat == 'Crop') {
      return response!.produceByCategory!.crops;
    } else if (cat == 'Poultry') {
      return response!.produceByCategory!.poultry;
    } else if (cat == 'Fishery') {
      return response!.produceByCategory!.fishery;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryContainerColor,
        title: Text('${widget.cat} Categories'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            FutureBuilder(
                future: getproduce(widget.cat),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError || !snapshot.hasData) {
                    return Center(
                      child: Text('No Data'),
                    );
                  } else {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data![index];
                              String name = data.name.toString();
                              int price = data.price!;
                              int stock = data.stock!;
                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderScreen(
                                              item: data, name: widget.cat)));
                                },
                                title: Text(name),
                                trailing: Text(stock.toString()),
                                subtitle: Text(price.toString()),
                              );
                            }));
                  }
                })
          ],
        ),
      ),
    );
  }
}
