import 'package:flutter_flow_app/service/unsplash_api.dart';
import 'package:get/get.dart';
import '../model/image_model.dart';

class ImageController extends GetxController {
  final UnsplashApiService apiService;
  final images = <ImageModel>[].obs;
  final isLoading = false.obs;
  final currentPage = 1.obs;
  final searchQuery = ''.obs;

  ImageController(this.apiService);

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages({bool isSearch = false}) async {
    isLoading(true);
    try {
      List<ImageModel> newImages;
      if (isSearch && searchQuery.value.isNotEmpty) {
        newImages = await apiService.searchImages(searchQuery.value, page: currentPage.value);
      } else {
        newImages = await apiService.fetchImages(page: currentPage.value);
      }
      if (currentPage.value == 1) {
        images.assignAll(newImages);
      } else {
        images.addAll(newImages);
      }
      currentPage.value++;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  void resetAndSearch(String query) {
    searchQuery.value = query;
    currentPage.value = 1;
    fetchImages(isSearch: true);
  }
}
