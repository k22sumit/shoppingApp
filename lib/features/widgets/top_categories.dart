import 'package:amazonclone/constant/global_variables.dart';
import 'package:amazonclone/features/home/screen/category_screen.dart';
import 'package:flutter/cupertino.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  void navigate(BuildContext context, String category){
    Navigator.pushNamed(context, CategoryScreen.id, arguments: category);

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        itemExtent: 75,
          itemCount: GlobalVariables.categoryImages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigate(context, GlobalVariables.categoryImages[index]['title']!),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        GlobalVariables.categoryImages[index]['image']!,
                        width: 40,
                        height: 40,),
                    ),
                  ),
                  Text(GlobalVariables.categoryImages[index]['title']!)
                ],
              ),
            );
          }),
    );
  }
}
