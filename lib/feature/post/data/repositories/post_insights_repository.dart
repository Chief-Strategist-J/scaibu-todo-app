import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_insights_repository.dart';

/// Doc Required
class PostInsightsImpl extends PostInsightsRepository<PostEntity> {
  /// Doc Required
  @override
  Future<PostEntity> getPostAuthorStatistics(final int authorId) {
    // TO-DO: implement getPostAuthorStatistics
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<PostEntity> getPostEngagementMetrics(final int postId) {
    // TO-DO: implement getPostEngagementMetrics
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<List<PostEntity>> getPostTrends({final int days = 30}) {
    // TO-DO: implement getPostTrends
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<List<PostEntity>> getPostsWithComments({
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getPostsWithComments
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<List<PostEntity>> getTopPostCategories() {
    // TO-DO: implement getTopPostCategories
    throw UnimplementedError();
  }
}
