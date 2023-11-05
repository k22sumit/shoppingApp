import 'package:amazonclone/features/account/widget/single_product.dart';
import 'package:flutter/cupertino.dart';

class Orders extends StatelessWidget {



  const Orders({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> list = ["https://unsplash.com/photos/a-black-plate-topped-with-rice-and-mushrooms-uhivFiF34uY"];

    return Container(
      height: 170,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
return SingleProduct(image: "https://images.unsplash.com/photo-1595908129746-57ca1a63dd4d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80");
      }
      ),
    );
  }
}
