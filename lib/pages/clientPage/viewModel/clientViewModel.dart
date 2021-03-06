import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:table_calendar/table_calendar.dart';

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

  //parametro usado pra muda o estado da lista ao selecionar um cliente
  @observable
  bool listReactState=false;

  @observable
  String dataCalendar='';
  ObservableList<Client>  listSearchClient=ObservableList<Client> .of([]);

  @observable
  String searchClient='';

  @observable
  ObservableList<Client> clients=[
    Client('Justine Marshall', 'images/justMask.png'),
    Client('Bairam Frootan', 'images/bairanMask.png'),
    Client('Bairam Frootan', 'images/bariran2Mask.png')

  ].asObservable();

  List<String> weekday=[
    'Segunda-feira', 'Terça-feira', 'Quarta-feira',
    'Quinta-feira', 'Sexta-feira', 'Sábado',
    'Domingo',
  ];
  List<String> month =[
    'janeiro', 'fevereiro', 'março',
    'abril', 'maio', 'junho', 'julho',
    'agosto', 'setembro', 'outubro',
    'novembro', 'dezembro'
  ];

  @action
  changeSearchClient(String value){
    searchClient=value;
    shopClientSearch();
  }

  @action
  shopClientSearch(){


    listSearchClient.clear();

    if(searchClient.isNotEmpty) {

      String _searchValue=searchClient.trim().toUpperCase();

      clients.forEach((element) {

        String name=element.name.trim().toUpperCase();

        if(name.startsWith(_searchValue)){

          listSearchClient.add(element);
        }

      });
    }

  }

  @action
  resetDataCalendar(){
    dataCalendar='';
  }
  @action
  changeDataCalendar(CalendarController cal){
    dataCalendar = weekday[cal.selectedDay.weekday-1]+
        ', ${cal.selectedDay.day} de '+month[cal.selectedDay.month-1];
  }


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

   //logica da seleção de clientes, se ele não ets na lista de selecionados
  //adiciona, se ja foi previamente selecionado remove
  @action
  clickLogic(Client clientS){
    if(clientsSelected.contains(clientS)){
      clientsSelected.remove(clientS);

    }
    else{
      clientsSelected.add(clientS);
    }

    listReactState=true;

  }


  @action
  Color cardClientColor(Client _client){
    return clientsSelected.contains (_client)?Color(0xffFF8822):Colors.white;
  }

  @action
  Color textCardColor(Client _client){
    return clientsSelected.contains (_client)?Colors.white:Colors.black;
  }


  @action
  stepFinish() {if(clientsSelected.length>0) stepComplete=true;}

  //desabilita click no card de client ao se add os clientes selecionados a lista de Clientes do fluxo de pedido
  @computed
  get disableCardClient=> stepComplete==true? false : true;

//reseta o estado da View
  @action
  resetState(){

    clientsSelected=[];
    stepComplete=false;
    opc=-1;
    data='Selecione uma data';
    listReactState=false;

  }

}