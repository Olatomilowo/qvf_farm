import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/size_config.dart';
import 'get_category_screen.dart';

class AllFarmProduceCategories extends StatefulWidget {
  const AllFarmProduceCategories({super.key});

  @override
  State<AllFarmProduceCategories> createState() =>
      _AllFarmProduceCategoriesState();
}

class _AllFarmProduceCategoriesState extends State<AllFarmProduceCategories> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      // backgroundColor: Palette.primaryContainerColor,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'ALL FARM PRODUCE',
                  style: TextStyle(
                    color: Palette.iconColor1,
                    // fontFamily: FontFamily.gilroyBold,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Text(
                'Categories',
                style: TextStyle(
                  color: Palette.iconColor1,
                  // fontFamily: FontFamily.gilroyBold,
                  fontWeight: FontWeight.w500,
                  fontSize: getProportionateScreenWidth(15),
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              buildContainer(
                  text: 'Crop',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  cat: 'Crop',
                                )));
                  },
                  color: Colors.green),
              buildContainer(
                  text: 'Poultry',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  cat: 'Poultry',
                                )));
                  },
                  color: Colors.green),
              buildContainer(
                  text: 'Fishery',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  cat: 'Fishery',
                                )));
                  },
                  color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
  

  Expanded buildContainer(
      {required void Function()? onTap,
      required Color color,
      required String text}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
          width: double.infinity,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
