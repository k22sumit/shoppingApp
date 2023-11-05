import 'package:amazonclone/constant/global_variables.dart';
import 'package:amazonclone/features/admin/screens/admin_screen.dart';
import 'package:amazonclone/features/auth/screens/auth_screen.dart';
import 'package:amazonclone/provider/user_provider.dart';
import 'package:amazonclone/routes.dart';
import 'package:amazonclone/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/widgets/bottomBarWidget.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    print("Getting user data");
    AuthServices().getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: GlobalVariables.secondaryColor,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (settings) => Routes().generateRoute(settings),
      home: Provider.of<UserProvider>(context).userModel.token!.isEmpty
          ? AuthScreen()
          : Provider.of<UserProvider>(context).userModel.type == "admin"? AdminScreen():BottomBarWidget(),
    );
  }
}
