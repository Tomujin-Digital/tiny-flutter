class DbRepository {
  ///
  // ... install dart_orm package
  // ignore: prefer_typing_uninitialized_variables
  final api;

  DbRepository(this.api);

  getAll() {
    return api.getAll();
  }

  getId(id) {
    return api.getId(id);
  }

  delete(id) {
    return api.delete(id);
  }

  edit(obj) {
    return api.edit(obj);
  }

  add(obj) {
    return api.add(obj);
  }
}
