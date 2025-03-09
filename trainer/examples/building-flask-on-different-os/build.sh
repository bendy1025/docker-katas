# /bin/bash
docker build -t flask-app:ubuntu .
docker build -f Dockerfile-python -t flask-app:python3 .
docker build -f Dockerfile-python-alpine -t flask-app:python3-alpine .
