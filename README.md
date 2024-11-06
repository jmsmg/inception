# inception

`inception` 프로젝트는 Docker와 Docker Compose를 이용하여 다중 컨테이너 시스템을 구축하는 프로젝트입니다. 이 프로젝트는 Nginx, WordPress, MariaDB로 구성된 서비스를 각각의 컨테이너로 구분하여 실행하며, 각 컨테이너가 협력하여 웹 서비스를 제공합니다. Docker Compose와 Makefile을 활용해 여러 컨테이너를 쉽게 관리하고 제어할 수 있습니다.

## 목차
- [프로젝트 개요](#프로젝트-개요)
- [구성 요소](#구성-요소)
- [Makefile을 사용한 관리](#makefile을-사용한-관리)
- [설치 및 실행 방법](#설치-및-실행-방법)

## 프로젝트 개요

`inception` 프로젝트는 Docker Compose를 사용해 여러 서비스를 컨테이너로 구분하여 실행하며, 각 컨테이너가 협력하여 완전한 시스템을 제공합니다. 이 프로젝트는 Docker의 네트워킹, 볼륨 관리, 다중 서비스 환경을 학습하고 경험하는 데 목적이 있습니다.

## 구성 요소

프로젝트는 다음과 같은 주요 구성 요소로 이루어져 있습니다:

- **Nginx**: 리버스 프록시로 동작하여 다른 서비스로의 접근을 제어하고 요청을 라우팅합니다.
- **WordPress**: PHP 기반의 CMS(Content Management System)로, 웹 콘텐츠를 생성하고 관리할 수 있습니다.
- **MariaDB**: WordPress에서 사용하는 데이터를 저장하는 관계형 데이터베이스 관리 시스템입니다.
- **Docker Compose**: 각 서비스를 정의하고 종속성을 관리하여 멀티 컨테이너 환경을 구성합니다.

## Makefile을 사용한 관리

이 프로젝트는 Makefile을 사용하여 Docker Compose 작업을 간단히 실행할 수 있습니다. 아래는 Makefile에 정의된 주요 명령어의 기능입니다.

### 주요 명령어 기능 설명

- **all**: 모든 컨테이너를 빌드하고 백그라운드에서 실행합니다. `docker-compose up --build -d` 명령을 수행하여 각 컨테이너의 이미지를 빌드하고 네트워크 환경에서 컨테이너를 실행합니다.

- **clean**: 모든 컨테이너를 중지하고, 사용된 이미지와 볼륨을 포함한 리소스를 제거합니다. `docker-compose down` 명령과 함께 `--rmi all -v` 옵션을 사용하여 모든 관련 리소스를 정리합니다.

- **fclean**: `clean` 명령을 수행한 후 `/home/seonggoc/data/` 디렉토리 내의 `mariadb`와 `wordpress` 데이터를 완전히 삭제하여, 프로젝트에 남아 있는 모든 데이터를 제거합니다. 이 명령어는 컨테이너가 완전히 초기화된 상태에서 재시작될 수 있도록 합니다.

- **re**: `fclean`을 먼저 실행한 뒤 `all`을 실행하여, 컨테이너와 이미지를 초기화한 후 새로 빌드하고 실행합니다. 이 명령을 통해 환경을 완전히 재설정할 수 있습니다.

- **ps**: 현재 실행 중인 컨테이너의 상태를 확인합니다. 컨테이너의 상태와 포트를 한눈에 파악할 수 있어, 실행 상태를 점검하는 데 유용합니다.

- **mariadb**, **nginx**, **wordpress**: 각각의 컨테이너에 접근하여 `bash` 쉘을 실행합니다. 각 컨테이너의 내부 환경에 접속하여 설정을 확인하거나 디버깅 작업을 수행할 수 있습니다.

## 설치 및 실행 방법

1. **프로젝트 시작**: `Makefile`을 사용해 Docker Compose를 실행합니다.
    ```bash
    make all
    ```

2. **상태 확인**: 실행 중인 컨테이너의 상태를 확인합니다.
    ```bash
    make ps
    ```

3. **로그 확인 및 쉘 접속**:
   - **로그 확인**: 실시간 로그를 보려면 `docker-compose logs -f`를 사용할 수 있습니다.
   - **컨테이너 접속**: 특정 컨테이너의 쉘에 접속하려면 `make mariadb`, `make nginx`, `make wordpress`를 실행합니다.
