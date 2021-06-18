import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:foxlearn/app/presentation/point_of_sale_loc/map/map_source/map_source.dart';
import 'package:foxlearn/app/presentation/widgets/lottie_loading.dart';


final typeAheadController = TextEditingController();

class SearchBarMap extends StatelessWidget {
  // final MapBloc? gMapBloc;

  SearchBarMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Container(
                  height: 85,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Theme.of(context).cardColor
                                    : Colors.grey[200]!,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 0,
                            spreadRadius: 0)
                      ],
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.transparent),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: TypeAheadFormField(
                      noItemsFoundBuilder: (_) => Container(),
                      suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      getImmediateSuggestions: false,
                      hideOnEmpty: true,
                      hideOnError: true,
                      direction: AxisDirection.down,
                      hideOnLoading: true,
                      loadingBuilder: (_) => LottieLoading(),
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: typeAheadController,
                          decoration: InputDecoration(
                              hintText: "ابحث عن نقطة بيع...",
                              contentPadding: EdgeInsets.all(7),
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                  child: Icon(
                                    Icons.close,
                                    size: 30,
                                  ),
                                  onTap: () {
                                    typeAheadController.clear();
                                    MapSource.mapBlocHelper!.filterMarkers("");
                                    // gMapBloc!.changeFilter(false);
                                  }))),
                      itemBuilder: (context, dynamic suggestion) => ListTile(
                          title: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(suggestion))),
                      suggestionsCallback: (pattern) {
                        if (typeAheadController.text.isNotEmpty)
                          return MapSource.mapBlocHelper!
                              .getSuggestions(pattern);
                        return Future.value(<String>[]);
                      },
                      transitionBuilder:
                          (context, suggestionsBox, controller) =>
                              suggestionsBox,
                      onSuggestionSelected: (dynamic suggestion) {
                        typeAheadController.text = suggestion;
                        MapSource.mapBlocHelper!.filterMarkers(suggestion);
                        MapSource.mapBlocHelper!.changeFilter(false);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ))),
        ),
      ],
    );
  }

}
