import 'dart:async';
import 'package:app/Services/User.dart';
import 'package:app/Services/auth.dart';
import 'package:app/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:app/sidebar/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app/main.dart';
import 'package:app/Services/database.dart';
import 'package:provider/provider.dart';
class SideBar extends StatefulWidget  {

  @override
  _SidebarState createState() => _SidebarState();

}





  class _SidebarState  extends State<SideBar>  with SingleTickerProviderStateMixin<SideBar>  {
  AnimationController _animationController;
  StreamController<bool> isTappedStreamController;
  Stream<bool> isTappedStream;
  StreamSink<bool> isTappedStreamSink;
  final _animationDuration = const Duration(milliseconds: 500);
  static String get mail => mail;



  @override
  void initState()  {
    super.initState();
    _animationController=AnimationController( vsync: this,duration: _animationDuration);
    isTappedStreamController=PublishSubject<bool>();
    isTappedStream=isTappedStreamController.stream;
    isTappedStreamSink=isTappedStreamController.sink;

  }

  @override
  void dispose() {
    _animationController.dispose();
    isTappedStreamController.close();
    isTappedStreamSink.close();
    super.dispose();
  }
  void OnIconPressed(){
    final animationStatus = _animationController.status;
    final isanimationCompleted=animationStatus== AnimationStatus.completed;
    if(isanimationCompleted)
      { isTappedStreamSink.add(false);
        _animationController.reverse();
      }
    else
      {isTappedStreamSink.add(true);
        _animationController.forward();
      }

  }
  @override
  Widget build(BuildContext context)  {


    final ScreenWidth=MediaQuery.of(context).size.width;
    final AuthService _auth = AuthService();
    final user=Provider.of<User>(context);
   



  return  StreamBuilder<bool > (
  initialData: false,
      stream:  isTappedStream ,
      builder: (context,isSideBarOpenedAsync){




    return StreamBuilder<UserData>(
    stream: DatabaseService(uid : user.uid).userData,

      builder: (context, snapshot) {
      UserData human=snapshot.data;
      String email=human.email;
      String id=human.id;
        return AnimatedPositioned(
            duration: _animationDuration,
            top:0,
            bottom: 0,
            left:  isSideBarOpenedAsync.data ? 0 : -ScreenWidth,
            right:  isSideBarOpenedAsync.data ? 0: ScreenWidth-45 ,
            child: Row(
            children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color:  const Color(0xFF4C516D),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height : 100,
                    )
                    ,
                    ListTile(

                      title: Text("$id",
                        style: TextStyle( color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("$email",
                        style: TextStyle( color: Colors.white.withOpacity(0.2),fontSize: 20,fontWeight: FontWeight.w500),
                      ),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                        ),
                        radius: 40,
                      ),



                    ),
                    Divider(
                      height: 55,
                      thickness: 0.5,
                      color:  Colors.white.withOpacity(0.3),
                      indent:16,
                      endIndent:16,
                    ),
                    MenuItem(

                      icon:Icons.home,
                      title:"Acceuil",
                      onTap: (){
                        OnIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.FirstaPageClickEvent);
                      },
                    ),
                    MenuItem(
                        icon:Icons.shopping_basket,
                        title:"Mes demandes",
                      onTap: (){
                        OnIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.DemandespageClickEvent);
                      },
                    ),
                    MenuItem(
                        icon:Icons.person,
                        title:"Mon Compte",
                      onTap: (){
                        OnIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MoncompteClickEvent);
                      },
                    ),

                    Divider(
                      height: 55,
                      thickness: 0.5,
                      color:  Colors.white.withOpacity(0.3),
                      indent:16,
                      endIndent:16,
                    ),
                    MenuItem(
                        icon:Icons.settings,
                        title:"Parametres",
                      onTap: (){
                        OnIconPressed();
                        BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.SettingsClickEvent);
                      },
                    ),
                    MenuItem(
                        icon:Icons.exit_to_app,
                      title:"Se deconnecter",
                      onTap: () async {
                          await _auth.SignOut();

                          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext) => new MyApp()));

                         },
                    )




                ],


                ),

              ),

            ),
            Align(
            alignment:Alignment (0,-0.9),
              child: GestureDetector(
              onTap: (){
              OnIconPressed();
              },
            child: ClipPath(
              clipper: CustomMenuClipper(),
              child: Container(


              width: 35,
              height: 110 ,
              color:Color(0xFF4C516D),
                alignment: Alignment.centerLeft,
                child: AnimatedIcon(
                  progress: _animationController.view,
                  icon: AnimatedIcons.menu_close,
                  color: Color(0xFF7285A5),
                  size:25
                ),
              ),
            )
            )

            )
            ],


            )
            );
      }
    );
        },
      );
    }

  }






class CustomMenuClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Paint paint=Paint();
    paint.color=Colors.white;
    final width= size.width;
    final height=size.height;
    Path path=Path();
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2-20, width, height/2);
    path.quadraticBezierTo(width+1, height/2+20, 10, height-16);
    path.quadraticBezierTo(0, height-8,0,height);
    path.close();
    return path;


  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}