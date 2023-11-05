import 'package:amazonclone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/global_variables.dart';
import 'package:flutter/material.dart';

import '../../features/account/screen/account_screen.dart';
import '../../features/cart/screen/cart_screen.dart';
import '../../features/home/screen/userHome_screen.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key});

  static const String id = "bottomBarWidget";

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _page = 0;
List<Widget> screens = [
  HomeScreen(),
  AccountScreen(),
  CartScreen(),

];
  @override
  Widget build(BuildContext context) {
    double bottomBarWidth = 42;
    double bottomBarBorderWidth = 2;
final cartLength = Provider.of<UserProvider>(context,listen: false).userModel.cart?.length;
    return Scaffold(
      body: screens[_page],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        currentIndex: _page,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: (val) {
          setState(() {
            _page = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              child: Icon(Icons.home_outlined),
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
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
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: Icon(Icons.account_box),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),

              child: Badge(
                label: Text(cartLength.toString()),
                backgroundColor: Colors.red,
                child: Icon(Icons.add_shopping_cart_outlined),
              ),
              )
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 3
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.unselectedNavBarColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: Icon(Icons.account_balance_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
