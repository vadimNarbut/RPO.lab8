import 'package:flutter/material.dart';
import 'firebase_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



void main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBo5I_jYRLBc-v2VDNSUUcLDWn0HP30vws",
      appId: "1:1043229387808:android:fff18196eaedf3c17be045",
      messagingSenderId: "1043229387808",
      projectId: "lab8-a02d4",
      storageBucket: 'lab8-a02d4.appspot.com',
    ),
  );

  final FirebaseManager firebaseManager = FirebaseManager();

  try{
    final List<Map<String, dynamic>> allNotes = await firebaseManager.getAllNotes();
    print('Список всех заметок:');
    print(allNotes);
    allNotes.forEach((note) {
      print('Заголовок: ${note['title']}, Содержание: ${note['content']}');
    });
  }catch (e){
    print("EXEPTION $e");
  }

  // Добавление новой заметки
  final newNote = {
    'title': 'Новая заметка',
    'content': 'Это текст новой заметки.',
  };

  await firebaseManager.addNote(newNote);
  print('Новая заметка успешно добавлена!');
  print('_________________________________________');

  try{
    final List<Map<String, dynamic>> allNotes = await firebaseManager.getAllNotes();
    print('Список всех заметок:');
    print(allNotes);
    allNotes.forEach((note) {
      print('Заголовок: ${note['title']}, Содержание: ${note['content']}');
    });
  }catch (e){
    print("EXEPTION $e");
  }


  // Обновление заметки
  final updatedNoteId = 'diu5b8BHc2dNoy87zE9K'; // Замените на реальный идентификатор заметки
  final updatedData = {'content': 'Обновленное содержание заметки'};
  await firebaseManager.updateNote(updatedNoteId, updatedData);
  print('Заметка успешно обновлена!');



  // Удаление заметки
  final noteToDeleteId = 'PLvtO63hg8J2knJ9A5pe'; // Замените на реальный идентификатор заметки
  await firebaseManager.deleteNote(noteToDeleteId);
  print('Заметка успешно удалена!');

  print('_________________________________________');

  try{
    final List<Map<String, dynamic>> allNotes = await firebaseManager.getAllNotes();
    print('Список всех заметок:');
    print(allNotes);
    allNotes.forEach((note) {
      print('Заголовок: ${note['title']}, Содержание: ${note['content']}');
    });
  }catch (e){
    print("EXEPTION $e");
  }

}


