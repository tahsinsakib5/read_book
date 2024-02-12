
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter/material.dart';

class FileDaw extends StatefulWidget {
  const FileDaw({super.key});

  @override
  State<FileDaw> createState() => _FileDawState();
}
bool isdaonlod =false;
class _FileDawState extends State<FileDaw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed:() {
          FileDownloader.downloadFile(url:"https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80",onProgress: (fileName, progress) {
            setState(() {
              isdaonlod=true;
            });
          },onDownloadCompleted: (path) {
            setState(() {
              isdaonlod=false;
            });
          },);

        }, child:isdaonlod==false? Text("dawonload"):CircularProgressIndicator()),
      ),
    );
  }
}