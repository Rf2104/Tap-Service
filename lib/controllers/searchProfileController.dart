import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projeto_final/pages/user_model.dart';

class SearchProfileController extends GetxController {
  static SearchProfileController get instance => Get.find();

  Rx<UserModel> user = UserModel(
      name: '',
      email: '',
      password: '',
      location: '',
      aboutMe: '',
      jobs: [],
      dms: []).obs;

  Future<UserModel?> fetchUserData(String userId) async {
    try {
      if (userId.isNotEmpty) {
        // Fetch user data from Firestore using the provided user ID
        DocumentSnapshot<Map<String, dynamic>> result = await FirebaseFirestore
            .instance
            .collection('users')
            .doc(userId)
            .get();

        List<Job> jobs = (result.data()!['jobs'] as List<dynamic>?)
                ?.map((jobData) => Job.fromMap(jobData))
                .toList() ??
            [];

        return UserModel(
          name: result.data()!['name'] ?? '',
          email: result.data()!['email'] ?? '',
          password: result.data()!['password'] ?? '',
          location: result.data()!['location'] ?? '',
          aboutMe: result.data()!['aboutMe'] ?? '',
          jobs: jobs,
          image: result.data()!['image'] ?? '',
          dms: (result.data()!['dms'] as List<dynamic>?)
                  ?.map((dm) => dm.toString())
                  .toList() ??
              [],
        );
      } else {
        print('Error fetching user data: userId is empty');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
