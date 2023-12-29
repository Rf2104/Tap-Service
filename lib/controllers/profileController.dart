import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projeto_final/pages/user_model.dart';
import 'package:projeto_final/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _userRepo = Get.put(UserRepository());

  Rx<UserModel> user = UserModel(
      name: '',
      email: '',
      password: '',
      location: '',
      aboutMe: '',
      jobs: [],
      dms: []).obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch user data when the controller is initialized
    fetchUserData("");
  }

  Future<void> fetchUserData(String userId) async {
    try {
      // Fetch user data from Firestore using the provided user ID
      DocumentSnapshot<Map<String, dynamic>> result = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();

      // Convert the result to a UserModel object and update the observable
      user(UserModel.fromMap(result.data()!));
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  List<Job> parseJobs(String jobsText) {
    List<Job> jobs = [];

    if (jobsText.isNotEmpty) {
      List<String> jobList =
          jobsText.split(',').map((job) => job.trim()).toList();

      for (String jobString in jobList) {
        List<String> jobDetails = jobString.split(':');

        if (jobDetails.length == 4) {
          String exp = jobDetails[0].trim();
          String price = jobDetails[1].trim();
          String jobName = jobDetails[2].trim();
          String jobDescription = jobDetails[3].trim();

          print(
              'Parsed Job Details: exp=$exp, price=$price, jobName=$jobName, jobDescription=$jobDescription');

          Job job = Job(
            exp: exp,
            price: price,
            jobName: jobName,
            jobDescription: jobDescription,
          );
          jobs.add(job);
        } else {
          // Handle invalid job string
          print('Invalid job string: $jobString');
        }
      }
    }

    return jobs;
  }

  getUserID() {
    final id = FirebaseAuth.instance.currentUser!.uid;
    if (id != null) {
      return id;
    } else {
      Get.snackbar("Error", "Something went wrong!");
    }
  }

  getUserData() {
    final email = FirebaseAuth.instance.currentUser!.email;
    if (email != null) {
      print(_userRepo.getUserDetails(email));
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Something went wrong!");
    }
  }

  updateDms(String dm, UserModel user) async{
    await _userRepo.updateDms(dm, user);
  }

  deleteJob(Job job, UserModel user) async {
    await _userRepo.deleteJob(job, user);
  }

  updateUser(UserModel user) async {
    await _userRepo.updateUser(user);
  }

  updateUserImage(String image, UserModel user) async {
    await _userRepo.updateUserImage(image, user);
  }

  updateUserJobs(List<Job> jobs, UserModel user) async {
    await _userRepo.updateUserJobs(jobs, user);
  }

  getUserImage(UserModel user) {
    return _userRepo.getUserImage(user);
  }

  getAboutMe(UserModel user) {
    if (user.aboutMe.isNotEmpty) {
      return user.aboutMe;
    } else {
      return "Tell something about you!";
    }
  }
}
