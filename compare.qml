//=============================================================================
//  MuseScore
//  Music Composition & Notation
//
//  Copyright (C) 2012 Werner Schweer
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License version 2
//  as published by the Free Software Foundation and appearing in
//  the file LICENCE.GPL
//=============================================================================

import QtQuick 2.0
import MuseScore 1.0

MuseScore {
      version:  "1.0"
      description: "This test plugin compares the elements between two tracks"
      menuPath: "Plugins.Walk"
      
      
      onRun: {
            console.log("Hello Walker");
            var list = new Array;
            if (typeof curScore === 'undefined')
                  Qt.quit();

            for (var track = 0; track < curScore.ntracks; ++track) {
                  if (track == 0)
                  {
                        var segment = curScore.firstSegment();
                        while (segment)
                        {
                              var element = segment.elementAt(track);
                              if (element)
                              {
                                    var type = element.type;
	                            console.log(element.userName());
                                    if (element.userName() == "Chord")
                                    {
                                          console.log(element.notes[0].pitch);
                                          list.push(element.notes[0].pitch);
                                    }
                              }
                        segment = segment.next;
                        }
                  }
                  else
                  {
                        var i = 0;
                        var segment = curScore.firstSegment();
                        while (segment) {
                              var element = segment.elementAt(track);
                              if (element) {
                                    var type = element.type;
	                            console.log(element.userName());
                                    if (element.userName() == "Chord")
                                    {
                                          console.log(element.notes[0].pitch);
                                          if (element.notes[0].pitch == list[i])
                                          {
                                                console.log("true");
                                          }
                                          else
                                          {
                                                console.log("false");     
                                          }
                                          i++;
                                    }
                              }
                        segment = segment.next;
                        }
                        
                  }
            }
            Qt.quit();
            }
      }
