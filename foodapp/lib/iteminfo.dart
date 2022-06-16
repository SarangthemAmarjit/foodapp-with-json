class Fooditem {
final String id;
final int qty;
final double price;
final String itemimage;
final String itemname;

  Fooditem(this.id, this.qty, this.price, this.itemimage, this.itemname,);

  //ENCODING TO JSON FILE
  Map<String, dynamic> toJson() => {
        'id': id,
        'qty': qty,
        'price': price,
        'itemimage': itemimage,
        'itemname': itemname,
      };

  // DECODING FROM JSON FILE
  Fooditem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        qty = json['qty'],
        price = json['price'],
        itemimage = json['itemimage'],
        itemname = json['itemname'];
}
