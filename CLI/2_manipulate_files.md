# Manipulating files - 파일 조작

* 기본적으로 텍스트 에디터를 활용하는 법을 모르는 상태에서 진행.
* 순수 CLI 커맨드로 파일을 다뤄보기.

## Redirceting and appending

우선 문자열 한줄을 출력해보자

```shell
$ echo "When I was a young boy"
When I was a young boy
$
```

* `$ echo` : standard out

---

그리고 해당 문자열을 포함하는 파일을 만들어 보자. (파일 명은 black_parade.txt)

```shell
$ echo "When I was a young boy" > black_parade.txt
$
```

위 명령어는 `$ echo` 명령어의 출력 내용을 `black_parade.txt` 라는 이름의 파일로 보내는(redirect) 명령어다.

* `>` : redirect

---

정말 우리가 원하는 대로 되었는지 확인하려면 어떻게 해야 할까? 

지금 단계에서는 일단 단순히 해당 파일의 내용을 터미널 창에 보여주는 명령어를 사용해 보자.

```shell
$ cat black_parade.txt
When I was a young boy
```

* `$ cat` : con**cat**ate (여러개를 하나로 연결하다.)
* `$ cat ` 명령어는 contents 들을 combine 하는 용도다.
* 하지만  지금은 우선 `$ cat` 명령어를 최대한 빠르고 지저분하게 특정 파일의 내용을 보여주는 명령어로 알고 있자.

---

이번에는 추가로 줄을 삽입해보자.

```shell
$ echo "My father took me into the city" >> black_parade.txt
```

위 명령어는 `$ echo` 명령어의 출력 내용을 `black_parade.txt` 라는 이름의 파일에 덧붙이는(append) 명령어다.

* `>>` : append
* **만약 `>` 를 사용하게 되면 해당 파일에 출력내용을 덮어 쓰게 된다. 즉 기존의 내용은 날아간다.**

```shell
$ cat black_parade.txt
When I was a young boy
My father took me into the city
```



## Listing

아마 가장 많이 사용되는 Unix 명령어로 생각되는 `ls`.  (결과 창은 다를 수 있음.)

```shell
$ ls 
Desktop
Document
Downloads
Library
black_parade.txt
```

* `$ ls` 는 단순히 (숨김파일을 제외하고) 현재 디렉토리(폴더)에 있는 모든 파일과 디렉토리들을 보여준다.
* ​