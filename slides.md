%DAT python module



#stdlib
sometime good

##json



###stdtype



###logging



###subprocessing



###threading



###shalib (sometime)


###zipfile



#external module

sometimes the stdlib is not enough
or is plain bad

###requests

```python
requests.get("http://google.ch")
```

Cookie and authentication for http.
Act a bit like a browser
```python
with request.Session() as session:
    session.get("http://google.ch")
```

###sh
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

###Progressbar

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
for i in count(300)
```

even with a bouncing bar:
```python
progree
```
###fabric


ssh on steroid
you wanna do a uname :

```python
    def uname():
        run("uname -a")
```

then
```zsh
    fab uname -h boy
```

###blackmamba


you wanna write async socket connection
but twisted is too long to read (lazy ? me too)
ok
let's yield the steps then:

taken from the example, with a bit of changes

###beautifulsoup


you don't want to learn to read

```python
    ugly xpath
```

yes that's valid 
let's replace it with beautiful soup
create the soup
parse the soup
get a child
YEAH 

###sqlalchemy


sql contains alot of repetition
image of alot
imagine a one to one mapping between python classes and line of table
would be great right ?

###flask


just great

```python
@route('/')
def index():
    return 'peewee'

@route('/<id>')
def gre(id)
    return id
```

combine with sql alchemy for great greatness
