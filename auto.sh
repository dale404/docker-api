#! /bin/bash
pwd
cd ./code
git pull
git push
cd ../
ssh root@bce2.yongbuzhixi.com<< EOF
cd ~/docker-api && ./run.sh
EOF
