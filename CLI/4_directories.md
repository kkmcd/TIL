# 4. Directories

* 지금까지 수많은 Unix 명령어들로 file 들을 상대해 왔다면, 이제 *Directories(Folders)* 를 배울 차례이다. 
* 살펴 보겠지만, 파일들에서 적용할 수 있는 개념들이 디렉토리들에서도 적용되지만, 꽤나 많은 차이점들이 있다.



## 4.1 Directory structure - 디렉토리 구조

* Unix-Style 의 디렉토리 구조는 일반적으로 디렉토리 이름을 정 슬래시(`/`) 로 구분하며, (윈도우는 백 슬래시`\`)


*  `ls` Command 와 섞어서 다음과 같이 사용할 수 있다.

```shell
$ ls /Users/neo/TIL
$ ls /usr/local/bin
```

* 모든 Unix Based OS 에서는 모든 디렉토리들은 결국 궁극적으로 루트(*root*) 디렉토리의 하위 디렉토리이다. 이 *root* 디렉토리를 상징하는 마크가 `/` 이기도 하기에 결국 디렉토리 구조를 표현할 때는 `/` 로 시작하며 동시에 하위 디렉토리에 대한 구분을 `/`로 하게된다.

* 일반적인 사용자에게 가장 중요한 디렉토리는 홈(*home*) 디렉토리다. MacOS 의 경우 `/Users/neo` 과 같은 형식으로 이루어져 있다(root dir 아래 Users dir 아래 사용자계정명 dir). 이러한 홈 디렉토리의 경우 `~` 마크를 사용하게 된다. (`~` 는 영어로 tilde character 라고 함)

* 결과적으로 만약 MacOS 기준 Downloads 디렉토리의 위치는 `/Users/neo/Downloads` 이기도 하면서 동시에 `~/Downloads` 라고 표현할 수도 있다. `neo` 계정으로 로그인 한 상황이라면, 둘은 완전히 같은 디렉토리를 의미한다. ([오래전 키보드](https://unix.stackexchange.com/questions/34196/why-was-chosen-to-represent-the-home-directory)에서는 `~`  문자와 `Home` 키가 같은 키였다.)

* 모든 Unix 시스템은 '시스템 디렉토리(*System directoies*)' 라고 하여, 컴퓨터의 일반적인 작동에 반드시 필요한 프로그램들이 저장된 디렉토리가 있다. 이러한 시스템 파일이나 디렉토리들을 수정하는것은 슈퍼유저(superuser), 혹은 `root` 계정이라고 하는 특별한 권한이 있어야만 한다. (앞서 서술한 `/` 의 root dir 과는 무관하다.) 

* super user 는 너무나 권한이 강력하기때문에 이런 `root` 계정으로 컴퓨터에 로그인하는 것은 좋지 않은 방법이다. 때문에 super user 의 권한이 필요한 작업을 할때는 계정을 바꾸는 것이 아니라, 작업을 `sudo` 라고 하는 명령을 통해 기존 계정에서 super user의 권한을 빌리는 것이 가능하다.

  ```shell
  $ touch /opt/fake_file
  touch: /opt/fake_file: Permission denied # /opt dir에 대한 권한 없음 에러.

  $ sudo touch /opt/fake_file
  Password: 			# password 가 맞다면 성공적으로 fake_file 이 생성.

  $ ls -l /opt/fake_file
  -rw-r--r-- 1 root wheel 0 Jul 12 19:13 /opt/fake_file 
  # root 는 super user 가 이 파일을 소유하고 있고, wheel 은 Group 명이다. 현재는 admin 그룹이라고 쓰지만, 과거에는 배의 wheel 이라 하여 wheel 그룹을 의미한다.

  $ rm -f /opt/fake_file
  rm: /opt/fake_file: Permission denied

  $ sudo rm -f /opt/fakefile

  $ sudo ls -l /opt/fake_file
  ls: /opt/fake_file: No such file or directory
  ```

  ​

---

### Exercises

1. `~/my_dir/my_file` 을 발음해보자
2. `/Users/neo/my_dir` 에서 Home dir 은 어디이며, 사용자 이름은 무엇일까? 가장 아래에 있는 디렉토리의 이름은?
3. `yty` 라는 사용자에게 `/Users/yty/Documents` 와 `~/Documents` 는 어떻게 다른가?



## 4.2 Making directories - 디렉토리 생성

* 지금까지 우리는 수많은 `.txt.` 파일들을 생성하고 지워봤다. 이제는 이 파일들을 담을 디렉토리를 생성해 보자. 

* 보통의 PC 들은 GUI(Graphic User Interface)를 제공하지만, Unix 시스템에서는 `mkdir` (make directory) 명령어를 통해 디렉토리를 생성한다.

  ```shell
  $ mkdir text_files
  ```

* 디렉토리를 생성했으니 우리는 이제 파일들을 `*`(wild card) 를 사용하여 옮길 수 있다.

  ```shell
  $ mv *.txt text_files/
  $ ls text_files/
  sonnet1.txt		sonnets.txt		...
  ```

* `