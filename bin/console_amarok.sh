#!/bin/bash
###########################################################################
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# Author: Jessy Ouellette
# Date: 2007-01-30
#
#
# This script will control Amarok from a command line.
# Only basic functions are available at the moment. I don't think I'll add
# any new features unless I personally need them. If you want anything 
# added you can do it yourself or ask me to do it. I will most likely only
# add a feature if I think I will use it. Selfish... maybe but at least I 
# am sharing this script with you.
# 
##########################################################################

DISPLAY=:0

showMenu () {
	echo "1) Play/Pause"
	echo "2) Next"
	echo "3) Previous"
	echo "4) Stop"
        echo "5) Volume Up"
        echo "6) Volume Down"
	echo "7) Mute"
	if [ $ISRANDOM == "true" ]; then
		echo "8) Turn OFF Random Mode"
	else
		echo "8) Turn ON Random Mode"
	fi
	echo "9) Search Menu"
        echo "-----------------"
        echo "q) Quit"
}

showNowPlaying () {
        echo "*******************************************"
        if [ -z "$PLAYING" ]; then
                echo "Player Stoped"
        else
                echo -n -e "Now Playing: $PLAYING\n"
        fi
        echo -e "Volume: $VOLUME%"
        #echo "Time: $CURTIME/$TOTALTIME (-$TIMEOUT)"
        echo "*******************************************"

}

showSearchMenu () {

while [ 1 ]
do

        TOTALTIME=`dcop amarok player trackTotalTime`
        CURTIME=`dcop amarok player trackCurrentTime`
        let "TIMEOUT= $TOTALTIME-$CURTIME"

        if [ $TIMEOUT == 0 ]; then
                TIMEOUT=1000
        fi

	clear

	#show what's playing
	showNowPlaying
	echo "*******************************************"
	echo "                Search Menu                "
	echo "*******************************************"
	echo "Search by:"
	echo "1) Artist"
        echo "2) Album"
        echo "3) Title"
	echo "4) Advanced"
        echo "-----------------"
        echo "q) Back"

 	# When the Read timesout we refresh what's playing
        CHOICE="refresh"
        read -n 1 -p "> " -t $TIMEOUT CHOICE
        case "$CHOICE" in
                "refresh")
                        PLAYING=`dcop amarok player nowPlaying`
                        ;;
                #Artist
                "1")
			#new line
			echo  ""
			read -p "Artist> " ARTIST
			showResults '' $ARTIST ''
                        ;;
                #Album
                "2")
                        #new line
                        echo  ""
                        read -p "Album> " ALBUM
                        showResults '' '' $ALBUM
                        ;;
                #Title
                "3")
                        #new line
                        echo  ""
                        read -p "Title> " TITLE
                        showResults $TITLE '' ''
                        ;;
                #All
                "4")
                        #new line
                        echo  ""
                        read -p "Artist> " ARTIST
			read -p "Album> " ALBUM
			read -p "Title> " TITLE
                        showResults "$TITLE" "$ARTIST" "$ALBUM"
			;;
		#Quit
                "q" | "Q")
			break
                        ;;
        esac
	
	if [ ! -z "$URL" ]; then
		break
	fi
done
}

showResults () {

#RESET the offset
OFFSET=0

while [ 1 ]
do

        TOTALTIME=`dcop amarok player trackTotalTime`
        CURTIME=`dcop amarok player trackCurrentTime`
        let "TIMEOUT= $TOTALTIME-$CURTIME"

        if [ $TIMEOUT == 0 ]; then
                TIMEOUT=1000
        fi

	QUERY="SELECT artist.name || ' - ' || album.name || ' - ' || tags.track || ' - ' || tags.title, tags.url FROM tags LEFT JOIN artist ON tags.artist = artist.id LEFT JOIN album on tags.album = album.id  WHERE tags.deviceid = '-1' AND tags.title LIKE '%$1%' AND artist.name LIKE '%$2%' AND album.name LIKE '%$3%' LIMIT 10 OFFSET $OFFSET;"
        RESULT=`dcop amarok collection query "$QUERY"`

	clear 
	showNowPlaying

	echo "*******************************************"
        echo "              Search Results               "
        echo "*******************************************"
	#Only list the song titles
	LIST=`echo "$RESULT" | awk '{ if (NR%2 && NF) print i++ ") " $0; }'`
	#get Count
	COUNT=`echo "$LIST" | wc --lines`
	NEXT="0"
	PREV="0"

	echo "$LIST"
	if [ $OFFSET -eq 0 ]; then
		if [ $COUNT -eq 10 ]; then
			echo "n) Next Page"
			NEXT="1"
		fi
	else 
		echo "p) Previous Page"
	        PREV="1"
                if [ $COUNT -eq 10 ]; then
                	echo "n) Next Page"
			NEXT="1"			
                fi
	fi
	echo "-----------------"
	echo "q) Back"

	CHOICE="refresh"
        read -n 1 -p "> " -t $TIMEOUT CHOICE
        case "$CHOICE" in
                "refresh")
                        PLAYING=`dcop amarok player nowPlaying`
                        ;;
                #Play Track
                "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")
			let "URLINDEX=($CHOICE*2)+2"
			URL=`echo "$RESULT" | awk "{ if (NR == $URLINDEX) print \\$0; }"`
			break
                        ;;
                #Next
                "n" | "N")
			if [ $NEXT = "1" ]; then
				let "OFFSET=$OFFSET+10"
			fi
                        ;;
		#Prev
                "p" | "P")
			if [ $PREV = "1" ]; then
                                let "OFFSET=$OFFSET-10"
                        fi
                        ;;
                #Back
                "q")
			URL=""
			break
			;;
	esac
done
	
}	

#URL is used for the search feature
URL=""
VOLUME=`dcop amarok player getVolume`
ISRANDOM=`dcop amarok player randomModeStatus`
PLAYING=`dcop amarok player nowPlaying`

while [ 1 ]
do

        TOTALTIME=`dcop amarok player trackTotalTime`
        CURTIME=`dcop amarok player trackCurrentTime`
        let "TIMEOUT= $TOTALTIME-$CURTIME"

	if [ $TIMEOUT == 0 ]; then
		TIMEOUT=1000
	fi

	clear

	# Lets show what's playing now
	showNowPlaying
	# Lets show the menu
	showMenu
	# When the Read timesout we refresh what's playing
	CHOICE="refresh"
	read -n 1 -p "> " -t $TIMEOUT CHOICE
	case "$CHOICE" in
		"refresh")
			PLAYING=`dcop amarok player nowPlaying`
			;;
		#Play/Pause
		"1")
			dcop amarok player playPause
			PLAYING=`dcop amarok player nowPlaying`
			;;
		#Next
		"2")
                        dcop amarok player next
			PLAYING=`dcop amarok player nowPlaying`
			;;
		#Prev
		"3")
                        dcop amarok player prev	
			PLAYING=`dcop amarok player nowPlaying`	
			;;
		#stop
                "4")
                        dcop amarok player stop
			PLAYING=`dcop amarok player nowPlaying`
                        ;;
		#Vol UP
                "5")
                        dcop amarok player volumeUp
			VOLUME=`dcop amarok player getVolume`
                        ;;
		#Vol Down
                "6")
                        dcop amarok player volumeDown
			VOLUME=`dcop amarok player getVolume`
                        ;;
		#Mute
                "7")
                        dcop amarok player mute
			VOLUME=`dcop amarok player getVolume`
                        ;;
		#Toggle Random
                "8")
                        if [ $ISRANDOM == "true" ]; then
                		dcop amarok player enableRandomMode false
		        else
		                dcop amarok player enableRandomMode true
		        fi
			ISRANDOM=`dcop amarok player randomModeStatus`
                        ;;
		#Search Menu
		"9")
			showSearchMenu
			if [ ! -z "$URL" ]; then
				PLAYURL=`echo "$URL" | awk '{ sub(/^./, ""); print }'`
				dcop amarok playlist playMedia "$PLAYURL"
				PLAYING=`dcop amarok player nowPlaying`				
			fi
			;;
		#Quit
                "q" | "Q")
			clear
                        exit
                        ;;
	esac
done

#La Fin!
#The End!
