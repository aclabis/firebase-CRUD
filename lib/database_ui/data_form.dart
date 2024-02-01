import 'package:flutter/material.dart';
import 'package:formfield/models/some_model.dart';
import 'package:formfield/viewmodel/bird_viewmodel.dart';
import 'package:provider/provider.dart';

class DataForm extends StatelessWidget {
  const DataForm({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _ageController = TextEditingController();
    TextEditingController _workController = TextEditingController();

    BirdViewModel birdViewModel =
        Provider.of<BirdViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("form field"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _workController,
              decoration: InputDecoration(labelText: 'Work'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Job'),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Bird newBird = Bird(
                  name: _nameController.text,
                  age: int.parse(_ageController.text),
                  work: _workController.text,
                );
                birdViewModel.addBird(newBird);
              },
              child: Text("Submitt bro"),
            ) //This part includes an ElevatedButton for submitting the form data. When pressed, it creates a new Bird object using the text entered into the text fields, then calls the addBird method of the birdViewModel to add the new bird to the database.
          ],
        ),
      ),
    );
  }
}
