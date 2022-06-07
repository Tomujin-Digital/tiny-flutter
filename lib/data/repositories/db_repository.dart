class DbRepository {
  // TODO implement DbRepository
  // ... install dart_orm package
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
