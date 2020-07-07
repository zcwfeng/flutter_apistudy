import 'dart:io';

Future<String> readFile() async{
  var content = await File("/Users/zcw/dev/workspace_flutter/flutter_apistudy/lib/dart/isolate_demo.dart").readAsString();
  var content2 = await File("/Users/zcw/dev/workspace_flutter/flutter_apistudy/lib/dart/isolate_demo.dart").readAsString();
  return "$content$content2";
}

void main(){
  readFile().then((value) => print(value));
}