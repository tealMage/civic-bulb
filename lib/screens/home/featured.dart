
import 'package:flutter/material.dart';
import 'package:civic_bulb/utils/responsive_layout.dart';
import 'package:civic_bulb/bloc/home/home_bloc.dart';
import 'package:civic_bulb/bloc/home/home_state.dart';
import 'package:provider/provider.dart';
import 'package:civic_bulb/models/story.dart';

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);
    return StreamBuilder<HomeState>(
        stream: bloc.stream,
        initialData: HomeBloc.defaultState,
        builder: (context, snapshot) => drawScreen(context, snapshot));
  }
}

Widget drawScreen(BuildContext context, AsyncSnapshot<HomeState> snapshot) {
  profileImage(context, double size, Story story) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ResponsiveLayout.isSmallScreen(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.height * size,
            width: ResponsiveLayout.isSmallScreen(context)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * size,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage(story.image),
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              width: ResponsiveLayout.isSmallScreen(context) ? MediaQuery.of(context).size.width * 2 : MediaQuery.of(context).size.width * size,
              child: Text(
                story.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              width: ResponsiveLayout.isSmallScreen(context) ? MediaQuery.of(context).size.width * 2 : MediaQuery.of(context).size.width * size,
              child: Text(
                story.subtitle,
                style: TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              width: ResponsiveLayout.isSmallScreen(context) ? MediaQuery.of(context).size.width * 2 : MediaQuery.of(context).size.width * size,
              child: Row(
                children: <Widget>[
                  Text(
                    "By ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    story.author,
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromRGBO(250, 91, 61, 1)),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      );

  List<Widget> getLargeStories(BuildContext context, List<Story> story) {
    var featuredStories = List<Widget>();
    for (int i = 0; i < story.length; i++) {
      if (i == 0) {
        featuredStories.add(profileImage(context, .30, story[i]));
      } else {
        featuredStories.add(profileImage(context, .25, story[i]));
      }
    }
    return featuredStories;
  }

  if (snapshot.data.story.length > 0) {
    var featured = snapshot.data.story.sublist(0, 3);

    return ResponsiveLayout(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[for (var story in getLargeStories(context, featured)) story],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          for (var story in snapshot.data.story)
          
            profileImage(context, .35, story),

        ],
      ),
    );
  } else {
    return Container();
  }
}
