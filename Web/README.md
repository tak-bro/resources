# [Web Developer RoadMap - 2017](https://github.com/kamranahmedse/developer-roadmap)


## Instroduction
![Introduction](introduction.png)
-------

### [git](https://git-scm.com)
- 프로그램 등의 소스 코드 관리를 위한 분산 버전 관리 시스템. 리누스 토발즈가 리눅스 커널 개발에 사용하려고 개발
- [github](https://github.com/): 분산 버전 관리 툴인 깃(Git)을 사용하는 프로젝트를 지원하는 웹호스팅 서비스. 루비 온 레일스로 작성되었다.
- [git 간편 안내서](https://rogerdudler.github.io/git-guide/index.ko.html)

------
### [SSH](https://www.ssh.com/)
- Secure Shell, or SSH, is a cryptographic (encrypted) network protocol to allow remote login and other network services to operate securely over an unsecured network.
- How to use in Linux
    ```bash
    # ssh 접속
    $ ssh user@127.0.0.1 
    ```
- ssh는 패스워드를 필요로 하기 때문에 공개키/비밀키 기반으로 인증한다.
    ```bash
    $ cd ~/.ssh # 보통 이 폴더에 아래 파일들이 있다.
    $ ls -al 
    drwx------   8 jdm  jdm   272 10 22 14:04 .
    drwxr-xr-x+ 33 jdm  jdm  1122 10 27 11:35 ..
    -rw-------   1 jdm  jdm  3247  9  2 12:50 id_rsa
    -rw-r--r--   1 jdm  jdm   749  9  2 12:50 id_rsa.pub
    -rw-r--r--   1 jdm  jdm   749  9  2 12:50 authorized_keys
    ```
    - id_rsa.pub: ```ssh-keygen``` 이라는 커맨드로 만들어짐. **공개키**
    - id_rsa: ```ssh-keygen``` 이라는 커맨드로 만들어짐. **비밀키**
    - authorized_keys: 현재 자신의 호스트에서 신뢰 할 수 있는 호스트들의 공개키들을 저장한다. 다른 호스트에서 만든 공개키를 그대로 파일 내부에 복사해 넣으면 비밀번호 없이 해당 호스트로 접근이 가능하다.
    > e.g. A호스트에서 B호스트로 접근할 때, A호스트의 공개키를 B호스트의 authorized_keys 파일에 넣으면 비밀번호 없이 접근할 수 있다.
------

### HTTP/HTTPs and APIS
#### [HTTP(HyperText Transfer Protocol)](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol)
- HTTP는 클라이언트와 서버 사이에 이루어지는 요청/응답(request/response) 프로토콜이다. 
- 예를 들면, 클라이언트인 웹 브라우저가 HTTP를 통하여 서버로부터 웹페이지나 그림 정보를 요청하면, 서버는 이 요청에 응답하여 필요한 정보를 해당 사용자에게 전달하게 된다.
- TCP와 UDP를 사용하며, **80**번 포트를 사용한다.
- 요청 메소드
    - **GET**: URL에 해당하는 자료의 전송을 요청한다.
    - **HEAD**: GET과 같은 요청이지만, 자료에 대한 정보(meta-information)만을 받는다.
    - **POST**: 서버가 처리할 수 있는 자료를 보낸다.
    - **PUT**: 해당 URL에 자료를 저장한다.
    - **DELETE**: 해당 URL의 자료를 삭제한다.
    - **TRACE**: 이전에 요청한 내용을 들을 것을 요청한다.
    - **OPTIONS**: 서버가 특정 URL에 대해 어떠한 HTTP Method를 지원하는지 묻는다.
    - **CONNECT**: 프록시가 사용하는 요청.
    - **PATCH**: 리소스에 대한 부분적인 수정을 적용한다.  
- 응답 코드: 클라이언트가 서버에 접속하여 어떠한 요청을 하면, 서버는 세 자리 수로 된 응답 코드와 함께 응답한다.
    - 1XX: Informational(정보) - 정보 교환.
    - 2XX: Success(성공) - 데이터 전송이 성공적으로 이루어졌거나, 이해되었거나, 수락되었음.
    - 3XX: Redirection - 자료의 위치가 바뀌었음.
    - 4XX: Client Error - 클라이언트 측의 오류. 주소를 잘못 입력하였거나 요청이 잘못 되었음.
    - 5XX: Server Error - 서버 측의 오류로 올바른 요청을 처리할 수 없음.

#### [HTTS(Hypertext Transfer Protocol over Secure Socket Layer)](https://ko.wikipedia.org/wiki/HTTPS)
- 월드 와이드 웹 통신 프로토콜인 HTTP의 보안이 강화된 버전이다.
- HTTPS는 소켓 통신에서 일반 텍스트를 이용하는 대신에, [SSL](https://ko.wikipedia.org/wiki/SSL)이나 [TLS](https://ko.wikipedia.org/wiki/%EC%A0%84%EC%86%A1_%EA%B3%84%EC%B8%B5_%EB%B3%B4%EC%95%88) 프로토콜을 통해 세션 데이터를 암호화한다. 
- HTTPS의 기본 TCP/IP 포트는 **443**이다.
- 'http://'대신 'https://'로 시작한다.
---------

### Basic Terminal Usage
![Terminal Usage](linuxUsage.jpg)
--------

### Character Encodings
- 인코딩은 문자나 기호들의 집합을 컴퓨터에서 저장하거나 통신에 사용할 목적으로 부호화하는 방법을 가리킨다.
- 문자 인코딩을 통해 부호화되어, 복호화하면 본래의 문자나 기호를 뜻하게 되는 부호를 character code라고 한다.
- 알려진 문자 인코딩
    - ASCII(American Standard Code for Information Interchange)
        - 영문 알파벳을 사용하는 대표적인 문자 인코딩이다.
        - [EUC-KR](https://ko.wikipedia.org/wiki/EUC-KR): ANSI를 한국에서 확장한 것이다. 
            - CP949는 EUC-KR의 확장이며, 하위 호환성이 있다.
    - UNICODE: 문자열을 숫자로 표현하기 위하여, 문자 하나와 숫자 하나를 각각 매핑한 개념(인코딩 아님)
        - [UTF-8](https://ko.wikipedia.org/wiki/UTF-8): UTF-8은 유니코드 인코딩 중에 하나로, 문자열을 8-bit 기반으로 저장한다. 
        - [UTF-16](https://ko.wikipedia.org/wiki/UTF-16): UTF-16은 16-bit 기반으로 문자열을 저장한다.
- 현재는 웹에서 UTF-8를 기본으로 사용하고 있어서 웬만한 한글 사이트를 만드는 경우에는 인코딩을 EUC-KR로 설정해야 한다.

-------
### Learn to Research
### Datastrucures & Algorithms

------------

## Back-end
![back-end](back-end.png)

------------

### Languages and frameworks
#### C#(.Net)
#### Java(Grails, Spring, Play)
#### Go
#### PHP 7
#### Ruby
- Package Manager
    - [RubyGems](https://rubygems.org/): easily download, install, and use ruby software packages
- Testing
    - [RSpec](http://rspec.info/): Provides a behaviour driven development framework for the language, allowing to write application scenarios and test them.
- Framework
    - [Ruby on Rails](http://rubyonrails.org/): 루비로 작성된 MVC 패턴을 이용하는 오픈 소스 웹 프레임워크이다. 줄여서 레일즈라 불리기도 한다.
    - [Sinatra](http://www.sinatrarb.com/): Classy web-development dressed in a DSL
- Debug
    - [Byebug](https://github.com/deivid-rodriguez/byebug): a simple to use, feature rich debugger for Ruby 2

#### Python
- Package Manager
    - [Pip](https://pypi.python.org/pypi/pip): The PyPA recommended tool for installing Python packages.
- Testing
    - [PyUnit](http://pyunit.sourceforge.net/): the standard unit testing framework for Python
    - [pytest](https://docs.pytest.org/en/latest/): a mature full-featured Python testing tool
    - [doctest](https://ko.wikipedia.org/wiki/Doctest): 파이썬 언어의 표준 라이브러리로 표준 파이썬 인터프리터 셸 입출력을 주석문자열에 복사 첨부함으로부써 간단하게 프로그램 테스트를 적용시킬 수 있게 해준다.
- Sync Framework
    - [Django](https://www.djangoproject.com/): a high-level Python Web framework that encourages rapid development and clean, pragmatic design
    - [Flask](http://flask.pocoo.org/): a microframework for Python based on Werkzeug, Jinja 2 and good intentions
    - [Pyramid](https://trypyramid.com/): a small, fast, down-to-earth, open source Python web framework
- Async Framework
    - [aiohttp](https://github.com/aio-libs/aiohttp): Async http client/server framework (asyncio)
    - [gevent](https://github.com/gevent/gevent): Coroutine-based concurrency library for Python
    - [Tornado](https://github.com/tornadoweb/tornado): a Python web framework and asynchronous networking library, originally developed at FriendFeed.

#### Node.js
- Pacakge Manager
    - [npm](https://www.npmjs.com/): the package manager for JavaScript and the world's largest software registry
    - [yarn](https://yarnpkg.com/en/): Fast, reliable, and secure dependency management
- Testing 
    - [Mocha](https://mochajs.org/): the fun, simple, flexible JavaScript test framework
    - [Jest](https://facebook.github.io/jest/): used by Facebook to test all JavaScript code including React applications
    - [Chai](http://chaijs.com/): a BDD / TDD assertion library for [node](http://nodejs.org) and the browser that can be delightfully paired with any javascript testing framework
    - [Jasmine](https://jasmine.github.io/): Behavior-driven development framework for testing JavaScript code
    - [should.js](http://shouldjs.github.io/): BDD style assertions for node.js
- Framework
    - [Express](https://expressjs.com/): Fast, unopinionated, minimalist web framework for node
    - [hapi](https://hapijs.com/): A rich framework for building applications and services
    - [Koa](http://koajs.com/): a new web framework designed by the team behind Express, which aims to be a smaller, more expressive, and more robust foundation for web applications and APIs
    - [Sails.js](http://sailsjs.com/): Realtime MVC Framework for Node.js

---------------


### Web Server


### RESTful APIs
#### NginX
#### Apache
#### Caddy

----------

### Read about MVC

### Authentication
#### JWT(JSON Web Token)
#### OAuth 2.0

-----------

### SOLID, YAGNI, KISS etc

------------

### Regular Expressions

------------

### Security

-----------

### Docker

-----------

### GraphQL

---------

### Storage

#### Caching
##### Memcached
##### Redis

#### Relational Databases
##### MySQL
##### MariaDB
##### PostgreSQL
##### MSSQL
##### Oracle


#### NoSQL Databases
##### Redis
##### MongoDB
##### Cassandra
##### RethinkDB
##### Couchbase


-------------






















## Front-end
![front-end](front-end.png)

-----------

## DevOps
![DevOps](devops.png)

-----------