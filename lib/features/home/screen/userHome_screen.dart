import 'dart:convert';

import 'package:amazonclone/constant/global_variables.dart';
import 'package:amazonclone/features/search/screen/search_screen.dart';
import 'package:amazonclone/features/widgets/address_bar.dart';
import 'package:amazonclone/features/widgets/carousel_list.dart';
import 'package:amazonclone/features/widgets/deal_of_day.dart';
import 'package:amazonclone/features/widgets/top_categories.dart';
import 'package:amazonclone/provider/user_provider.dart';
import 'package:amazonclone/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/bottomBarWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  static const String id = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();

  void navigateTo(String str) {
    Navigator.pushNamed(context, SearchScreen.id, arguments: str);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false).userModel;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 100),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                          ),
                          onTap: () => navigateTo(_searchController.text),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search Amazon.in",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.mic_none_outlined,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AddressBar(),
              SizedBox(
                height: 10,
              ),
              TopCategories(),
              SizedBox(
                height: 10,
              ),
              CarouselWidget(),
              DealofDay()
            ],
          ),
        ),
      ),
    );
  }
}
