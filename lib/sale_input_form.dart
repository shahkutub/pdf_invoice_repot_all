
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
    new Product(product_name: "cow7", product_price: 500),
    new Product(product_name: "cow7", product_price: 500),
    new Product(product_name: "cow7", product_price: 500),

  ];
  int index = 0;

  var priceTextController =  TextEditingController();
  var amountTextController =  TextEditingController();
  var totalTextController =  TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    amountTextController.addListener(() {
      setState(() {
        totalTextController.text = (int.parse(priceTextController.text)*int.parse(amountTextController.text)).toString();
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Column(
          children: [
            addProductWidget(context),
          ],
        ),
      ),
    );
  }

  Widget addProductWidget(BuildContext context) {


    return Container(
      margin: EdgeInsets.only(top: 40,right: 10,left: 10),
      child: Column(
        children: [
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
                          priceTextController.text = value.product_price.toString();


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
          SizedBox(
            height: 15,
          ),
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
        ],
      ),
    );
  }
}

class Product {
   String? product_name;
   int? product_price;
   int? buy_amount;
   int? product_total;
   Product({
    this.product_name,
    this.product_price,
    this.buy_amount,
    this.product_total,
  });
}