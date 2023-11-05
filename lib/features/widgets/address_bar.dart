import 'package:amazonclone/model/user_model.dart';
import 'package:amazonclone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({super.key});

  @override
  Widget build(BuildContext context) {

    var user = Provider.of<UserProvider>(context,listen: false).userModel;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 162, 236, 233),
        ]),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.pin_drop),
          ),
          Expanded(
            child: Text(
              "Delivery to : ${user.name} Adda Teela Gandhi Nagar Etawah",
              style: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, left: 5),
            child: Icon(Icons.arrow_drop_down_outlined),
          )
        ],
      ),
    );
  }
}
