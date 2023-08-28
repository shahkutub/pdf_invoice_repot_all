
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'database_helper/database_helper.dart';

class DueInputForm extends StatefulWidget{
  const DueInputForm({super.key});

  @override
  State<DueInputForm> createState() => _DueInputFormState();
}

class _DueInputFormState extends State<DueInputForm> {
  var customerNameTextController =  TextEditingController();
  var customerAddressTextController =  TextEditingController();
  var customerMobileTextController =  TextEditingController();
  var referenceNameTextController =  TextEditingController();
  var referenceMobileTextController =  TextEditingController();
  var dueTextController =  TextEditingController();
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Due form')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2.2,
                //  height: 45,
                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: customerNameTextController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    maxLines: 1,
                    minLines: 1,
                    decoration: InputDecoration(
                      labelText: 'Customer Name',
                      hintText: 'Customer Name',
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
                  width: MediaQuery.of(context).size.width/2.2,
                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: customerAddressTextController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Address/village',
                      hintText: 'Address',
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
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2.2,
                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: customerMobileTextController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Customer Mobile',
                      hintText: 'Customer Mobile',
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
                  width: MediaQuery.of(context).size.width/2.2,
                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: referenceNameTextController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Jamindar name',
                      hintText: 'Jamindar name',
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
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2.2,
                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: referenceMobileTextController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'jamindar Mobile',
                      hintText: 'jamindar Mobile',
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
                  width: MediaQuery.of(context).size.width/2.2,
                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: dueTextController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Due taka',
                      hintText: 'Due taka',
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
                  width: MediaQuery.of(context).size.width/2.2,
                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: referenceMobileTextController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.black),
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Commitment Date',
                      hintText: 'Commitment Date',
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
                InkWell(
                  onTap: (){
                    setState(() {
                      if(customerNameTextController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text( 'Input Customer Name')));
                      }else if(customerAddressTextController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text( 'Input Customer Address')));
                      }else if(referenceNameTextController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text( 'Input Reference nam')));
                      }else{
                        saveDue(customerNameTextController.text,customerAddressTextController.text,customerMobileTextController.text,
                            referenceNameTextController.text,referenceMobileTextController.text,dueTextController.text,'hhj','bmnb');
                        customerNameTextController.text ='';
                        customerAddressTextController.text ='';
                        customerMobileTextController.text ='';
                      }


                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width/2.2,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.red, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Text('Save'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveDue(name,address,mobile,jaminName,jaminMobile,dueAmount,payHistory,commitmentDate) async {
    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    print(formattedDate);

    Map<String, dynamic> row = {
      DatabaseHelper.colum_customer_name: name,
      DatabaseHelper.colum_customer_address: address,
      DatabaseHelper.colum_customer_mobile: mobile,
      DatabaseHelper.colum_jamindar_name: jaminName,
      DatabaseHelper.colum_jamindar_mobile: jaminMobile,
      DatabaseHelper.colum_due_amount: dueAmount,
      DatabaseHelper.colum_pay_history: payHistory,
      DatabaseHelper.colum_pay_commitment_date: commitmentDate,
    };
    await dbHelper.insert_due(row);
    var localdataSize = await dbHelper.getAllDueRows();
    print('localdataitemSize: ${localdataSize.length}');
  }
}