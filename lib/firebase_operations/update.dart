import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fbase/main.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
 TextEditingController nc= TextEditingController();
TextEditingController pprice= TextEditingController();
TextEditingController pQuantity= TextEditingController();
var globalKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Page"),
        backgroundColor: Colors.amber,
      ),

      body: StreamBuilder(
        
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
           
           if(!snapshot.hasData){
             return Center(child: Text('No Data Exist'));
           }

           if(snapshot.connectionState==ConnectionState.waiting){
             return Center(child: CircularProgressIndicator());
           }


          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index){
              final data=snapshot.data!.docs[index];
              return InkWell(
                onTap: (){
                 displayMessage('${data.id}');
                 FirebaseFirestore.instance.collection('products').doc(data.id).update({
                   'pname':nc.text,
                   'pprice':pprice.text,
                   'pquantity':pQuantity.text,

                 });

                showDialog(context: context, builder: (_){
                  return Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Form(
                // autovalidate: _autoValidate,
                key: globalKey,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
        
           SizedBox(height: 20,),


                       TextFormField(
                        controller: nc,
                        decoration: InputDecoration(
                          labelText: data['pname'],
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
                          labelText: data['pprice'],
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
                              labelText: data['pquantity'],
                              hintText: 'Quantity',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.confirmation_number)),
                          validator: (value) => value!.isEmpty ? 'Required' : null,
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(height: 7),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        
                        children: [
                          ElevatedButton(onPressed: (){
                             FirebaseFirestore.instance.collection('products').doc(data.id).update({
                   'pname':nc.text,
                   'pprice':pprice.text,
                   'pquantity':pQuantity.text,

                 });
                 
                            

                          }, child: Text("Update"),),
                          SizedBox(width: 10,),


                             ElevatedButton(onPressed: (){
                               Navigator.pop(context);
                            

                          }, child: Text("Cancel "),),
                        ],
                      )
                      

                     
                    ],
                  ),
                )),
              ),



                      
                      TextField(decoration: InputDecoration(hintText: 'test'),)
                    ],),
                  );
                });







                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    borderRadius: BorderRadius.circular(28)
                    ),
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(trailing: IconButton(onPressed: (){
                          FirebaseFirestore.instance.collection('products').doc(data.id).delete().whenComplete(() => displayMessage("Deleted Sucessfully!!"));

                           }, icon: Icon(Icons.delete)),),
                        Row(
                          children: [
                            
                            Text("Product Name : "),
                            Text('${data['pname']}'.toUpperCase()),
                          ],
                        ),
              
              
                        Row(
                          children: [
                            Text("Product Price: "),
                            Text(data['pprice']),
                          ],
                        ),
              
                         Row(
                          children: [
                            Text("Product Quantity: "),
                            Text('${data['pquantity']}'.toUpperCase()),
                          ],
                        ),
              
              
              
              
                      ],
                    ),
                  )),
                ),
              );
          });

        }

      ),
      
      
    );
  }
}