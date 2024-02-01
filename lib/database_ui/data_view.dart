import 'package:flutter/material.dart';
import 'package:formfield/database_ui/data_form.dart';
import 'package:formfield/viewmodel/bird_viewmodel.dart';
import 'package:provider/provider.dart';

class DataView extends StatelessWidget {
  const DataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BirdViewModel>(
      builder: (_, birdViewModel, __) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => DataForm()));
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text(" Data"),
          ),
          body: ListView.builder(
            itemCount: birdViewModel.birds.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Center(
                    child: Text("${index + 1}"),
                  ),
                ),
                title: Text(birdViewModel
                    .birds[index].name!),
                subtitle: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                          "Name : ${birdViewModel.birds[index].name}"),
                      Text(
                          "Work: ${birdViewModel.birds[index].work}"),
                      Text(
                          "Job: ${birdViewModel.birds[index].job}"),
                    ],
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    birdViewModel.deleteBird(birdViewModel.birds[index].id!);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
