#!/bin/bash

echo "=== 구룡투 게임 서버 시작 ==="
echo ""

# 백엔드 시작
echo "1. 백엔드 서버 시작 중..."
cd back
go mod download 2>/dev/null
go run main.go &
BACKEND_PID=$!
echo "   백엔드 PID: $BACKEND_PID"
echo "   백엔드 URL: http://localhost:8080"
echo ""

# 잠시 대기
sleep 2

# 프론트엔드는 이미 실행 중이라고 가정
echo "2. 프론트엔드 확인"
echo "   프론트엔드 URL: http://localhost:5173"
echo ""

echo "=== 서버가 시작되었습니다 ==="
echo ""
echo "종료하려면 Ctrl+C를 누르세요"
echo ""

# Ctrl+C 처리
trap "echo '서버 종료 중...'; kill $BACKEND_PID 2>/dev/null; exit" INT

# 백엔드 프로세스 대기
wait $BACKEND_PID
