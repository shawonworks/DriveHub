import 'package:get/get.dart';
import 'package:go_connect/screens/car_review_screen/review_model.dart';

class ReviewController extends GetxController {
  final RxBool isLoading = false.obs;
  final Rx<ReviewModel?> reviewData = Rx<ReviewModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadDummyReviews();
  }

  void loadDummyReviews() {
    isLoading.value = true;

    // Simulating API delay
    Future.delayed(const Duration(seconds: 1), () {
      reviewData.value = ReviewModel(
        averageRating: 2.6,
        totalReviews: 199,
        starCounts: {'5': 49, '4': 5, '3': 0, '2': 0, '1': 49},
        reviews: _generateDummyReviews(),
      );
      isLoading.value = false;
    });
  }

  List<Review> _generateDummyReviews() {
    return [
      Review(
        ratingValue: 5,
        feedback:
            "Tandiwe is amazing! She's been so caring with my daughter, and we trust her completely. Highly recommended for anyone looking for a reliable nanny.",
        fromUser: ReviewUser(
          name: "Sarah Johnson",
          profileImage: "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100",
          role: "Parent",
          id: "user1",
        ),
        createdAt: "2024-11-15",
      ),
      Review(
        ratingValue: 4,
        feedback:
            "Great experience overall. The nanny was punctual and professional. My kids enjoyed spending time with her. Would definitely book again.",
        fromUser: ReviewUser(
          name: "Michael Chen",
          profileImage: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100",
          role: "Parent",
          id: "user2",
        ),
        createdAt: "2024-11-10",
      ),
      Review(
        ratingValue: 5,
        feedback:
            "Exceptional service! She went above and beyond to take care of my children. Very patient and understanding with kids. Thank you so much!",
        fromUser: ReviewUser(
          name: "Emily Rodriguez",
          profileImage: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100",
          role: "Parent",
          id: "user3",
        ),
        createdAt: "2024-11-08",
      ),
      Review(
        ratingValue: 2,
        feedback:
            "Exceptional service! She went above and beyond to take care of my children. Very patient and understanding with kids. Thank you so much!",
        fromUser: ReviewUser(
          name: "Emily Rodriguez",
          profileImage: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100",
          role: "Parent",
          id: "user3",
        ),
        createdAt: "2024-11-08",
      ),
    ];
  }

  void refreshReviews() {
    loadDummyReviews();
  }
}
