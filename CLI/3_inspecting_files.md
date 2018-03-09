# 3.Inspecting files - 파일 검사

* 파일을 생성, 조작하는 법을 배웠으니, 이번에는 어떻게 파일의 내용을 검사하는지 배워보자
* 이번 챕터는 파일 컨텐츠가 너무 길어 한 화면안에 안나올 때 더욱 중요하다. (`cat`)



## 3.1 Downloding a file (through `curl -O`)

* 실제로 내용물이 긴 파일을 사용하기 위해, 직접 입력하기보다는, 인터넷에서 다운로드 받아보도록 하자.
* 물론 Command Line Interface를 통해서.
* 사용할 명령어는 `curl` 이다. 현재 자신의  OS 에 `curl` 프로그램이 설치되어 있나 `which` 명령어를 통해 확인해 보자.
* 사용법은 `which` 이후에 찾고싶은 프로그램 이름을 사용하면 된다.

``` shell
$ which curl
/usr/bin/curl
```

* 현재 Mac 에서는 다음과 같이 나오지만, 시스템마다 다를 수 있다. 만약 아무것도 출력되지 않거나 `not found` 라고 나오면, `curl` 을 설치해야 한다.
* Google 에 **install curl <사용중인 OS>** 라고 검색하여 방법을 찾아 설치하도록 하자

---

* `curl` 이 설치되었다면, 파일을 다운로드 받아보도록 하자.

```shell
$ curl -OL cdn.learnenough.com/sonnet.txt
$ ls -rtl
```

* Option 으로 대문자 `O` 와 `L` 이 있다. (자세한건  `man curl` 참조)
* `ls -rtl` 명령을 통해서 맨 마지막에 `sonnet.txt` 가 잘 추가되었는지 확인하자.
* `sonnet.txt` 는 총 2620 줄로, `cat` 명령어로 확인하기에는 너무 길다. 
* 남은 부분은 이 2620 줄의 txt 파일을 검사해 보는 것으로 채워질 예정이다.

---

### Exercise

1. 다음을 차례대로 해보자.
   1. `$ curl -I https://www.learnenough.com/`을 통해 *HTTP 헤더(header)*만 가져와 보자. (`-I` 옵션 : Header만 가져오는 옵션)
   2. 이번에는 `learnenough.com` 만 헤더정보를 가져와 보자.
   3. 둘의 [HTTP status code](https://ko.wikipedia.org/wiki/HTTP_%EC%83%81%ED%83%9C_%EC%BD%94%EB%93%9C)가 어떻게 다른가? 각 코드는 무엇을 의미하는지 검색해 보자.
2. `ls` 명령어를 활용하여 `sonnets.txt` 가 있는지 확인하고, 용량이 몇 byte 인지 확인해 보자. (long format을 활용하자)
3. 2번에서 확인한  용량은 byte로 확인하기에는 너무 크다. 좀더 편하게 확인하기 위해 kb(kilobyte) 로 환산해보자. (보통 1000 byte 를 1kb 로 치지만 정확하게는 2^10 = 1024bytes = 1kb이다.) `ls -l`에서 용량을 좀더 사람이 보기 쉽게(human-readable하게) 해주는 옵션이 `-h` 이다. `-h` 옵션을 사용하여 `sonnet.txt` 가 사람이 읽기 쉬운 용량으로 얼마인지 확인해 보자.



## 3.2 Making `head`s and `tail`s of it - 머리와 꼬리만  

파일 검사에서 상호 보완적인 두가지 명령어가 `head` 와 `tail` 이다.

* `head` 는 첫 10줄을, 

```shell
$ head sonnets.txt
Shake-speare's Sonnets

I

From fairest creatures we desire increase,
That thereby beauty's Rose might never die,
But as the riper should by time decease,
His tender heir might bear his memory:
But thou contracted to thine own bright eyes,
Feed'st thy light's flame with self-substantial fuel,
```

* `tail` 은 마지막 10줄을 보여준다.

```shell
$ tail sonnets.txt
The fairest votary took up that fire
Which many legions of true hearts had warm'd;
And so the general of hot desire
Was, sleeping, by a virgin hand disarm'd.
This brand she quenched in a cool well by,
Which from Love's fire took heat perpetual,
Growing a bath and healthful remedy,
For men diseas'd; but I, my mistress' thrall,
  Came there for cure and this by that I prove,
  Love's fire heats water, water cools not love.
```

---

### Wordcount(`wc`) and pipes(`|`) - 단어 세기와 파이프(pipe)

그런데, `head` 와 `tail` 명령어가 출력하는 내용이 실제로 10줄인 것은 어떻게 알 수 있을까? 가장 간단한 방법은 손으로 세어 보는 것이지만, 그것보다는 좀 더 스마트한 방법을 사용해 보자. 바로 `wc` 명령어 이다.



* 일단 `wc` 명령어는 기본적으로 `wc <file>` 과 같이 사용하며, `<file>`전체를 분석(inspect)한다.
* `sonnets.txt` 파일을 `wc` 명령어를 통해 분석해보자.

```shell
$ wc sonnets.txt
    2620   17670   95635 sonnets.txt
```

* 3개의 숫자는 각각 몇 줄인지, 몇 단어인지, 몇 byte 인지를 의미한다. 즉 `sonnets.txt` 는
  * 2620 줄
  * 17670 단어
  * 95635 바이트 로 이루어져 있다.

---

지금까지 배운것 만으로 `$ head sonnets.txt` 의 결과물이 몇 줄, 몇 단어, 몇 byte 인지 알아 낼 수 있을까?

```shell
$ head sonnets.txt > sonnets_head.txt
$ wc sonnets_head.txt
      10      46     294 sonnets_head.txt
```

* 성공적이다. 위 방법은 당연히 `tail` 명령어에도 적용할 수 있다.
* 그런데 뭔가 불편하고, 스마트하지 않다. 굳이 새로운 파일을 만들지 않고 한번에 체크할 수는 없을까?
* 바로 Pipe (`|`) 를 사용하면 된다. (Enter 키 위의 back slash `\` 버튼을 `shift` 키와 누른다.)

---

```shell
$ head sonnets.txt | wc
      10      46     294
```

*  pipe 는 좌측 명령의 출력을 우측 명령의 입력으로 보낸다.
* 즉 `wc ` 명령 뒤에 `head sonnets.txt` 의 출력을 붙인 것이다.
* 하지만 `wc head sonnets.txt` 라고 쓸 수는 없다. 왜냐하면  `wc`명령은 뒤에 오는 단어(토큰이라 한다.)들을 각각의 파일이나 디렉토리라고 판단하기 때문.
  *  실제로 Error 출력이 `wc` 라는 명령을 처리하는데 있어  `head` 라는 파일이나 디렉토리가 없다라고 나온 이후,
  * `sonnets.txt` 의 앞 10줄(`head`)이 아닌 `sonnets.txt` 전체를 word count(`wc`) 하여 출력한다.

---

간단하게 리다이렉션(`>`) 과 파이프(`|`)를 정리해 보자면,

* 우선 지금까지 **입력 / 출력** 이라고 불렀던 것들은 정확하게 말하면 **표준 입력 스트림(standard input stream) / 표준 출력 스트림(standard output stream)** 이 정식 명칭이다.


* 리다이렉션(`>`)의 경우,
  * 리다이렉션은 **파일**과 관련이 있다.
  * `[command] > [file]` 일 경우 명령의 출력을 파일의 입력으로 보내 저장한다.
  * `[command] < [file] ` 일 경우 파일을 명령의 입력으로 보낸다. 그래서 `$ head sonnet.txt` 와 `$ head < sonnet.txt` 의 결과는 같다. (중요하지 않음)
* 파이프(`|`)의 경우,
  * 파이프는 **명령(command)**과 그에 의해 실행되는 **프로세스**와 관련이 있다.
  * `[command_A] | [command_B]` 에서 command_A 의 출력을 command_B 의 입력으로 보낸다.

### Exercise

1. `$ tail sonnets.txt` 의 결과를 `wc` 로 파이프하여 확인해 보자.
2. `$ man head` 를 실행하여 `$ head <file>` 할 때 기본적으로 설정된 `<file>` 의 첫 10줄이 아닌 처음 - N번째 줄 까지 보여주는 법을 찾아보자. 
3.  

