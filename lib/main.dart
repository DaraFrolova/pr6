import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'screen_2',
          builder: (BuildContext context, GoRouterState state) {
            return const Screen_2();
          },),
        GoRoute(
          path: 'screen_3',
          builder: (BuildContext context, GoRouterState state) {
            return const Screen_3();
          },),
        GoRoute(
          path: 'screen_4',
          builder: (BuildContext context, GoRouterState state) {
            return const Screen_4();
          },
	      routes: <RouteBase>[
        	GoRoute(
	          path: 'screen_5',
	          builder: (BuildContext context, GoRouterState state) {
	            return const Screen_5();
          },),],
	),
      ],
    ),
  ],
);


                           
void main() {

runApp(const MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

}





class MainScreen extends StatelessWidget {

  const MainScreen({super.key});

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('Главное окно')),

      body: new Column( children: [ 
        Container ( color: Colors.white,   height:40,
          child: 
        new Text( ' Практической работе №6 ', style: TextStyle(fontSize: 30, color: Colors.indigo) )),

        Container ( color: Colors.cyan,   height:350,

	child: Center(child: Column(children: [




        new Text('  '),
        new Text('Переход  на окно №2 через маршрутную навигацию  ', style: TextStyle(fontSize: 14, color: Colors.white)),
        ElevatedButton(onPressed: () => context.go('/screen_2'), child: Text('Открыть второе окно',style: TextStyle(fontSize: 24, color: Colors.indigo) )),
        new Text('Переход  на  окно №3 через метод push ', style: TextStyle(fontSize: 14, color: Colors.white)),
        ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_3()));}, child: Text('Открыть третье окно',style: TextStyle(fontSize: 24, color: Colors.red) )),
        new Text('Переход  на  окно №4 через метод push ', style: TextStyle(fontSize: 14, color: Colors.white)),
        ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen_4()));}, child: Text('Открыть четвертое окно',style: TextStyle(fontSize: 24, color: Colors.green) ))

      ],)),)]

    )
    );

  }

}


class Screen_2 extends StatelessWidget {

  const Screen_2({super.key});

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('Второе окно',style: TextStyle(fontSize: 20, color: Colors.indigo))),

      body: Center(child:  new Column(

        children: [
          new Text('Для переключения между окнами или виджетами нужно использовать Navigator. Navigator – виджет-класс, позволяющий управлять стеком дочерних виджетов, т.е. открывать, закрывать и переключать окна или страницы. Когда мы используем MaterialApp, то экземпляр класса Navigator уже создан.', style: TextStyle(fontSize: 20, color: Colors.indigo)),
	  new Image.network("https://flutter.su/data/f8f8cabc67a5a9642134a5fdb3a55a45.png?w=150", width: 150.0, height: 150.0,),
   ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('Назад',style: TextStyle(fontSize: 32, color: Colors.indigo)))
   ])),
    
    );

  }

}



class Screen_3 extends StatelessWidget {

  const Screen_3({super.key});

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('Третье окно',style: TextStyle(fontSize: 20, color: Colors.red))),

      body: Center(child:  new Column(

        children: [
	  new Image.asset("image/i1.png"),
          new Text('  '),
          new Text('Переход  на окно №5 через маршрутную навигацию  ', style: TextStyle(fontSize: 14, color: Colors.indigo)),
          new Text('маршрут /screen_4/screen_5 ', style: TextStyle(fontSize: 14, color: Colors.indigo)),
          ElevatedButton(onPressed: () => context.go('/screen_4/screen_5'), child: Text('Открыть пятое окно',style: TextStyle(fontSize: 24, color: Colors.purpleAccent) )),
          new Text('  '),
	  ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('Назад',style: TextStyle(fontSize: 32, color: Colors.red)))
   ])),
    
    );

  }

}



class Screen_4 extends StatelessWidget {

  const Screen_4 ({super.key});

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('Четвертое окно',style: TextStyle(fontSize: 20, color: Colors.blue))),

      body: Center(child:  new Column(

        children: [
          new Text(' Еще одно окно ', style: TextStyle(fontSize: 24, color: Colors.green)),
          new Text('  '),
          new Text('Переход  на  окно №5 через метод ', style: TextStyle(fontSize: 14, color: Colors.indigo)),
          new Text('pushReplacement(горизонтальная навигация) ', style: TextStyle(fontSize: 14, color: Colors.indigo)),
          ElevatedButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Screen_5()));}, child: Text('Открыть пятое окно',style: TextStyle(fontSize: 24, color: Colors.purpleAccent) )),
          new Text('Переход  на окно №2 через маршрутную навигацию  ', style: TextStyle(fontSize: 14, color: Colors.indigo)),
          ElevatedButton(onPressed: () => context.go('/screen_2'), child: Text('Открыть второе окно',style: TextStyle(fontSize: 24, color: Colors.indigo) )),
          new Text('  '),
	  ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('Назад',style: TextStyle(fontSize: 32, color: Colors.green)))
   ])),
    
    );

  }

}




class Screen_5 extends StatelessWidget {

  const Screen_5 ({super.key});

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('Пятое окно',style: TextStyle(fontSize: 20, color: Colors.purpleAccent))),

      body: Center(child:  new Column(

        children: [
          new Text('Переход  на  окно №2 через метод) ', style: TextStyle(fontSize: 14, color: Colors.indigo)),
          new Text('pushReplacement(горизонтальная навигация) ', style: TextStyle(fontSize: 14, color: Colors.indigo)),
          ElevatedButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Screen_2()));}, child: Text('Открыть второе окно',style: TextStyle(fontSize: 24, color: Colors.indigo) )),
          new Text('Переход  на окно №2 через маршрутную навигацию', style: TextStyle(fontSize: 14, color: Colors.indigo)),
          ElevatedButton(onPressed: () => context.go('/screen_2'), child: Text('Открыть второе окно',style: TextStyle(fontSize: 24, color: Colors.indigo) )),
          new Text('  '),
	  ElevatedButton(onPressed: (){ Navigator.pop(context);}, child: Text('Назад',style: TextStyle(fontSize: 32, color: Colors.green)))
   ])),
    
    );

  }

}


