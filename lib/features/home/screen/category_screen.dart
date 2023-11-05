import 'package:amazonclone/features/home/service/home_service.dart';
import 'package:amazonclone/features/product_detail/screen/product_screen.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/loader.dart';
import '../../../constant/global_variables.dart';
import '../../../model/product_model.dart';
import '../../account/widget/single_product.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  static const String id = "categoryScreen";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product>? products = [];
  late var productData = null;
  HomeService homeService = HomeService();

  Future<void> fetchAllproduct(String category) async {
    products = await homeService.fetchAllProducts(context, category);
    if(products!.isEmpty){
      print("empty list");
    }
  }

  @override
  void initState() {
    fetchAllproduct(widget.category);
    super.initState();
  }

  void productDetails(){
    Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: productData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 45, left: 25, right: 40),
                    child: Image.asset("./assets/images/amazon_in.png")),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 5, right: 40),
                  child: Text(
                    widget.category,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Keep shopping in category ${widget.category}",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Expanded(
              child: products == null
                  ? const Loader()
                  : Scaffold(
                      body: GridView.builder(
                        itemCount: products!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                           productData = products![index];
                          return InkWell(
                            onTap: productDetails,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 130,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 0.5,
                                      )
                                    ),
                                    child:Padding(padding: EdgeInsets.all(10),
                                    child: Image.network(productData.images[0]),)
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ))
        ],
      ),
    );
  }
}
