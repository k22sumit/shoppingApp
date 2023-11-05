import 'package:amazonclone/features/admin/screens/add_product_screen.dart';
import 'package:amazonclone/features/admin/screens/post_screen.dart';
import 'package:flutter/material.dart';

import '../../../constant/global_variables.dart';
import '../../home/screen/userHome_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    double bottomBarWidth = 42;
    double bottomBarBorderWidth = 2;

    List<Widget> screens = [
     PostScreen(),
     AddProductScreen(),
      Center(
        child: Text("Cart"),
      ),
      //CartScreen(),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 40, left: 5, right: 40),
                    child: Image.asset("./assets/images/amazon_in.png")),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 5, right: 40),
                  child: Text(
                    "Admin",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        currentIndex: page,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: (val) {
          setState(() {
            page = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              child: Icon(Icons.post_add_outlined),
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: Icon(Icons.analytics_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: Icon(Icons.all_inbox_outlined),
            ),
          ),
        ],
      ),
      body: screens[page],
    );
  }
}
