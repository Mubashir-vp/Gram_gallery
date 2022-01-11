// // ----home page----
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
//
// class Camera extends StatefulWidget {
//   const Camera({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<Camera> {
//   File? _image;
//
//   @override
//   void initState() {
//     super.initState();
//     debugPrint("");
//   }
// // Future getImage()async{
// //   final image=await imagepicker.pickImage(source: ImageSource.camera);
// //   setState(() {
// //     _image=File(image!.path);
// //     GallerySaver.saveImage(image!.path,albumName:'My photos');
// //     setState(() {
// //     });
// //   });
// // }
//
//   Future pickImage({var location}) async {
//     try {
//       final imagethatpicking = await ImagePicker().pickImage(source: location);
//       if (imagethatpicking == null) return null;
//       debugPrint("Image toStore path is ${_image}");
//
//       final imageTemporary = File(imagethatpicking.path);
//       debugPrint("Image Temporary path is ${imageTemporary}");
//       final base = basename(imageTemporary.toString().trim());
//       debugPrint(
//           "the File Name is $base\n----------------------------------------------");
//
//       Directory? directory = await getExternalStorageDirectory();
//       final DirectoryPath = await directory!.path;
//       debugPrint("The Path file going to save is $DirectoryPath");
//       final File newImage = await imageTemporary.copy('${DirectoryPath}/$base');
//
// // imageList.add(imageTemporary);
//       setState(() {
//         _image = imageTemporary;
//         GallerySaver.saveImage(_image!.path, albumName: 'Gram Photos');
//       });
//     } on PlatformException catch (e) {
//       print('Failed To Pick Image : $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black38,
//       appBar: AppBar(
//         actions: [
//            ElevatedButton(
//             onPressed: () {
//               debugPrint('Gallery View Clicked');
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (BuildContext) => GalleryViewer()));
//             },
//             child: const Text(
//               "Gram Gallery ->",
//               style: TextStyle(color: Colors.red),
//             ),
//             style: ElevatedButton.styleFrom(elevation: 43),
//
//           ),
//
//         ],
//       ),
//
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               pickImage(location: ImageSource.camera);
//             },
//           child: const Text(
//             "Pick A Image +",
//             style: TextStyle(color: Color.fromARGB(240, 136, 143, 223)),
//           ),
//           style: ElevatedButton.styleFrom(primary: Colors.white),
//         ),
//       ),
//     );
//   }
// }
//
// // -------gallery in the app-------
//
// class GalleryViewer extends StatefulWidget {
//   const GalleryViewer({Key? key}) : super(key: key);
//
//   @override
//   _GalleryViewerState createState() => _GalleryViewerState();
// }
//
// late String directory;
// List file = [];
//
// @override
// class _GalleryViewerState extends State<GalleryViewer> {
//   void initState() {
//     super.initState();
//     _listofFiles();
//   }
//
//   void _listofFiles() async {
//     Directory? directory = await getExternalStorageDirectory();
//     final pathDir = await directory!.path;
//     debugPrint("File Location path in GalleryView is $pathDir");
//     setState(() {
//       file = Directory("$pathDir").listSync();
//     });
//     debugPrint(file.length.toString());
//   }
//
//   Widget NoItem() {
//     return const Center(
//         child: Text("No Images Added",
//             style: TextStyle(fontSize: 22, color: Colors.white60)));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(
//       title: const Center(child: Text("Your Gram Gallery",style: TextStyle(fontWeight: FontWeight.w900),)),
//     ),
//         backgroundColor: Colors.blueGrey,
//         body: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 child: StaggeredGridView.countBuilder(
//                   staggeredTileBuilder: (index) =>
//                       StaggeredTile.count(1, index.isEven ? 2 : 1),
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 15,
//                   crossAxisSpacing: 13,
//                   itemCount: file.length,
//                   primary: false,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) => buildCardImage(index),
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
//
// Widget buildCardImage(index) {
//   return Container(
//     margin: EdgeInsets.all(8),
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: Image.file(
//         file[index],
//         fit: BoxFit.cover,
//       ),
//     ),
//   );
// }
// // ListView.builder(itemCount: file.length,
// // itemBuilder: (BuildContext context, int index) {
// // return file.isEmpty ? NoItem():imageTile(index: index);
// // }
