abstract interface class HelperTagRepository <T>{
  Future<List<T>> getAllSeededTags();
}