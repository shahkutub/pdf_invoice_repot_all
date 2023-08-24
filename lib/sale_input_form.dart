
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaleInputForm extends StatefulWidget{
  const SaleInputForm({super.key});
  @override
  _SaleInputFormState createState() => _SaleInputFormState();

}

class _SaleInputFormState extends State<SaleInputForm>{
  List<Product> cities = [
    new Product(product_name: "cow7", product_price: 500),
    new Product(product_name: "cow8", product_price: 300),
    new Product(product_name: "cow9", product_price: 400),
    new Product(product_name: "cow6", product_price: 600),

  ];

  List<Product> salItems = [];



  int index = 0;

  var priceTextController =  TextEditingController();
  var amountTextController =  TextEditingController();
  var totalTextController =  TextEditingController();

  String? selectedProductName;
  double? width = 0;
  double? height = 0;
  int? total = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    amountTextController.addListener(() {
      setState(() {
        calculation();
      });
    });
  }
  void calculation() {
    totalTextController.text = (int.parse(priceTextController.text)*int.parse(amountTextController.text)).toString();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white60,
      body:addProductWidget(context),
      //SingleChildScrollView(
        //child:
        // Column(
        //   children: [
        //     addProductWidget(context),
        //   ],
        // ),
      //),
    );
  }

  Widget addProductWidget(BuildContext context) {


    return Container(
      margin: EdgeInsets.only(top: 40,right: 10,left: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  showProductAddDialoge();
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width/4,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: Colors.red, style: BorderStyle.solid, width: 0.80),
                  ),
                  child: Text('Add Product'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width/1.7,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: Colors.black, width: 0.80),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: cities[index],
                        hint: new Text("Ville"),
                        items: cities.map((Product value) {
                          return new DropdownMenuItem(
                            value: value,
                            child: new Row(
                              children: <Widget>[
                                // new Icon(
                                //   value.icon,
                                //   color: Colors.deepOrange,
                                // ),
                                new Text(value.product_name!)
                              ],
                            ),
                          );
                        }).toList(),
                      onChanged: (Product? value) {
                        setState(() {
                          index = cities.indexOf(value!);
                          selectedProductName = value.product_name.toString();
                          priceTextController.text = value.product_price.toString();
                          calculation();
                          print(index);
                        });
                      },
                    )
                  )
                ),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: 50,
                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: priceTextController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      hintText: 'Price',
                      labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.80, color: Colors.black),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0.80, color: Colors.black),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onTap: () {
                      //_selectDate(context);
                    },
                  ),
                ),
              ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 50,
                //padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                   controller: amountTextController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    hintText: 'Amount',
                    labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.80, color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.80, color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onTap: () {
                  },
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 50,
                //padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                   controller: totalTextController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Total',
                    hintText: 'Total',
                    labelStyle: TextStyle(color: Colors.black,fontSize: 15),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.80, color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 0.80, color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onTap: () {
                    //_selectDate(context);
                  },
                ),
              ),

              InkWell(
                onTap: (){
                  setState(() {
                    salItems.add(
                        Product(product_name: selectedProductName,
                            product_price: int.parse(priceTextController.text),
                            buy_amount: int.parse(amountTextController.text),
                            price_total: int.parse(totalTextController.text)
                        )
                    );
                    totalCalculate();

                    priceTextController.text ="";
                    amountTextController.text ="";
                    totalTextController.text ="";

                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width/4.5,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: Colors.red, style: BorderStyle.solid, width: 0.80),
                  ),
                  child: Text('Add'),
                ),
              )

            ],
          ),
          SizedBox(height: 20,),
          Visibility(
            visible: salItems.length > 0?true:false,
            child: Container(
              margin: EdgeInsets.only(top: 10,left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name', style: TextStyle(color: Colors.white, fontSize: 15),),
                  Text('Price',style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text('Amount',style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text('Total',style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text('Action',style: TextStyle(color: Colors.white, fontSize: 15)),
                ],

              ),
            ),
          ),
          Expanded(
            //height: 200,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: salItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(salItems[index].product_name.toString(), style: TextStyle(color: Colors.black, fontSize: 15),),
                        Text(salItems[index].product_price.toString(),style: TextStyle(color: Colors.black, fontSize: 15)),
                        Text(salItems[index].buy_amount.toString(),style: TextStyle(color: Colors.black, fontSize: 15)),
                        Text(salItems[index].price_total.toString(),style: TextStyle(color: Colors.black, fontSize: 15)),
                        InkWell(
                            child: Icon(Icons.cancel_outlined,color: Colors.red,),
                          onTap: (){
                              setState(() {
                                salItems.remove(salItems[index]);
                                totalCalculate();
                              });

                          },
                        )
                      ],

                    ),
                  );
                }),
          ),
          Visibility(visible: salItems.length > 0?true:false, child: Container(height:1,width:width!-20.0, color: Colors.black45,)),
          Visibility(
            visible: salItems.length > 0?true:false,
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(top: 0,left: 10,right: 10,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('   ', style: TextStyle(color: Colors.white, fontSize: 15),),
                  Text('    ',style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text('Total',style: TextStyle(color: Colors.white, fontSize: 15)),
                  Text('${total}',style: TextStyle(color: Colors.black, fontSize: 17)),
                  Text('    ',style: TextStyle(color: Colors.white, fontSize: 15)),
                ],

              ),
            ),
          ),

        ],
      ),
    );
  }

  void totalCalculate() {
    total = 0;
    salItems.forEach((element) {
      total = total! + element.price_total!;
    });
  }

  void showProductAddDialoge() {
    var productTextController = TextEditingController();
    var priceTextController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text('Welcome'),
            content: Container(
              height: 150,
              child: Column(
                children: [
                  TextField(
                    controller: productTextController,
                    decoration: InputDecoration(
                      hintText: 'Product Name',
                      labelText: 'Product Name',
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: priceTextController,
                    decoration: InputDecoration(
                      hintText: 'Product Price',
                      labelText: 'Product Price',
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                //textColor: Colors.black,
                onPressed: () {
                  setState(() {
                    cities.add(Product(product_price: int.parse(priceTextController.text),product_name: productTextController.text));
                  });
                },
                child: Text('Save'),
              ),
              TextButton(
               // textColor: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }
}





class Product {
   String? product_name;
   int? product_price;
   int? buy_amount;
   int? price_total;
   Product({
    this.product_name,
    this.product_price,
    this.buy_amount,
    this.price_total,
  });
}

