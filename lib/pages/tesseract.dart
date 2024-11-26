import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_mrz/tesseract_ocr/tesseract_ocr.dart';

class TesseractPage extends StatefulWidget {
  const TesseractPage({Key? key}) : super(key: key);

  @override
  _TesseractPageState createState() => _TesseractPageState();
}

class _TesseractPageState extends State<TesseractPage> {
  bool _scanning = false;
  String _extractText = '';
  int _scanTime = 0;

  void tesseractSelectImage() async {
    var file =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    _scanning = true;
    setState(() {});

    var watch = Stopwatch()..start();
    _extractText = await TesseractOcr.extractText(file!.path, language: 'eng');
    _scanTime = watch.elapsedMilliseconds;

    _scanning = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                tesseractSelectImage();
              },
              child: Container(
                width: 150,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.scanner),
                    Text(
                      "Image Scan",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            // It doesn't spin, because scanning hangs thread for now
            _scanning
                ? const CircularProgressIndicator()
                : const Icon(Icons.done),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Scanning took $_scanTime ms',
          style: TextStyle(color: Colors.red),
        ),
        SizedBox(
          height: 16,
        ),
        Center(child: SelectableText(_extractText)),
      ],
    );
  }
}
