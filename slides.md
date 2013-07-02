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
new_doug = json.loads(json_doug)
```
Of course, this is not safe for everyday use.

##logging
###Start it
simple logging system

```python
logging.debug("debug message")
logging.info("info message")
logging.warning("warning message")
logging.error("error message")
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
* So I heard you like map
* What about parallel map ?

```python
def worker(number):
    #or anything
    return number**10

p = Pool(100)
p.map(worker, range(3000))
```

Work with multiprocessing (CPU bound) or threading (IO bound).

###Push it
All the boring stuff you could ever need

```python
q = Queue()
e = Event()
def wo():
    print("dead lumberjack")
p = Process(target=f)
p.start()
t = Thread(target=f)
t.start()
```

Also shared memory

```python
v = Value()
a = Array()
```
ANDMORE!

#External modules

* Sometimes the stdlib is not enough
* Or is plain bad

##requests
###Start it
* think simple

```python
url = "https://en.wikipedia.org/wiki/Monty_Python"
requests.get()
payload = {'silly-walk': ['step', 'step', 'step'
, 'quarter-turn']}

url = "http://ministry-of-silly-walk"
requests.post(url, payload)
```

* Cookie and authentication for http.
* Act a bit like a browser

```python
with request.Session() as session:
    session.get("http://google.ch")
```

###Push it
* HTTP authentication

* oauth2 authentication ? yes sir

Or twisted ?

##sh
###Start it
subprocess sucks

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

###Push it
will use 'len' to calculate the percentage, you can specify it (if you use generator for example)

```python
progress = ProgressBar()
for i in count(300):
    sleep(300)
```

You could even combine map with progressbar

even with a bouncing bar:

```python
widgets = [FormatLabel('Bouncer: value %(value)d - '), BouncingBar()]
pbar = ProgressBar(widgets=widgets)
for i in pbar((i for i in range(180))):
    time.sleep(0.05)
```

###fabric
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
you don't want to learn to write

```python
    /*[local-name() = 'root']/*[local-name() = 'elem']
```

* yes that's valid 
* let\'s replace it with beautiful soup
```python
```
* much better

###Push it
modify dom elements

##SQLAlchemy
###Start it

Imagine a one to one mapping between python object and line of sql table.
Would be great right ?
Let's do the connection first

```python
from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()
#and then
class User(Base):
     __tablename__ = 'users'

     id = Column(Integer, primary_key=True)
     name = Column(String)
     fullname = Column(String)
     password = Column(String)

     def __init__(self, name, fullname, password):
         self.name = name
         self.fullname = fullname
         self.password = password
```
###Push it
FIXME
##scapy
###Start it
* packet forging
```python
syn = TCP(flags='S')/IP(dst="example.com")
```
###Push it
* Wait and repeat after me 
```python
```

* Analyse and replay
```python
```

##Arrow
###Start it
```python
now = arrow.utcnow()
now.date
now.year
now.date
assert (now - now) = 0
```
###Push it
* humanize is great, to impress on a webapp
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

combine with sql alchemy for a simple web app framework.

```python
@route('/')
@with_db
def index(db):
    return db.select('all')
```

###Push it
Doc is 

#Push everything
https://crate.io/

###Biography

