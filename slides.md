%DAT python module
%Malik Bougacha

* Very short presentation of modules I found great
\pause
* Because python can be very cute
\center
\includegraphics[width=10cm]{images/cute.jpg}

#stdlib
* Sometime very bad
\pause
* Sometime good
\pause
* Sometimes just awesome

##json
###Start it
Do the job, in a nice manner

```python
with open('myfile.json') as f:
    d = json.load(f)
```

```python
with open('myfile.json') as f:
    d = json.dump(f)
```

###Push it
```python
class Dog:
    def __init__(self, name):
        self.name = name

    @classmethod
    def from_json(cls, d):
        new_object = cls()
        new_object.__dict__ = d

    @property
    def json(self):
        return json.dumps(self.__dict__)

doug = Dog("doug")
json_doug = doug.json
new_doug = Dog.from_json(json_doug)
```

##logging
###Start it
simple logging system

```python
logging.log("just a log")

logging.debug("debug message")
logging.info("info message")
logging.warning("warning message")
logging.error("error message")
logging.critical("critical message")
```

You can also set the logging level very simply 

```python
root_logger = logging.getLogger()
root_logger.setLevel(logging.DEBUG)
```

###Push it
* multiple logger 
    * one per class
    * one per module

* multiple output 
    * plain text
    * json
        ```python
        ```
    * yaml
    * Syslog

    ```python
        handler = logging.handlers.SysLogHandler(address 
= '/dev/log')
        root_logger = logging.getLogger()
        root_logger.addHandler(handler)
    ```
    * WHATEVERYOUMAYWANT

##threading/subprocessing
###Start it
Work with multiprocessing (CPU bound) or threading (IO bound).
All the boring stuff you could ever need

```python
#either from multiprocessing or threading
q = Queue()
e = Event()
def wo():
    print("dead lumberjack")
p = Process(target=wo)
p.start()
t = Thread(target=wo)
t.start()
```

Also shared memory

```python
v = Value()
a = Array()
```

###Push it
I heard you like to map stuff, you can do that with a thread or a process pool.

```python
def worker(number):
    #or anything
    return number**10

p = Pool(100)
p.map(worker, range(3000))
```


#External modules

* Sometimes the stdlib is not enough
* Or is plain bad

##requests
###Start it
* think simple

```python
url = "https://en.wikipedia.org/wiki/Monty_Python"
requests.get(url)
payload = {'silly-walk': ['step', 'step', 'step'
, 'quarter-turn']}

url = "http://ministry-of-silly-walk"
requests.post(url, payload)
```


###Push it
* Cookie and authentication for http.
* Act a bit like a browser

```python
with requests.Session() as session:
    session.get("http://google.ch")
    #who would like a cookie jar
    #http://docs.python.org/2/library/cookielib.html
    session.cookies
```

* HTTP authentication

* oauth2 authentication ? yes sir
https://github.com/maraujop/requests-oauth

##sh
###Start it
Let's clone a git depot:

```python
from sh import git
git.clone("https://github.com/rg3/youtube-dl.git")
```

with capture of stdout

```python
from sh import ps
process = ps('-aux')
print(process)
```

###Push it

Piping two commands is easy to

```python
from sh import sort, du
sort(du(-h), '-h')
```

Passing string as stdin

```python
sort(_in='\n'.join(["the", "big", "black", "cat"]))
```

##Progressbar
###Start it
imagine you have

```python
for i in range(30000):
    longactios(i)
```
you wanna give that to someone but there is no way to know where the action is ?
we need a bar

```python
progress = ProgressBar()
for i in progress(range(30000)):
    longactios(i)
```

will use 'len' to calculate the percentage, you can specify it (if you use generator for example)

```python
progress = ProgressBar()
for i in count(300):
    sleep(300)
```

###Push it

You could even combine map with progressbar.

```python

```

even with a bouncing bar:

```python
widgets = [FormatLabel('Bouncer: value %(value)d - '), BouncingBar()]
pbar = ProgressBar(widgets=widgets)
for i in pbar((i for i in range(180))):
    time.sleep(0.05)
```

##fabric
###Start it
ssh on lamas steroid.
you wanna do a uname :

```python
    def uname():
        run("uname -a")
```

then

```sh
    fab uname -h boy
```

###Push it
you can define role, that are bunch of server on which to apply rule
```python

```

pretty simple to use with vagrant 
```python
def prod():
def vagrant():
```

for test

```sh
fab vagrant deploy
```

```sh
fab prod deploy
```

##Blackmamba
###Start it

* Write async socket connection
* Twisted is too long to read
* Yield the steps then:

```python
def request(host, port):
    yield blackmamba.connect(host, port)
    yield blackmamba.reset()
request("http://google.ch", 80)
```
###Push it 
let's generate 3000 request to a given host

```python
def request(host, port):
    yield blackmamba.connect(host, port)
    yield blackmamba.reset()
blackmamba.run(request("http://google.ch", 80))
```

##Beautifulsoup
###Start it
* Get all the link in a page

```python
for a_tag in soup.findAll(a):
    print a_tag
```

* Go trough the children

```python
a.span.div.div
```

* extract text 

```python
a.text
```

###Push it
modify dom content

```python
dom.text = "Ich bin ein berliner"
```

add a subtree

```python
dom.add()
```

##SQLAlchemy
###Start it

Imagine a one to one mapping between python object and line of sql table.
Would be great right ?
Let's do the connection first

```python
from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()
```
###and then

```python
from sqlalchemy import Column, String
class User(Base):
     __tablename__ = 'users'

     id = Column(Integer, primary_key=True)
     name = Column(String)
     fullname = Column(String)
     password = Column(String(50))
     salt = Column(String(10))

     def __init__(self, name, fullname, password):
         self.name = name
         self.fullname = fullname
         self.password = password
```
very simple example

```python
#link to the db
engine = create_engine('sqlite:///sqlalchemy_example.db')
#create the column
Base.metadata.create_all(engine)
```

###Push it
* Query
```python
session = sessionmaker(bind=engine)()
session.add(User("john", "waterson", "1234"))
session.query(User).filter_by(name="leet_admin").first()
session.query(User).all()

User.query.filter_by(username="leet_admin").first()
```

* One to one relation
```python
```

##scapy
###Start it
* packet forging

```python
#syn flood 101
syn = TCP(flags='S', dport=80)/IP(ttls=99, dst="192.168.1.1")
#send the packet (this won't hurt anyone)
ans,unans=srloop(p,inter=0.3,retry=2,timeout=4)
print(ans.summary)
print(unans.summary)
```

* packet generation with range of parameters

```python
syn = TCP(flags='S', dport=range(800))/IP(ttls=99, dst="192.168.1.1")
```

###Push it
* Analyse and replay

```python
packets = rdpcap("IECache.pcap")
#then you can use python
for p in packets:
    #discard the first 4 bytes
    f.write(p.load[4:])
```


* traceroute

```python
ans,unans=traceroute(['google.com'])
ans.graph()
```

###Dat traceroute
\includegraphics[height=6cm]{images/route.png}

##Arrow
###Start it
* Start from now
```python
now = arrow.utcnow()
now.date
now.year
now.date
assert (now - now) = 0
```

* Or another day
```python
```

###Push it
* humanize is great, to have a relative human readable date

```python
```
##Flask
###
* Light webframework

```python
@route('/')
def index():
    return 'peewee'

@route('/<id>')
def gre(id)
    return id
```


###Push it
* Take parameter from the url

```python
@route('/<int:pin_id>/<int:state>')
def index(pin_id, state):
    gpio("write", pin_id, state)
```

*pass a db hook

```python
@route("/")
@with_db
```

###Push everything
https://crate.io/

###Biography

####json
http://docs.python.org/3/library/json.html

####logging
http://docs.python.org/3/library/logging.html

####threading
http://docs.python.org/3/library/threading.html

####subprocessing
http://docs.python.org/3/library/multiprocessing.html

####requests
http://docs.python-requests.org/en/latest/

###Biography2

####sh
http://amoffat.github.io/sh/

####Progressbar
https://code.google.com/p/python-progressbar/

####fabric
http://docs.fabfile.org/en/1.6/

####Blackmamba
http://rootfoo.org/blackmamb

###Biography3

####Beautifulsoup
http://www.crummy.com/software/BeautifulSoup/

####SQLAlchemy
http://docs.sqlalchemy.org/en/rel_0_8/

####scapy
http://www.secdev.org/projects/scapy/

####Arrow
http://crsmithdev.com/arrow/

####Flask
http://flask.pocoo.org/
