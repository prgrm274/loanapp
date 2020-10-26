class Village{
  String id;
  String provinceId;
  String title;

  Village(this.id, this.provinceId,this.title);

  Village.fromMap(Map map) {
    id = map[id];
    provinceId = map[provinceId];
    title = map[title];
  }
}