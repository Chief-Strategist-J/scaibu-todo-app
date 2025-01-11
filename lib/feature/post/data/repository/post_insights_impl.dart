import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_insights_repository.dart';

class PostInsightsImpl extends PostInsightsRepository<PostEntity> {
  @override
  Future<PostEntity> getPostAuthorStatistics(final int authorId) {
    // TODO: implement getPostAuthorStatistics
    throw UnimplementedError();
  }

  @override
  Future<PostEntity> getPostEngagementMetrics(final int postId) {
    // TODO: implement getPostEngagementMetrics
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> getPostTrends({final int days = 30}) {
    // TODO: implement getPostTrends
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> getPostsWithComments(
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getPostsWithComments
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> getTopPostCategories() {
    // TODO: implement getTopPostCategories
    throw UnimplementedError();
  }
}
