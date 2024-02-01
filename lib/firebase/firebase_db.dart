//addBird ,updateBird and Delete bird hamile yeta mobile bbata data firebase ma pathuda chaincha uta bata ayeko data matra show garna chhai teo last ko future garera gako chaincga junki get data ho ni ta !

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:formfield/models/some_model.dart';

class FirebaseDb {
  FirebaseFirestore db = FirebaseFirestore.instance;  //This section defines a class named FirebaseDb responsible for handling interactions with the Firestore database. It initializes an instance of FirebaseFirestore named db.

  addBird(Bird bird) async {
    await db.collection('bird').add(bird.toJson(bird)); //This method addBird adds a new document (bird) to the "bird" collection in Firestore. It takes a Bird object as input, converts it to JSON using bird.toJson(), and adds it to the collection using the add method.
  }

  updateBird(String id, Bird bird) async {
    await db.collection('bird').doc(id).update( bird.toJson(bird)); //This method updateBird updates an existing bird document in Firestore. It takes the id of the bird document to be updated and a Bird object containing the updated data. It converts the Bird object to JSON using bird.toJson() and updates the document using the update method on the document reference obtained using doc(id).
  }

  deleteBird(String id) async {
    await db.collection('bird').doc(id).delete();//This method deleteBird deletes a bird document from Firestore. It takes the id of the bird document to be deleted and uses the delete method on the document reference obtained using doc(id).
  }

  Future<List<Bird>> getAllbirds() async {  
    List<Bird> birds = [];
    await db.collection('bird').get().then((collection) {
      for (var doc in collection.docs) {
        Map<String, dynamic> jsonData = doc.data();
        jsonData['id'] = doc.id;
        birds.add(Bird.fromJson(jsonData));
      }
    }).onError((error, stackTrace) {
      print("Unable to get data $error and the stackTrace is $stackTrace");
    });

    return birds.toList().reversed.toList();  //This method getAllbirds retrieves all bird documents from the "bird" collection in Firestore. It returns a Future containing a list of Bird objects. It uses the get method to fetch the documents, then iterates over them, converting each document's data to a Bird object using Bird.fromJson, and adds it to the birds list. If there's an error during fetching, it prints an error message.
  }
}
