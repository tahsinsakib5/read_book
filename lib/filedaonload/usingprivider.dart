import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DownloadProvider with ChangeNotifier {
  bool _isDownloading = false;

  bool get isDownloading => _isDownloading;

  void startDownload() {
    _isDownloading = true;
    notifyListeners();

    FileDownloader.downloadFile(
      url: "https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80",
      onProgress: (fileName, progress) {
        // Handle progress if needed
      },
      onDownloadCompleted: (path) {
        _isDownloading = false;
        notifyListeners();
      },
    );
  }
}

class FileDaw extends StatefulWidget {
  const FileDaw({super.key});

  @override
  State<FileDaw> createState() => _FileDawState();
}

class _FileDawState extends State<FileDaw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Access the provider and start the download
            Provider.of<DownloadProvider>(context, listen: false).startDownload();
          },
          child: Consumer<DownloadProvider>(
            builder: (context, downloadProvider, child) {
              return downloadProvider.isDownloading
                  ? CircularProgressIndicator()
                  : Text("Download");
            },
          ),
        ),
      ),
    );
  }
}
