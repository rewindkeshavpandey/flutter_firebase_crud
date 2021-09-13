import 'package:fbase/firebase_operations/add_products.dart';
import 'package:fbase/firebase_operations/home.dart';
import 'package:fbase/firebase_operations/update.dart';
import 'package:flutter/material.dart';

class Crud extends StatelessWidget {
  const Crud({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
           crossAxisSpacing: 10, 
           mainAxisSpacing: 10,), 
           children: [
             InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>Add()));

               },
               child: Container(width: 200, height: 200, color: Colors.deepPurple,
               child: Center(child: Text("Add Product", style: TextStyle(color: Colors.white, fontSize: 20),)),
               
               ),
             ),    




              InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>Home()));

               },
               child: Container(width: 200, height: 200, color: Colors.deepPurple,
               child: Center(child: Text("View Product", style: TextStyle(color: Colors.white, fontSize: 20),)),
               
               ),
             ),    



              InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>UpdatePage()));

               },
               child: Container(width: 200, height: 200, color: Colors.deepPurple,
               child: Center(child: Text("Update Product", style: TextStyle(color: Colors.white, fontSize: 20),)),
               
               ),
             ),    



              InkWell(
               onTap: (){

               },
               child: Container(width: 200, height: 200, color: Colors.deepPurple,
               child: Center(child: Text("Delete Product", style: TextStyle(color: Colors.white, fontSize: 20),)),
               
               ),
             ),    












           ],
        
        
        ),
      
    );
  }
}