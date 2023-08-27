import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "amena.db";
  static final _databaseVersion = 1;
  static final columnId = 'id';
  static final date = 'date';
  //table name due
  static final table_due = 'due_table';
  //due table colum
  static final colum_customer_name = 'customer_name';
  static final colum_customer_address = 'customer_address';
  static final colum_customer_mobile = 'customer_mobile';
  static final colum_jamindar_name = 'jamindar_name';
  static final colum_jamindar_mobile = 'jamindar_mobile';
  static final colum_due_amount = 'due_amount';
  static final colum_pay_commitment_date = 'commitment_date';
  static final colum_pay_history = 'pay_history';


  static final prodName = 'name';
  static final status = 'status';


  static final table_patient_serial = 'table_patient_serial';
  static final table_patient_serial_all = 'table_patient_serial_all';


  static final table_item_dispatch = 'table_item_dispatch';
  static final item_dispatch_quantity = 'item_dispatch_quantity';
  static final item_dispatch_serial = 'item_dispatch_serial';
  static final item_dispatch_patient_id = 'item_dispatch_patient_id';
  static final item_dispatch_medicine_name = 'item_dispatch_medicine_name';
  static final item_dispatch_medicine_id = 'item_dispatch_medicine_id';
  static final item_dispatch_sync_status = 'sync_status';


  // table_drugs
  static final table_drugs = 'table_drugs';
  static final drug_name = 'drug_name';
  static final drug_id = 'drug_id';
  static final drug_generic_name = 'drug_generic_name';
  static final drug_generic_id = 'drug_generic_id';
  static final drug_pstrength_name = 'drug_pstrength_name';
  static final drug_pstrength_id = 'drug_pstrength_id';
  static final drug_available_stock = 'available_stock';
  static final drug_stock_receive = 'stock_receive';
  static final drug_stock_opening = 'stock_opening';
  static final drug_stock_consume = 'stock_consume';
  static final drug_stock_lose = 'stock_lose';
  static final drug_reject_reason = 'reject_reason';
  static final drug_batch_no = 'batch_no';
  // drug_receive_type : 1 == general, 2== internal
  static final drug_receive_type = 'drug_receive_type';
  static final stockout_master_id = 'stockout_master_id';


  // table_internal_request
  static final table_internal_request = 'table_internal_request';

  static final internal_req_serial = 'internal_req_serial';
  //static final internal_req_batch_no = 'internal_req_batch_no';
  static final internal_req_date = 'internal_req_date';
  static final internal_req_receive_status = 'internal_req_receive_status';
  static final internal_req_med_name = 'internal_req_med_name';
  static final internal_req_med_id = 'internal_req_med_id';
  static final internal_req_qty = 'internal_req_qty';
  static final internal_req_remark = 'internal_req_remark';


  // table_opening_balance
  static final table_opening_stock = 'table_opening_stock';


  // make this a singleton class
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    print(path);
    return await openDatabase(
        path, version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {


    await db.execute('''
          CREATE TABLE $table_due (
            $columnId INTEGER PRIMARY KEY,
            $colum_customer_name TEXT,
            $colum_customer_address TEXT,
            $colum_customer_mobile TEXT,
            $colum_jamindar_name TEXT,
            $colum_jamindar_mobile TEXT,
            $colum_pay_commitment_date TEXT,
            $colum_pay_history TEXT,
            $colum_due_amount TEXT
          )
          ''');
  }

  // insert drug
  Future<int> insert_due(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(
        table_due, row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getAllDueRows() async {
    Database db = await instance.database;
    return await db.query(table_due);
  }

  Future<int> update_dispatch(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String id = row[item_dispatch_medicine_id];
    return await db.update(table_item_dispatch, row, where: '$item_dispatch_medicine_id = ?', whereArgs: [id]);
  }


  // get internal request
  Future<List<Map<String, dynamic>>> get_internal_request() async {
    Database db = await instance.database;
    return await db.query(table_internal_request);
  }

  // delete internal request
  Future<int> delete_internal_request() async {
    Database db = await instance.database;
    return await db.delete(table_internal_request);
  }



}