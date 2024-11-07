import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flow_app/controller/image_controller.dart';
import 'package:flutter_flow_app/controller/search_history_controller.dart';
import 'package:flutter_flow_app/service/unsplash_api.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ImageController imageController = Get.put(ImageController(UnsplashApiService()));
  final SearchHistoryController searchHistoryController = Get.put(SearchHistoryController(FirebaseFirestore.instance));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onSubmitted: (query) {
            imageController.resetAndSearch(query);
            searchHistoryController.saveSearchQuery(query);
          },
          decoration: const InputDecoration(hintText: 'Search Unsplash'),
        ),
      ),
      body: Obx(() {
        if (imageController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: imageController.images.length,
          itemBuilder: (context, index) {
            final image = imageController.images[index];
            return Image.network(image.imageUrl);
          },
        );
      }),
    );
  }
}