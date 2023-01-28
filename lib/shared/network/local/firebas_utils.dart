import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../models/task.dart';

CollectionReference getTaskCollection(){
  return FirebaseFirestore.instance.collection("tasks").withConverter<Task>(fromFirestore:
      (snapshot, options) {
    return Task.fromJson(snapshot.data()!);
  }, toFirestore: (value, options) {
    return value.toJson();
  },);
}

Future<void> addTaskToFireStore(Task task){
  CollectionReference collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}
