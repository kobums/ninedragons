# 구룡투 (Nine Dragons Duel)

2인용 심리전 보드게임의 웹 버전입니다.

## 게임 규칙

- 각 플레이어는 1~9 숫자 타일을 한 세트씩 가집니다
- 매 라운드마다 타일을 하나씩 선택합니다
- 더 높은 숫자가 승리합니다
- **특별 규칙**: 1은 9를 이깁니다
- 5승을 먼저 달성하거나, 9라운드 후 더 많이 이긴 플레이어가 승리합니다

## 기술 스택

### Frontend
- React + TypeScript
- Vite
- WebSocket Client

### Backend
- Golang
- Gorilla WebSocket

## 설치 및 실행

### 빠른 시작

**터미널 1 - 백엔드 실행:**
```bash
cd back
go run main.go
```
백엔드는 `http://localhost:8080`에서 실행됩니다.

**터미널 2 - 프론트엔드 실행 (이미 실행 중이라면 생략):**
```bash
cd web
npm run dev
```
프론트엔드는 `http://localhost:5173`에서 실행됩니다.

### 게임 시작하기

1. **첫 번째 플레이어**: 브라우저에서 `http://localhost:5173` 접속
   - 이름 입력 후 "게임 참가" 클릭
   - "상대방을 기다리는 중..." 메시지 확인

2. **두 번째 플레이어**: 다른 브라우저 창에서 `http://localhost:5173` 접속
   - 이름 입력 후 "게임 참가" 클릭
   - 자동으로 게임 시작!

### 문제 해결

**"서버에 연결 중..." 화면이 계속 나올 때:**
- 백엔드가 실행 중인지 확인: `cd back && go run main.go`
- 포트 8080이 사용 가능한지 확인

**두 번째 플레이어가 입장이 안 될 때:**
- 브라우저 콘솔(F12)을 열고 에러 메시지 확인
- 백엔드를 재시작: Ctrl+C 후 `go run main.go`
- 브라우저 새로고침(F5)

## 프로젝트 구조

```
ninedragons/
├── back/               # Golang 백엔드
│   ├── main.go        # 서버 진입점
│   ├── go.mod         # Go 모듈 설정
│   └── server/        # 서버 로직
│       ├── types.go   # 타입 정의
│       ├── game.go    # 게임 로직
│       ├── hub.go     # WebSocket Hub
│       └── client.go  # WebSocket 클라이언트
│
└── web/               # React 프론트엔드
    ├── src/
    │   ├── types/     # TypeScript 타입
    │   ├── hooks/     # React 커스텀 훅
    │   ├── components/# React 컴포넌트
    │   ├── App.tsx    # 메인 앱
    │   └── main.tsx   # 진입점
    └── package.json
```

## 주요 기능

- 실시간 2인 대전
- WebSocket을 통한 실시간 통신
- 턴 기반 게임플레이
- 라운드별 승패 판정
- 최종 승자 결정
- 반응형 UI

## 게임 플레이

1. 브라우저에서 게임에 접속합니다
2. 플레이어 이름과 색상(선택사항)을 선택합니다
3. 다른 플레이어가 접속할 때까지 대기합니다
4. 게임이 시작되면 자신의 차례에 타일을 선택합니다
5. 9라운드까지 진행하거나 5승을 먼저 달성한 플레이어가 승리합니다

## 개발 모드

### 로컬에서 테스트하기

두 개의 브라우저 창을 열어 각각 다른 플레이어로 접속하여 게임을 테스트할 수 있습니다.

## 라이센스

MIT
# ninedragons
