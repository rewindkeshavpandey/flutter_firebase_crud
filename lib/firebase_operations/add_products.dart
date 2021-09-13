import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbase/main.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Add extends StatelessWidget {



final CollectionReference products=FirebaseFirestore.instance.collection('products');
var globalKey=GlobalKey<FormState>();
TextEditingController nc= TextEditingController();
TextEditingController pprice= TextEditingController();
TextEditingController pQuantity= TextEditingController();

void adddata() async{
  await products.add({
    "pid":12345,
    "pname":nc.text.trim(),
    "pprice":pprice.text.trim(),
    "pquantity":pQuantity.text.trim(),

    }).whenComplete(() => displayMessage('New Data Added Successfully'));
}





  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Data"),
        ),
        backgroundColor: Colors.grey.shade100,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                // autovalidate: _autoValidate,
                key: globalKey,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
           Text("Add Data"),
           SizedBox(height: 20,),


                       TextFormField(
                        controller: nc,
                        decoration: InputDecoration(
                          labelText: 'Enter product name',
                            border: OutlineInputBorder(),
                            hintText: 'Product Name',
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.production_quantity_limits)),
                        validator: (value) => value!.isEmpty ? 'Required' : null,
                      ),


                      TextFormField(
                        controller: pprice,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Price',
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.monetization_on_rounded)),
                        validator: (value) => value!.isEmpty ? 'Required' : null,
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        controller: pQuantity,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Quantity',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.confirmation_number)),
                          validator: (value) => value!.isEmpty ? 'Required' : null,
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(height: 7),
                      
                      ElevatedButton(onPressed: (){
                        adddata();

                      }, child: Text("Add Prodcuts"),)
                      

                     
                    ],
                  ),
                )),
              ),
            ),
          ),
        ),
      ),
    );
      
    
  }
}