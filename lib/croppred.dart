import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart'; // Ensure Tflite is imported for model prediction

class CropInputPage extends StatefulWidget {
  CropInputPage({super.key});

  @override
  _CropInputPageState createState() => _CropInputPageState();
}

class _CropInputPageState extends State<CropInputPage> {
  final TextEditingController rainfallController = TextEditingController();
  final TextEditingController phController = TextEditingController();
  final TextEditingController nitrogenController = TextEditingController();
  final TextEditingController phosphorousController = TextEditingController();
  final TextEditingController potassiumController = TextEditingController();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController humidityController = TextEditingController();

  String _predictedCrop = '';

  @override
  void initState() {
    super.initState();
    _loadModel(); // Load the model when the page is initialized
  }

  Future<void> _loadModel() async {
    String? result = await Tflite.loadModel(
      model: "assets/crop_prediction.tflite",
      labels: "assets/labels.txt",
    );
    print(result); // Log model loading result
  }

  String _validateInputs() {
    double? nitrogen = double.tryParse(nitrogenController.text);
    double? phosphorus = double.tryParse(phosphorousController.text);
    double? potassium = double.tryParse(potassiumController.text);
    double? temperature = double.tryParse(temperatureController.text);
    double? humidity = double.tryParse(humidityController.text);
    double? ph = double.tryParse(phController.text);
    double? rainfall = double.tryParse(rainfallController.text);

    // Input validation
    if (nitrogen == null || nitrogen < 0) return 'Nitrogen (N) must be a non-negative value.';
    if (phosphorus == null || phosphorus < 0) return 'Phosphorus (P) must be a non-negative value.';
    if (potassium == null || potassium < 0) return 'Potassium (K) must be a non-negative value.';
    if (temperature == null || temperature < 0) return 'Temperature must be a non-negative value.';
    if (humidity == null || humidity < 0 || humidity > 100) return 'Humidity must be between 0 and 100 percent.';
    if (ph == null || ph < 0 || ph > 14) return 'pH level must be between 0 and 14.';
    if (rainfall == null || rainfall < 0) return 'Rainfall must be a non-negative value.';

    return ''; // Return empty string if all validations pass
  }

  Future<void> _predictCrop() async {
    String validationMessage = _validateInputs();
    if (validationMessage.isNotEmpty) {
      _showErrorDialog(validationMessage);
      return; // Prevent proceeding if validation fails
    }

    // Gather inputs for prediction
    List<double> input = [
      double.parse(nitrogenController.text),
      double.parse(phosphorousController.text),
      double.parse(potassiumController.text),
      double.parse(temperatureController.text),
      double.parse(humidityController.text),
      double.parse(phController.text),
      double.parse(rainfallController.text),
    ];

    // Run the model on the input data
    var predictions = await Tflite.runModelOnArray(
      array: input,
      numResults: 1,
      threshold: 0.5,
    );

    // Handle the prediction results
    if (predictions != null && predictions.isNotEmpty) {
      setState(() {
        _predictedCrop = predictions[0]['label']; // Adjust according to your output format
        print("Predicted Crop: $_predictedCrop"); // Debug output
      });
    } else {
      setState(() {
        _predictedCrop = 'Error: Unable to predict';
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Input Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 56, 147, 59),
        title: const Text('Crop Input Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter Nitrogen (N):', style: TextStyle(fontSize: 18)),
            TextField(controller: nitrogenController, keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            const Text('Enter Phosphorus (P):', style: TextStyle(fontSize: 18)),
            TextField(controller: phosphorousController, keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            const Text('Enter Potassium (K):', style: TextStyle(fontSize: 18)),
            TextField(controller: potassiumController, keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            const Text('Enter Temperature (°C):', style: TextStyle(fontSize: 18)),
            TextField(controller: temperatureController, keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            const Text('Enter Humidity (%):', style: TextStyle(fontSize: 18)),
            TextField(controller: humidityController, keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            const Text('Enter pH Level:', style: TextStyle(fontSize: 18)),
            TextField(controller: phController, keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            const Text('Enter Rainfall (mm):', style: TextStyle(fontSize: 18)),
            TextField(controller: rainfallController, keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictCrop, // Calls the prediction function
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text('Predicted Crop: $_predictedCrop', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

