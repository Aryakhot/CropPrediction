import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crop Prediction',
      home: CropPredictionForm(),
    );
  }
}

class CropPredictionForm extends StatefulWidget {
  @override
  _CropPredictionFormState createState() => _CropPredictionFormState();
}

class _CropPredictionFormState extends State<CropPredictionForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nController = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _kController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  final TextEditingController _phController = TextEditingController();
  final TextEditingController _rainfallController = TextEditingController();

  String _predictedCrop = '';

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    String? result = await Tflite.loadModel(
      model: "assets/crop_prediction.tflite", // Ensure you place your .tflite file in the assets folder
      labels: "assets/labels.txt", // Optional: if you have a labels file
    );
    print(result);
  }

  Future<void> _predictCrop() async {
    List<dynamic> predictions = await Tflite.runModelOnArray(
      array: [
        double.parse(_nController.text),
        double.parse(_pController.text),
        double.parse(_kController.text),
        double.parse(_temperatureController.text),
        double.parse(_humidityController.text),
        double.parse(_phController.text),
        double.parse(_rainfallController.text),
      ],
      numResults: 1, // Number of classes to return
      threshold: 0.5, // Minimum probability for the result
    );

    if (predictions != null) {
      setState(() {
        _predictedCrop = predictions[0]['label']; // Adjust according to your output format
      });
    } else {
      setState(() {
        _predictedCrop = 'Error: Unable to predict';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crop Prediction')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nController,
                decoration: InputDecoration(labelText: 'Nitrogen (N)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter nitrogen value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _pController,
                decoration: InputDecoration(labelText: 'Phosphorus (P)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phosphorus value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _kController,
                decoration: InputDecoration(labelText: 'Potassium (K)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter potassium value';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _temperatureController,
                decoration: InputDecoration(labelText: 'Temperature (°C)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter temperature';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _humidityController,
                decoration: InputDecoration(labelText: 'Humidity (%)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter humidity';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phController,
                decoration: InputDecoration(labelText: 'pH Level'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pH level';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _rainfallController,
                decoration: InputDecoration(labelText: 'Rainfall (mm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter rainfall';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _predictCrop();
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              Text('Predicted Crop: $_predictedCrop'),
            ],
          ),
        ),
      ),
    );
  }
}
