class Product{
  String _name;
  String _price;
  String _urlPicture;
  List<String> _options;


  String get name => this._name;
  String get  urlPicture =>this._urlPicture;
  String get price => this._price;
  List<String> get  options =>this._options;

  set name(String name)=>this._name=name;
  set urlPicture(String url)=>this._urlPicture=url;
  set price(String price)=>this._price=price;
  set options(List<String> options)=>this._options=options;

}