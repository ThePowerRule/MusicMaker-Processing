int n = 0; //Number of times to repeat

public void win_draw1(PApplet appc, GWinData data) {
  appc.background(0);
}

public void textfieldChanged(GTextField source, GEvent event) {
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
  n=int(textfield.getText());
  button.setText("Repeat "+n+" times.");
}//End of textfieldChanged()

public void buttonChanged(GButton source, GEvent event) {
  println("button - GButton >> GEvent." + event + " @ " + millis());
  if (event == GEvent.CLICKED) {
    //If the button is pressed, repeat the rhythm and close
    repeatNotes();
    window1.close();
    window1.forceClose();
  }
}//End of textfieldChanged()

void repeatNotes() {
  //Find the end of the rhythm
  int end = 0;
  for (Line l : lines) {
    end=max(end, max(l.start.x, l.end.x));
  }
  end+=1;
  //Copy lines
  ArrayList<Line> l = new ArrayList<Line>();
  for (Line line : lines) {
    for (int i = 0; i <= n; i ++) {
      l.add(new Line(line.start.x+i*end, line.start.y, line.end.x+i*end, line.end.y));
    }
  }
  lines = l;
}//End of repeatNotes() method

// Create all the GUI controls. 
// autogenerated do not edit
public void createRepeatGUI() {
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.GREEN_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Repeater", 0, 0, 240, 120, P2D);
  window1.noLoop();
  window1.addDrawHandler(this, "win_draw1");
  textfield = new GTextField(window1, 33, 9, 160, 30, G4P.SCROLLBARS_NONE);
  textfield.setText("16");
  textfield.setPromptText("Insert a number");
  textfield.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  textfield.setOpaque(true);
  textfield.addEventHandler(this, "textfieldChanged");
  button = new GButton(window1, 33, 64, 160, 35);
  button.setText("Type a number");
  button.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  button.addEventHandler(this, "buttonChanged");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GTextField textfield; 
GButton button; 