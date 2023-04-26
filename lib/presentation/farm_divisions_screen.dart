import 'package:flutter/material.dart';
import 'package:qvf_farm/data/services/farm_division_service.dart';

import '../data/model/response_model/farm_division_response_model.dart';

class FarmDivisionScreen extends StatefulWidget {
  const FarmDivisionScreen({super.key});

  @override
  State<FarmDivisionScreen> createState() => _FarmDivisionScreenState();
}

class _FarmDivisionScreenState extends State<FarmDivisionScreen> {
  Future<List<FarmDivision>?> getDivision() async {
    var response = await GetFarmDivisionService.get();
    return response!.farmDivisions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Farm Divisions',
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff0C8900),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          children: [
            FutureBuilder(
                future: getDivision(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.hasError) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  } else {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data![index];
                              return Card(
                                color: Color(0xff0C8900),
                                child: ListTile(
                                  title: Text(
                                    data.name.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    data.description.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
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
