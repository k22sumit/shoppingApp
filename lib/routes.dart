import 'package:amazonclone/features/admin/screens/add_product_screen.dart';
import 'package:amazonclone/features/home/screen/category_screen.dart';
import 'package:amazonclone/features/home/screen/userHome_screen.dart';
import 'package:amazonclone/features/product_detail/screen/product_screen.dart';
import 'package:amazonclone/features/search/screen/search_screen.dart';
import 'package:amazonclone/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'common/widgets/bottomBarWidget.dart';
import 'features/auth/screens/auth_screen.dart';

class Routes {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AuthScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (context) => AuthScreen());

      case HomeScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (context) => HomeScreen());
      case BottomBarWidget.id:
        return MaterialPageRoute(
            settings: settings, builder: (context) => BottomBarWidget());
      case AddProductScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (context) => AddProductScreen());
      case CategoryScreen.id:
       var category = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings, builder: (context) => CategoryScreen(category: category));
      case SearchScreen.id:
        var query = settings.arguments as String;
        return MaterialPageRoute(
            settings: settings, builder: (context) => SearchScreen(query: query,));
      case ProductDetailScreen.routeName:
        var product = settings.arguments as Product;
        return MaterialPageRoute(
            settings: settings, builder: (context) => ProductDetailScreen(product: product,));


      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text("Page Not Found")),
                ));
    }
  }
}
