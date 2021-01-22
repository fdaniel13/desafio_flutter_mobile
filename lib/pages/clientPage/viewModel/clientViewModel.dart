import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'clientViewModel.g.dart';

class ClientViewModel = ClientViewModelBase with _$ClientViewModel;

abstract class ClientViewModelBase with Store{

  @observable
  List<Client> clientsSelected=[];

  @observable
  bool stepComplete=false;

  @observable
  int opc=-1;

  @observable
  String data='Selecione uma data';




  @action
  setOptionId(int _opc){
    opc =_opc;
  }

  @computed
  Color get colorButton{
    return opc!=-1 && data!='Selecione uma data'?
    Color.fromRGBO(255,136,34,1):Color.fromRGBO(255,136,34,0.5);
  }

  @computed
  bool get buttonActivated{
    return opc!=-1 && data!='Selecione uma data'?
        true:false;

  }

  @action
  resetButton(){
    data='Selecione uma data';
    opc=-1;

  }

  @action
  setDataSelect(DateTime dataSel){
    String month;
    String day;

    dataSel.month<10?month = formatData(dataSel.month):month=dataSel.month.toString();
    dataSel.day<10?day = formatData(dataSel.day):day =dataSel.day.toString();

    data="$day/$month/${dataSel.year}";
  }

  String formatData(int info){
    String data;
    switch(info){
      case 10:
        data=info.toString();
        break;
      default:
        data="0$info";
        break;
    }

    return data;

  }



  @action
  clickLogic(Client clientS){
    clientsSelected.contains(clientS)?clientsSelected.remove(clientS):clientsSelected.add(clientS);
  }

  @action
  bool searchClient(Client clientS){
    return clientsSelected.contains(clientS);
  }

  @action
  stepFinish() {if(clientsSelected.length>0) stepComplete=true;}


}