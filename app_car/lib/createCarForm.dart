import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateCarForm extends StatefulWidget{
  const CreateCarForm({super.key});

    @override
    _CreateCarFormState createState() => _CreateCarFormState();
}

class _CreateCarFormState extends State<CreateCarForm> {
  final TextEditingController _photoController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _kilometerController = TextEditingController();
  final TextEditingController _horsePowerController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _submitForm() async {
    int kmNumber = int.parse(_kilometerController.text);
    int hpNumber = int.parse(_horsePowerController.text);
    int authorIdNumber = int.parse(_authorIdController.text);
  
    try{
      const apiUrl = 'http://localhost:3000/cars';
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'photo': _photoController.text,
          'brand': _brandController.text,
          'kilometer': kmNumber,
          'horsepower': hpNumber,
          'authorId': authorIdNumber,
          'description': _descriptionController.text,
        },
      );

      if (response.statusCode == 201) {
        print('Éxito: ${response.body}');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e){
      print('Error en la solicitud POST: $e');
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('INGRESAR VEHÍCULO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _photoController,
              decoration: const InputDecoration(labelText: 'Foto'),
            ),
            TextField(
              controller: _brandController,
              decoration: const InputDecoration(labelText: 'Marca:'),
            ),
            TextField(
              controller: _kilometerController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Kilometros:'),
            ),
            TextField(
              controller: _horsePowerController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Potencia:'),
            ),
            TextField(
              controller: _authorIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Autor:'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción:'),
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}