class ReviewModel {
  final double averageRating;
  final int totalReviews;
  final Map<String, int> starCounts;
  final List<Review> reviews;

  ReviewModel({
    required this.averageRating,
    required this.totalReviews,
    required this.starCounts,
    required this.reviews,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      totalReviews: json['totalReviews'] ?? 0,
      starCounts: Map<String, int>.from(json['starCounts'] ?? {}),
      reviews:
          (json['reviews'] as List<dynamic>?)?.map((e) => Review.fromJson(e)).toList() ??
          [],
    );
  }
}

class Review {
  final int ratingValue;
  final String feedback;
  final ReviewUser fromUser;
  final String createdAt;

  Review({
    required this.ratingValue,
    required this.feedback,
    required this.fromUser,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      ratingValue: json['ratingValue'] ?? 0,
      feedback: json['feedback'] ?? '',
      fromUser: ReviewUser.fromJson(json['fromUser'] ?? {}),
      createdAt: json['createdAt'] ?? '',
    );
  }
}

class ReviewUser {
  final String name;
  final String profileImage;
  final String role;
  final String id;

  ReviewUser({
    required this.name,
    required this.profileImage,
    required this.role,
    required this.id,
  });

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(
      name: json['name'] ?? 'Unknown User',
      profileImage: json['profileImage'] ?? '',
      role: json['role'] ?? '',
      id: json['_id'] ?? json['id'] ?? '',
    );
  }
}
