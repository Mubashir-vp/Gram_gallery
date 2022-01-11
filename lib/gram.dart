// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:android_external_storage/android_external_storage.dart';
//
// import 'package:path_provider/path_provider.dart';
//
//
// class MyApp extends StatefulWidget {
//
//   const MyApp({Key? key}) : super(key: key);
//
//
//   @override
//   _MyAppState createState() => _MyAppState();
//
// }
//
// class _MyAppState extends State<MyApp> {
//   File? _image;
//   List imageArray =[];
//   var image;
//   var pat;
//
//
//
//   final imagepicker=ImagePicker();
//   Future getImage()async{
//     final image=await imagepicker.pickImage(source: ImageSource.camera);
//     // final myImagePath = '${Uri.directory("/myimages")}';
//     // final myImgDir = await Directory(myImagePath).create();
//     var externalDirectoryPath = await AndroidExternalStorage.getExternalStorageDirectory();
//     print(externalDirectoryPath);
//     Directory(externalDirectoryPath! +'/YourfolderName')
//         .create()
//         .then((Directory directory)
//     {
//       pat=directory.path;
//     });;
//
//
//     setState(() {
//       _image=File(image!.path);
//       print(image.path);
//       File file=File(pat);
//       file.writeAsString(""); // 2
//
//
//       GallerySaver.saveImage(image!.path,albumName: "Camera App");
//       imageArray.add(_image);
//
//       setState(() {
//       });
//     });
//   }
//   // Future showimage()async{
//   //   var dirPath=await AndroidExternalStorage.getExternalStoragePublicDirectory(DirType.picturesDirectory);
//   //   print(dirPath);
//   //   // var dirPath=await
//   // }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           getImage();
//           },
//         child: Icon(Icons.add_a_photo),
//       ),
//       body: Center(
//           child:
//           GridView.count(crossAxisCount: 2,
//             children: [
//               _image==null?const Center(child: Text("No image picked")):
//
//               GridView.count(crossAxisCount: 2,mainAxisSpacing: 4,
//                 children: List.generate(imageArray.length, (index){
//                   File img =imageArray[index];
//                   File file = File(img.path);
//                   // print(img.path);
//                   return Image.file(file);
//
//
//                 }),),
//             ],
//
//           )
//         // _image==null? Text("No image picked"):Image.file(_image!)
//       ),
//     );
//
//   }
//
//
// }
//
