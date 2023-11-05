import 'package:amazonclone/common/widgets/loader.dart';
import 'package:amazonclone/features/search/service/search_service.dart';
import 'package:amazonclone/features/search/widget/searched_product.dart';
import 'package:amazonclone/features/widgets/address_bar.dart';
import 'package:flutter/material.dart';

import '../../../constant/global_variables.dart';
import '../../../model/product_model.dart';

class SearchScreen extends StatefulWidget {
  final String query;

  static const String id = "searchScreen";

  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchService searchService = SearchService();
  List<Product>? products = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchSearchProduct(context, widget.query);
  }

  Future<void> fetchSearchProduct(BuildContext context, String query) async {
    products = await searchService.fetchSearchedProduct(context, query);
  }

  void navigateTo() {
    Navigator.pushReplacementNamed(context, SearchScreen.id, arguments: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: navigateTo,
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 1,
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          hintText: 'Search Amazon.in',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(Icons.mic, color: Colors.black, size: 25),
                ),
              ],
            ),
          ),
        ),
        body: products == null
            ? const Loader()
            : Column(
                children: [
                  const AddressBar(),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: products?.length,
                        itemBuilder: (context, index) {
                          return SearchedProduct(product: products![index]);
                        }),
                  )
                ],
              ),
      ),
    );
  }
}
