import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:tflite/tflite.dart';

// BUSINESS LOGIC AND VIEW STATE

class HomeViewModel extends BaseViewModel {
  bool _tfinitialised = false;
  bool _imageSelected = false;
  File _image;
  List _output;

  List get output => _output;
  File get image => _image;

  bool get istfInit => _tfinitialised;
  bool get imageSelected => _imageSelected;

  Map<String, String> _wasteToBinMapper = {
    "biological": "green",
    "cardboard": "blue",
    "glass": "red",
    "metal": "blue",
    "paper": "blue",
    "plastic": "blue",
    "trash": "red",
  };

  Map<String, String> get wasteToBinMapper => _wasteToBinMapper;

  final ImagePicker picker = ImagePicker();

  

  Future pickImage() async {
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      _image = File(image.path);
      _imageSelected = true;
      notifyListeners();
    } else {
      return null;
    }

    clasifyImage(_image);
  }

  pickGalleryImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    _image = File(image.path);
    _imageSelected = true;
    notifyListeners();

    clasifyImage(_image);
  }

  clasifyImage(File image) async {
    setBusy(true);
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.4,
        imageMean: 127.5,
        imageStd: 127.5);
    _output = output;
    notifyListeners();
    setBusy(false);
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/WasteClassifier_TFL.tflite',
        labels: 'assets/labels.txt');
  }

  void initState() {
    loadModel().then((value) {
      _tfinitialised = true;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
