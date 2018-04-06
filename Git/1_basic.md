# 1. Basic

* Git 을 사용하는 가장 흔한 방법은, Command Line 을 이용하여 `git` 이라는 프로그램을 호출하는 것이다.
* 이를 통해 우리는 일반적인 디렉토리를, *repository*(저장소) - 줄여서 *repo* 로 바꿔 우리 프로젝트의 변경사항을 추적할 수있다.
* Git 이 어떻게 동작하는지, 어떻게 우리를 도와주는지를 작은 웹사이트 프로젝트를 통해 알아보자.

## 1.1 Installation and setup

* 각 OS별로 Git 을 설치한다.
* `which` 명령어를 통해 실행할 수 있는 `git` 이 존재하는지 확인하자.

```shell
$ which git
/usr/local/bin/git
```

* 다음과 같이 나오지 않는다면, [Git 공식 문서](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)를 보며 설치하자.
* 프로젝트를 시작하기 앞서서, 한 번만 하면 되는 설정을 몇가지 진행하자. 이것을 *global setup* 부르며, 한 컴퓨터당 한번만 수행하면 되는 설정이라는 뜻이다. (무슨 뜻인지는 지금 걱정하지 말자.)

```shell
$ git config --global user.name "Your Name"
$ git config --global user.email your.email@mail.com
```

* 이 설정들은 Git 이 변경사항을 이름과 이메일로 구분하기 위해 하는 설정이며, 특히 남들과 협업할 때 필요하다.
* 위에서 설장한 이름과 이메일은 남들에게 보여질 것이기 때문에 중요한 개인정보를 담지 않도록 주의!



### Exercises

1. `git help` 를 수행하자. 첫 번째로 나오는 명령어가 무엇인가?
2. CLI 를 배웠다면, 터미널에 비해 1의 결과가 너무 많을 경우 어떻게 다른 Unix 프로그램으로 열어서 읽을 수 있을까? (`less` 로 Pipe `|`)
3. Git 은 글로벌 설정을 홈 디렉토리에 숨겨진 `.gitconfig` 에 저장한다. `cat`, `less`, `vim` 등 어떤걸 사용해서든지 내용을 보고, 올바르게 적용되었는지 확인하자.



## 1.2 Initalizing the repo - repo 초기화

* 이제 프로젝트를 생성하고, 해당 프로젝트를 Git 의 버젼관리 아래에 둘 차례이다. 우리는 정말 간단한 Home page 와 About Page 를 가진 웹 사이트를 만들것이다.
* 우선 website 라는 디렉토리를 생성하는것 부터 시작하자.

```shell
[~/Git]$ pwd
/Users/neo/Git
[~/Git]$ mkdir website
[~/Git/website]$ cd website
[~/Git/website]$ pwd 
/Users/neo/Git/website
```

* `website` 디렉토리가 비어있지만, 우리는 해당 디렉토리를 *repository* 로 바꿀 수있다.
* *repo* 를 기존의 Unix 디렉토리보다 진화한, 즉 해당 폴더에 있는 모든 파일과 하위 디렉토리의 변화를 추적할 수 있는 *neo-directory* 라고 생각해도 좋다.
* `init` (초기화 : initialize) 명령어를 사용하여 기존의 디렉토리를 새로운 Git repo로 만들며, Git 이 우리의 프로젝트의 변경사항을 주척할 수 있는 특별한 숨김폴더 `.git` 이 해당 디렉토리에 생긴다.
* Git 을 사용하는 모든 명령어들은 `git` 명령어로 시작하기에, repo 초기화의 모든 명령어는 `git init` 이다.

```shell
[website]$ git init
Initialized empty Git repository in /Users/neo/Git/Website/.git
[website (master)]$
```

* 터미널 설정에 따라 다르겠지만, 일반적으로 `init` 이후에는 기본 `master` 라고 하는, 초기 설정 Git branch 가 표시된다. 브랜치는 Chapter 3에서 다룬다.



### Exercises

1. `ls -a` 명령어를 실행했을 때, 나타나는 숨김 디렉토리를 확인하자.
2. `.git` 디렉토리에서 설저을 담당하는 파일을 유추해서 `cat` 을 사용해 내용을 화면에 띄워보자.



## 1.3 First commit - 첫 번째 커밋

*  **앞으로 별도의 명시가 없을 경우 기본적으로 `website/` 에서 작업중이다.**
* GIt 은 비어있는 repo 로는 아무것도 할 수 없기 때문에, 현재 디렉토리에 뭔가 변화를 줘야한다.
* 메인 페이지를 상징하는 (그리고 실제로 서버에 파일을 명시하지 않으면 자동으로 불러와 지는) `index.html` 이라는 파일을 생성하자

```shell
(master)$ touch index.html
```

* 첫 번째 파일을 생성했으니, `git status ` 명령어를 통해 결과를 확인해 보자.

```shell
(master)$ git status
On branch master

Initial commit

Untracked files:
(use "git add <file>..." to include in what will be committed)

  index.html
nothing added to commit but untracked files presetn (use "git add" to track)
```

* `index.html` 파일이 "추적할 수 없는(untracked)" 상태라고 나온다. 즉 Git 이 `index.html` 을 아얘 모른다는 뜻이다. 
* 이 Git 이 모르는 파일을 `git add` 명령을 통해 Git 에게 *더해(add)* 주자. 

```shell
(master)$ git add -A
```

* 여기서 `-A` 옵션은, Git 에게 모든(All) 추적할 수 없는(untracked) 파일들을 더하라는 뜻이다. 
* 파일이 하나밖에 없지만, 경험상으로, 파일을 add 할 경우 99%의 확률로 모두(All) 더할 것이기 때문에, 이 명령어에 익숙해 지자. (현재 디렉토리를 의미하는 `.` 역시 매우 많이 사용된다. `git add .`)
* 이제 `git status` 명령을 실행해서 다시 한번 결과를 보자.

```shell
(master)$ git status
On branch master

Initial commit

Changes to be commited:
  (use "git rm --cached <file>..." to unstage)
  
  new file:    index.html
```

* **"unstage"** 라는 단어로 유추해보면, `index.html` 파일의 상태가, '*untracked*' 에서 '*staged*' 로 바뀌었다.
* 특정 파일이 'staged' 되었다는 것은, 해당 파일이 repo 에 추가될 준비가 되었다는 뜻이다.
* *Untracked*/*Unstaged* 는 Git 이 일반적으로 사용하는 4가지 상태중에 하나이다.
  * 정확히는 untracked 와 unstaged 는 다르지만,  어차피 `git add` 명령이 tracking 과 staging 을 동시에 하기 때문에 큰 의미는 없다.

![image-20180407044539084](/var/folders/vz/cm0tj7m10g38vbggrw_cybzc0000gp/T/abnerworks.Typora/image-20180407044539084.png)

* 위 그림에서 보이듯이, 바뀐 내용을 staging area 에 넣고 나서야, `git commit` 명령을 통해 로컬저장소(Local repo) 의 일부로 만들 수 있다. (`git push` 는 섹션 2.3 에서.)
* `git commit` 을 사용할 때는 반드시 함께 따라가는 옵션 `-m` 이 있다. Message 를 commit 과 함께 남기는 옵션이다.
* 이 메세지는, 해당 commit 의 목적/이유 를 남기는 것인데, 우리의 경우에는 새 저장소를 초기화(Initialize the new repo) 한 것이기 때문에 다음과 같이 남긴다.

```shell
(master)$ git commit -m 'Initialize repository'
[master (root-commit) 87392a] Initialize repository
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100544 index.html
```

​	*전반적으로 다음과 같겠지만, 세부사항은 다를 것이다.*

---

### Commit 메세지는 어떻게 작성하는가

Git 의 Commit 메세지는

 	1. 현재형으로 (Initialized/Initializes => Initialize)
 	2. 명령하듯이
 	3. 너무 길지 않게
 	4. 더 자세한 사항은 "[Shiny new commit style](https://blog.github.com/2011-09-06-shiny-new-commit-styles/)" 참조

![image-20180407050000767](/var/folders/vz/cm0tj7m10g38vbggrw_cybzc0000gp/T/abnerworks.Typora/image-20180407050000767.png)

---

* 이 쯤에서 `git log` 명령어를 통해 우리가 남긴 commit 의 기록을 보자.

```shell
(master)$ git log
commit 484ff99d3ef6a154298aae106f831a5c7d99dab6
Author: TaeYoung Yu <neovansoarer@gmail.com>
Date: Thu Mar 15 16:42:22 2018 +0900

    Initialize repository

```

* commit 은 알파벳과 숫자로 이루어진 Unique 한 String 인*hash* 를 통해 식별한다. 위의 경우에는 다음이 hash 이다.

```shell
484ff99d3ef6a154298aae106f831a5c7d99dab6
```

* 당연히 사람 - 컴퓨터 - commit 별로 다르다.
* Hash 는 SHA 라고 표현되기도 한다. (**S**ecure **H**ash **A**lgorithm 을 통해 Hash 가 생성되기 때문)

---

### Exercises

1. `touch` 커맨드를 사용해, 아무 내용 없는 `foo` 와 `bar` 파일을 repo 디렉토리에 생성해 보자.
2. `git add foo` 를 사용해 `foo` 파일을 staging area 에 추가해 보자. `git status` 명령어로 잘 추가되었나 확인하자.
3. `git commit -m` 와 적절한 메세지를 통해 `foo` 를 repo 에 추가하자.
4. `git add bar`을 통해 staging area 에 대하자. `git status` 로 확인.
5. (Vim) 을 사용할 수 있다면), `git commit` 명령어 이후 vi 창에서 Add bar 라는 메세지를 남기고 저장하고 끄자.
6. `git log` 를 사용해, 방금 남긴 커밋이 잘 동작했는지 확인해 보자.



## 1.4 Viewing the diff - 차이 확인하기

