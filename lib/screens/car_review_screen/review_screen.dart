import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:go_connect/custom_widgets/app_image/app_image_circular.dart';
import 'package:go_connect/screens/car_review_screen/controller/review_controller.dart';
import 'package:go_connect/screens/car_review_screen/review_model.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/utils/app_size.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ReviewController>(
      init: ReviewController(),
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: ConstColor.textColor));
        }

        final reviewData = controller.reviewData.value;
        if (reviewData == null) {
          return const Center(child: Text(ConstString.noReviewsAvailable));
        }

        return SingleChildScrollView(
          child: Column(children: [_buildReviewSummary(reviewData), const SizedBox(height: 20), _buildReviewsList(reviewData.reviews)]),
        );
      },
    );
  }

  Widget _buildReviewSummary(ReviewModel reviewData) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.1), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRatingCircle(reviewData),
          const SizedBox(width: 20),
          Expanded(child: _buildRatingBars(reviewData.starCounts, reviewData.totalReviews)),
        ],
      ),
    );
  }

  Widget _buildRatingCircle(ReviewModel reviewData) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(color: ConstColor.textColor, shape: BoxShape.circle),
          child: Text(
            reviewData.averageRating.toStringAsFixed(1),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        Text('${reviewData.totalReviews} ${ConstString.reviews}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        RatingBar.builder(
          initialRating: reviewData.averageRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ignoreGestures: true,
          itemSize: 16,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1),
          itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }

  Widget _buildRatingBars(Map<String, int> starCounts, int totalReviews) {
    return Column(
      children: [
        for (int i = 5; i >= 1; i--)
          // _buildRatingBarRow('$i stars', starCounts['$i'] ?? 0, 5),
          _buildRatingBarRow('$i ${ConstString.stars}', starCounts['$i'] ?? 0, totalReviews),
      ],
    );
  }

  Widget _buildRatingBarRow(String label, int count, int totalCount) {
    double percentage = totalCount > 0 ? count / totalCount : 0.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 8,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.grey.shade300),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: percentage,
                  backgroundColor: Colors.transparent,
                  valueColor: const AlwaysStoppedAnimation<Color>(ConstColor.textColor),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(count.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildReviewsList(List<Review> reviews) {
    if (reviews.isEmpty) {
      return const Center(child: Text(ConstString.noReviewsYet));
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return _buildReviewItem(reviews[index]);
      },
    );
  }

  Widget _buildReviewItem(Review review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 22,

                child: review.fromUser.profileImage.isEmpty
                    ? Text(
                        review.fromUser.name.isNotEmpty ? review.fromUser.name[0].toUpperCase() : 'U',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      )
                    : AppImageCircular(
                        url: review.fromUser.profileImage,
                        width: AppSize.width(value: 40),
                        fit: BoxFit.cover,
                        height: AppSize.width(value: 40),
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review.fromUser.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    RatingBar.builder(
                      initialRating: review.ratingValue.toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      ignoreGestures: true,
                      itemSize: 14,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
              ),
              Text(
                '1 month ago',
                // _formatDate(review.createdAt),
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(review.feedback, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, height: 1.4)),
        ],
      ),
    );
  }

  // String _formatDate(String dateString) {
  //   try {
  //     final date = DateTime.parse(dateString);
  //     final months = [
  //       '',
  //       'Jan',
  //       'Feb',
  //       'Mar',
  //       'Apr',
  //       'May',
  //       'Jun',
  //       'Jul',
  //       'Aug',
  //       'Sep',
  //       'Oct',
  //       'Nov',
  //       'Dec',
  //     ];
  //     return '${date.day} ${months[date.month]} ${date.year.toString().substring(2)}';
  //   } catch (e) {
  //     return 'Recent';
  //   }
  // }
}
