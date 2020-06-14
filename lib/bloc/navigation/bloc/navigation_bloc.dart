import 'package:app/homepages/Settings.dart';
import 'package:app/homepages/demandes.dart';
import 'package:app/homepages/moncompte.dart';
import 'package:bloc/bloc.dart';
import 'package:app/homepages/firstpage.dart';
enum NavigationEvents {
  FirstaPageClickEvent
  ,DemandespageClickEvent
  ,MoncompteClickEvent,
  SettingsClickEvent,

}
abstract class NavigationStates{}
class NavigationBloc extends Bloc<NavigationEvents,NavigationStates>
{
  @override
  NavigationStates get initialState => Firstpage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event)
    {
      case NavigationEvents.FirstaPageClickEvent:
        yield Firstpage();
        break;
      case NavigationEvents.DemandespageClickEvent:
        yield Demandes();
        break;
      case NavigationEvents.MoncompteClickEvent:
        yield MonCompte();
        break;
      case NavigationEvents.SettingsClickEvent:
        yield Settings();
        break;
    }

  }

}