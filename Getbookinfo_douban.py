from http import client
import json
from urllib import request
import sys

par1=sys.argv[1]

httpresp=request.urlopen('https://api.douban.com/v2/book/isbn/'+par1)
jsonbyte=httpresp.read()
jsonstr=jsonbyte.decode("utf-8")
jsonobj=json.loads(jsonstr)
author=jsonobj['author'][0]
isbn=jsonobj['isbn13']
bookname=jsonobj['title']
_pubdate=jsonobj['pubdate']
#print(_pubdate)
pubdate=_pubdate[:4]
if len(_pubdate)<=6 or _pubdate[6]=='-':
    pubdate=pubdate+'0'+_pubdate[5:6]
else:
    pubdate=pubdate+pubdate[5:7]
s=author+'_'+isbn+'_'+bookname+'_'+pubdate
print(s)
print("Check http://book.douban.com/isbn/{0}/ for serial information.".format(par1))

