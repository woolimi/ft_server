# ft_server

Ecole42 프로젝트: Docker를 사용한 웹 서버 구축

## 📋 프로젝트 개요

이 프로젝트는 Docker를 사용하여 Nginx, PHP, MariaDB, WordPress, phpMyAdmin을 포함한 완전한 웹 서버 환경을 구축합니다. SSL 인증서를 통한 HTTPS 지원과 자동 디렉토리 리스팅 기능을 제공합니다.

## 🛠 기술 스택

- **Base Image**: Debian Buster
- **Web Server**: Nginx
- **PHP**: PHP 7.3 (FPM, CGI)
- **Database**: MariaDB (MySQL)
- **CMS**: WordPress
- **Database Management**: phpMyAdmin 4.9.1
- **SSL**: mkcert를 사용한 로컬 SSL 인증서

## 📁 프로젝트 구조

```
ft_server/
├── Dockerfile              # Docker 이미지 빌드 설정
├── srcs/
│   ├── start.sh           # 컨테이너 시작 스크립트
│   ├── nginx_config       # Nginx 설정 파일
│   ├── php.ini            # PHP 설정 파일
│   ├── wp-config.php      # WordPress 설정 파일
│   ├── index.php          # PHP 정보 페이지
│   ├── wordpress.tar.gz   # WordPress 압축 파일
│   └── mkcert-v1.1.2-linux-amd64  # SSL 인증서 생성 도구
└── test                   # 빌드 및 실행 테스트 스크립트
```

## 🚀 사용 방법

### 1. Docker 이미지 빌드 및 실행

```bash
docker build -t ft . && docker run --rm -p 80:80 -p 443:443 ft
```

또는 `test` 파일을 실행:

```bash
bash test
```

### 2. 웹 브라우저에서 접속

- **HTTP**: http://localhost
- **HTTPS**: https://localhost
- **WordPress**: https://localhost/wordpress
- **phpMyAdmin**: https://localhost/phpmyadmin
- **Autoindex**: https://localhost/index/

## 🔧 주요 기능

### Nginx 설정

- 포트 80 (HTTP) 및 443 (HTTPS) 리스닝
- PHP-FPM을 통한 PHP 처리
- `/index/` 경로에서 자동 디렉토리 리스팅 (Autoindex)
- SSL/TLS 인증서를 통한 HTTPS 지원

### PHP 설정

- PHP 7.3 FPM 사용
- 보안을 위한 일부 함수 비활성화
- 에러 로깅 활성화 (프로덕션 모드)

### 데이터베이스 설정

- 데이터베이스명: `wordpress`
- 사용자명: `wpark`
- 비밀번호: `1234`
- 호스트: `localhost`

### WordPress 설정

- WordPress가 자동으로 설치되고 설정됩니다
- 데이터베이스 연결 정보는 `wp-config.php`에 포함되어 있습니다

### SSL 인증서

- mkcert를 사용하여 로컬 개발용 SSL 인증서 생성
- 인증서 위치: `/root/CA/localhost.pem`
- 키 위치: `/root/CA/localhost-key.pem`

## 📝 시작 스크립트 동작 순서

`start.sh` 스크립트는 다음 작업을 수행합니다:

1. PHP 설정 파일 복사 및 적용
2. PHP-FPM 및 MySQL 서비스 시작
3. Nginx 설정 파일 복사 및 활성화
4. 웹 루트 디렉토리 생성 및 초기 파일 배치
5. WordPress 데이터베이스 생성 및 사용자 권한 설정
6. WordPress 압축 해제 및 설정 파일 복사
7. phpMyAdmin 다운로드 및 설치
8. SSL 인증서 생성 및 설치
9. 테스트용 디렉토리 및 파일 생성
10. Nginx 재시작

## 🔐 보안 참고사항

⚠️ **주의**: 이 프로젝트는 교육 목적으로 제작되었으며, 프로덕션 환경에서 사용하기 전에 다음 사항을 수정해야 합니다:

- 데이터베이스 비밀번호 변경
- WordPress 보안 키 업데이트
- SSL 인증서를 공인 인증서로 교체
- PHP 설정의 보안 옵션 검토
- 불필요한 서비스 및 포트 제한

## 📌 접근 가능한 경로

- `/` - 메인 페이지 (index.php - PHP 정보)
- `/wordpress/` - WordPress 설치
- `/phpmyadmin/` - phpMyAdmin 인터페이스
- `/index/` - 디렉토리 리스팅 (file1.txt, file2.txt, file3.txt)

## 🐳 Docker 명령어 참고

프로젝트의 Dockerfile 하단에 유용한 Docker 명령어들이 주석으로 포함되어 있습니다:

- 이미지 다운로드
- 컨테이너/이미지 확인
- 이미지 빌드
- 컨테이너 생성 및 실행
- 컨테이너 접속
- 파일 복사

## 👤 작성자

Woolim PARK <wpark@student.42.fr>

## 📄 라이선스

이 프로젝트는 42 School의 교육 프로젝트입니다.
