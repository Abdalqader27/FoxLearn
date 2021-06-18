class Place {
  final int shopId;
  final String name;
  final bool isClosed;

  const Place(this.shopId, {required this.name, this.isClosed = false});

  @override
  String toString() {
    return 'Place $name (closed : $isClosed)';
  }
}
