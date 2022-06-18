

class ReviewCart{
  String? ten, anh;
  int? id;
  dynamic? gia;
  dynamic soluong;
  ReviewCart({
    this.id,
    required this.ten,
    required this.soluong,
    this.gia,
    this.anh,
  });

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'ten' : ten,
      'gia' : gia,
      'soluong' : soluong,
      'anh' : anh
    };
  }
}