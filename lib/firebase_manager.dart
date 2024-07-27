import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Получение списка всех заметок
  Future<List<Map<String, dynamic>>> getAllNotes() async {
    try {
      final QuerySnapshot querySnapshot = await _firestore.collection('notes').get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Ошибка при получении заметок: $e');
      return [];
    }
  }

  // Добавление новой заметки
  Future<void> addNote(Map<String, dynamic> noteData) async {
    try {
      await _firestore.collection('notes').add(noteData);
      print('Заметка успешно добавлена!');
    } catch (e) {
      print('Ошибка при добавлении заметки: $e');
    }
  }

  // Обновление заметки по идентификатору
  Future<void> updateNote(String noteId, Map<String, dynamic> updatedData) async {
    try {
      await _firestore.collection('notes').doc(noteId).update(updatedData);
      print('Заметка успешно обновлена!');
    } catch (e) {
      print('Ошибка при обновлении заметки: $e');
    }
  }

  // Удаление заметки по идентификатору
  Future<void> deleteNote(String noteId) async {
    try {
      await _firestore.collection('notes').doc(noteId).delete();
      print('Заметка успешно удалена!');
    } catch (e) {
      print('Ошибка при удалении заметки: $e');
    }
  }
}