import 'package:amazonclone/constant/global_variables.dart';
import 'package:amazonclone/features/account/widget/account_button.dart';
import 'package:amazonclone/features/account/widget/below_app_bar.dart';
import 'package:amazonclone/features/account/widget/orders.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                   padding: EdgeInsets.only(top: 40,left: 5,right: 40),
                    child: Image.asset("./assets/images/amazon_in.png")),
                Container(
                  padding: EdgeInsets.only(top:40,right: 20),
                  child: Row(
                    children: [
                      Icon(Icons.notification_add_outlined),
                      SizedBox(width: 10,),
                      Icon(Icons.search_outlined)
                    ],
                  ),
                )
              ],
            ),
          ),
          
        ),

      ),
      body: Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  AccountButton(onTap: (){}, text: "Your Order"),

                  AccountButton(onTap: (){}, text: "Your account")
                ],
              ),
              Column(
                children: [
                  AccountButton(onTap: (){}, text: "Turn Seller"),
                  AccountButton(onTap: (){}, text: "Your Wish list")
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Order",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                Text("See all",style: TextStyle(color: Colors.blue,fontSize: 20),)
              ],
            ),
          ),
    Orders(),
        ],
      ),
    );
  }
}
