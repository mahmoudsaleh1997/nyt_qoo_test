import 'dart:convert';
import 'dart:developer';

printJson( Map<String , dynamic> map){
  JsonEncoder encoder =  JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(map);
  log(prettyprint);
}