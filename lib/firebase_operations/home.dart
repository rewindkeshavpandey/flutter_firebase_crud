import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              return Padding(
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
                      Row(
                        children: [
                          Text("Product Name : "),
                          Text('${snapshot.data!.docs[index]['pname']}'.toUpperCase()),
                        ],
                      ),


                      Row(
                        children: [
                          Text("Product Price: "),
                          Text(snapshot.data!.docs[index]['pprice']),
                        ],
                      ),

                       Row(
                        children: [
                          Text("Product Quantity: "),
                          Text('${snapshot.data!.docs[index]['pquantity']}'.toUpperCase()),
                        ],
                      ),





                    ],
                  ),
                )),
              );
          });

        }

      ),
      
      
    );
  }
}