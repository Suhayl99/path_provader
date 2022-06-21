import 'dart:io';

import 'package:filesize/filesize.dart';
import 'package:path_provader/path_provader.dart' as path_provader;

 List<String> listFile =[];
void main(List<String> arguments) async{
  //var directory= Directory("../../../");
  String s= stdin.readLineSync()!;
  var list= await pathFile(s);
  showFileSort(list);
}

Future<List<String>> pathFile(var path) async{
  var dir =  Directory(path);
  
  List<FileSystemEntity> dirList = await dir.list().toList();
  for(var item in dirList){
    if( item is Directory){
     path = item.path;
   await  pathFile(path);
    }

    if( item is File ){
      listFile.add('${item.path.split('/').last}=>${item.statSync().size}');
     // print('${item.path.split('/').last} => ${filesize(item.statSync().size)}  => ${item.statSync().changed}');   
    }
  }
      return listFile;
}

  showFileSort(List<String> listFile){
  for (var i = 0; i <listFile.length-1; i++) {
    var index_min = i;
    for (var j = i + 1; j < listFile.length; j++) {
      int elementJ = int.parse(listFile[j].split(">").last);
      int elementI = int.parse(listFile[index_min].split('>').last);
      if (elementJ < elementI) {
        index_min = j;
      }
    }
    if (index_min != i) {
      var temp = listFile[i];
      listFile[i] = listFile[index_min];
      listFile[index_min] = temp;
    }
  }

    listFile.forEach((element) {print("${element.split('>').first}> ${filesize(element.split('>').last)}");});

}


  showFileNameSort(List<String> listFile){
  for (var i = 0; i <listFile.length-1; i++) {
    var index_min = i;
    for (var j = i + 1; j < listFile.length; j++) {
      int elementJ = int.parse(listFile[j].split(">").first);
      int elementI = int.parse(listFile[index_min].split('>').first);
      if (elementJ < elementI) {
        index_min = j;
      }
    }
    if (index_min != i) {
      var temp = listFile[i];
      listFile[i] = listFile[index_min];
      listFile[index_min] = temp;
    }
  }

    listFile.forEach((element) {print("${element.split('>').first}> ${filesize(element.split('>').last)}");});

}



