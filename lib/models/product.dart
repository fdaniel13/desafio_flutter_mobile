class Product{
  String _name;
  double _price;
  String _urlPicture;
  List<String> _options;

  Product(this._name,this._urlPicture,this._price,this._options);

  String get name => this._name;
  String get  urlPicture =>this._urlPicture;
  double get price => this._price;
  List<String> get  options =>this._options;

  set name(String name)=>this._name=name;
  set urlPicture(String url)=>this._urlPicture=url;
  set price(double price)=>this._price=price;
  set options(List<String> options)=>this._options=options;

}