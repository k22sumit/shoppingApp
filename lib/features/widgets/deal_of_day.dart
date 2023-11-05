import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DealofDay extends StatelessWidget {
  const DealofDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
           alignment: Alignment.topLeft,
           padding: EdgeInsets.only(left: 10),
           child:Text("Deal of the day",style: TextStyle(
             fontSize: 15,
           ),
           ),
         ),
          Image.network('https://images.unsplash.com/photo-1694719977532-293c34eed810?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80',fit: BoxFit.fitWidth,height: 200,width: 400,),
Container(
  alignment: Alignment.topLeft,

  child: Text("\$ 100",style: TextStyle(
      fontSize: 18,
  ),),
),
          Container(
            alignment: Alignment.topLeft,

            child: Text("Rivaan"),
          ),
          Row(

            children: [
              Image.network('https://images.unsplash.com/photo-1694719977532-293c34eed810?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80',fit: BoxFit.fitHeight,
              height: 40,
              width: 40,),
              Image.network('https://images.unsplash.com/photo-1694719977532-293c34eed810?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80',fit: BoxFit.fitHeight,
                height: 40,
                width: 40,),
              Image.network('https://images.unsplash.com/photo-1694719977532-293c34eed810?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80',fit: BoxFit.fitHeight,
                height: 40,
                width: 40,),
              Image.network('https://images.unsplash.com/photo-1694719977532-293c34eed810?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80',fit: BoxFit.fitHeight,
                height: 40,
                width: 40,),

            ],
          ),
          Text("See all ",style: TextStyle(
            color: Colors.cyan[800]
          ),)
        ],
      ),
    );
  }
}
