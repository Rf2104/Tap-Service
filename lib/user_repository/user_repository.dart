// ignore_for_file: body_might_complete_normally_catch_error

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final/user_model.dart';

class UserRepository {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection('users')
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
              "Success",
              "Account created successfully!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            ))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red);
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('users').where('email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<void> updateUser(UserModel user) async {
    final userDoc = _db.collection('users').doc(user.id);

    // Check if the document exists
    final userDocSnapshot = await userDoc.get();
    if (userDocSnapshot.exists) {
      // Document exists, proceed with the update
      await userDoc.update(user.toJson());
    } else {
      // Document does not exist, handle the error or perform any necessary action
      print("Document not found: ${user.id}");
      // You might want to throw an exception or show a message to the user
    }
  }

  Future<void> updateUserImage(String image, UserModel user) async {
    final userDoc = _db.collection('users').doc(user.id);
    final imageName = "${image}.jpg";
    if (image == user.image) {
      return;
    }
    // Check if the document exists
    try {
      // Check if the document exists
      final userDocSnapshot = await userDoc.get();

      if (userDocSnapshot.exists) {
        // Document exists, proceed with the update
        await userDoc.update({'image': imageName});
        print('User image updated successfully.');
      } else {
        // Document does not exist, handle the error or perform any necessary action
        print("Document not found: ${user.id}");
      }
    } catch (e) {
      print('Error updating user image: $e');
    }
  }

  Future<String?> getUserImage(UserModel user) async {
    final snapshot =
        await _db.collection('users').where('id', isEqualTo: user.id).get();
    final userDataList =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();

    if (userDataList.isNotEmpty) {
      final userData = userDataList.single;
      // Now you can use userData
      print(userData.image);
      return userData.image;
    } else {
      // Handle the case when there is no user data
      return null; // Or any other appropriate value
    }
  }

  Future<void> updateUserJobs(List<Job> jobs, UserModel user) async {
    final userDoc = _db.collection('users').doc(user.id);

    // Check if the document exists
    final userDocSnapshot = await userDoc.get();
    if (userDocSnapshot.exists) {
      // Document exists, proceed with the update
      await userDoc.update({'jobs': jobs.map((e) => e.toJson()).toList()});
    } else {
      // Document does not exist, handle the error or perform any necessary action
      print("Document not found: ${user.id}");
      // You might want to throw an exception or show a message to the user
    }
  }
}
