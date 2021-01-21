


class Client{

  String _name;
  String _urlPicture;

  Client(this._name,this._urlPicture);

  String get name => this._name;
  String get  urlPicture =>this._urlPicture;
  set name(String name)=>this._name=name;
  set urlPicture(String url)=>this._urlPicture=url;



}