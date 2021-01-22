


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