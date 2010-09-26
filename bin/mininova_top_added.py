#!/usr/bin/python
from __future__ import with_statement
from time import strftime, gmtime, time
import re
import sys
import urllib2
from BeautifulSoup import BeautifulSoup

skip_genres = ['Hip Hop', 'Trance / House / Dance', 'Rap', 'Drum N Bass', 'Metal', 'R&amp;B', 'Anime']

base_url = "http://www.mininova.org"

categories = [4,5] # video, music
categories = {4:500, 5:100} # video, music

last_added_url = base_url + "/cat-list/%s/added"

date_get = strftime("%d&nbsp;%b&nbsp;%y", gmtime(time() - 86400))
date_get = strftime("%d&nbsp;%b&nbsp;%y", gmtime(time() - 172800))
date_prev = strftime("%d&nbsp;%b&nbsp;%y", gmtime(time() - 86400*2))
date_prev = strftime("%d&nbsp;%b&nbsp;%y", gmtime(time() - 172800*2))
# date_now = "29&nbsp;Mar&nbsp;08"

def find_rating(category, minimum=100, pages=15):
    result = []

    for i in range(1, pages):
        page = urllib2.urlopen((last_added_url % category) + "/" + str(i))
        soup = BeautifulSoup(page)

        for span in soup.findAll('span', attrs={"class":'g'}):
            torrent_date = span.parent.parent.find('td').string

            if int(span.contents[0]) > minimum and torrent_date == date_get:
                result.append(span.parent.parent)

        date_last = soup.findAll('a', attrs={"class":'dl'})[-1].parent.previous

        if date_prev == date_last:
            return result

fname = sys.argv[1] + "/mininova_" + strftime("%d_%m_%Y", gmtime(time() - 86400)) + ".html"

potential = []

for cat, min in categories.items():
    potential.extend(find_rating(cat, min))

with open(fname, "w") as f:
    if potential:
        f.write("<html><body><table>")
        for tr in potential:
            if tr.strong.a.contents[0] not in skip_genres:
                link = tr.find(href = re.compile('/tor/'))
                href = link['href']
                descr = link.contents[0]

                f.write("<tr><td>" + tr.strong.a.contents[0] + "</td>")
                f.write("<td><a href='" + base_url + href + "'>" + descr + "</a></td></tr>")
        f.write("</table></body></html>")
    else:
        f.write("No results for today")
