import '../data/providers/dio_provider.dart';

class Repository {
  final MyApiClient api;
// AUTH REPOSITORY
  Repository(this.api);

  getAll() {
    return api.getAll();
  }
  // getId(id) {
  //   return api.getId(id);
  // }

  // delete(id) {
  //   return api.delete(id);
  // }

  // edit(obj) {
  //   return api.edit(obj);
  // }

  // add(obj) {
  //   return api.add(obj);
  // }
}
