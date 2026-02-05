#!/bin/bash

# Docker Hub에 이미지를 빌드하고 푸시하는 스크립트
# 사용법: ./docker-push.sh [docker-username] [version]
# 예시: ./docker-push.sh myusername v1.0.0

set -e

DOCKER_USERNAME="${1:-yourusername}"
VERSION="${2:-latest}"

echo "🐳 Docker 이미지 빌드 및 푸시 시작..."
echo "Username: $DOCKER_USERNAME"
echo "Version: $VERSION"
echo ""

# 환경 변수 설정
export DOCKER_USERNAME=$DOCKER_USERNAME
export VERSION=$VERSION

# Docker Hub 로그인 확인
echo "📝 Docker Hub 로그인 상태 확인..."
if ! docker info | grep -q "Username"; then
    echo "⚠️  Docker Hub에 로그인되어 있지 않습니다."
    echo "다음 명령어로 로그인해주세요: docker login"
    exit 1
fi

# 이미지 빌드
echo "🔨 이미지 빌드 중..."
docker-compose build

# 이미지 푸시
echo "📤 Docker Hub에 이미지 푸시 중..."
docker-compose push

echo ""
echo "✅ 완료!"
echo "푸시된 이미지:"
echo "  - $DOCKER_USERNAME/ninedragons-back:$VERSION"
echo "  - $DOCKER_USERNAME/ninedragons-web:$VERSION"
