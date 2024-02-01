import 'package:flutter/material.dart';
import 'package:formfield/firebase/firebase_db.dart';
import 'package:formfield/models/some_model.dart';

class BirdViewModel extends ChangeNotifier {
  BirdViewModel() {
    getAllbirds();
  }

  List<Bird> _bird = [];
  List<Bird> get birds => _bird;

  FirebaseDb db =
      FirebaseDb(); //  yo line le FirebaseDb nam gareko instance create garcha db class bhako jasle BirdViewModel lai firebase sanga interact garna sajilo huncha

  addBird(Bird bird) async {
    //addbird le naya Bird add garcha firebase ma using the addBird method of FirebaseDb.. ani after adding the bird ,and it fetch all data again (getAllbirds()); ani notify garcha !!
    await db.addBird(bird);
    getAllbirds();
    notifyListeners();
  }

  getAllbirds() async {
    // This method getAllbirds fetches all bird data from Firestore using the getAllbirds method of the FirebaseDb class. It then updates the _bird list and notifies any listeners that the state has changed.
    _bird = await db.getAllbirds();
    notifyListeners();
  }

  updateBird(String id, Bird bird) async {
    //This method updateBird updates a bird in Firestore using the updateBird method of the FirebaseDb class. After updating the bird, it fetches all bird data again (getAllbirds()), and then notifies any listeners that the state has changed (notifyListeners()).
    await db.updateBird(id, bird);
    getAllbirds();
    notifyListeners();
  }

  deleteBird(String id) async {
    //This method deleteBird deletes a bird from Firestore using the deleteBird method of the FirebaseDb class. After deleting the bird, it fetches all bird data again (getAllbirds()), and then notifies any listeners that the state has changed (notifyListeners()).
    await db.deleteBird(id);
    getAllbirds();
    notifyListeners();
  }
}
