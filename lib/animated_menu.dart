import 'package:app/button_model.dart';
import 'package:app/info_card.dart';
import 'package:app/side_menu_tile.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int itemCount = data.length;
  int itemCount2 = data2.length;
  int tappedIndex = -1;
  int tappedIndex2 = -1;
  List<bool>? containerStates;
  List<bool>? containerStates2;

  @override
  void initState() {
    super.initState();
    containerStates = List<bool>.filled(itemCount, false);
    containerStates2 = List<bool>.filled(itemCount2, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xff17203a),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCard(
                  name: 'Sana AlTarabishi',
                  profession: 'student',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                  child: Text(
                    'Browse',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 200,
                  child: ListView.builder(
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        return SideMenuTile(
                          index: index,
                          press: (int tappedIndex) {
                            setState(() {
                              if (this.tappedIndex == tappedIndex) {
                                // If the same container is tapped again, reset its state
                                this.tappedIndex = -1;
                              } else {
                                // Reset the state of the previously tapped container
                                if (this.tappedIndex != -1) {
                                  containerStates![this.tappedIndex] = false;
                                }
                                // Update the state of the newly tapped container
                                this.tappedIndex = tappedIndex;
                                containerStates![tappedIndex] = true;
                              }
                            });
                          },
                          data: data[index],
                          isActive: tappedIndex == index,
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                  child: Text(
                    'HISTORY',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 200,
                  child: ListView.builder(
                      itemCount: itemCount2,
                      itemBuilder: (context, ind) {
                        return SideMenuTile(
                          index: ind,
                          press: (int tappedIndex2) {
                            setState(() {
                              if (this.tappedIndex2 == tappedIndex2) {
                                // If the same container is tapped again, reset its state
                                this.tappedIndex2 = -1;
                              } else {
                                // Reset the state of the previously tapped container
                                if (this.tappedIndex2 != -1) {
                                  containerStates2![this.tappedIndex2] = false;
                                }
                                // Update the state of the newly tapped container
                                this.tappedIndex2 = tappedIndex2;
                                containerStates2![tappedIndex2] = true;
                              }
                            });
                          },
                          data: data2[ind],
                          isActive: tappedIndex2 == ind,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
