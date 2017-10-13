	#! /bin/bash
	if [ -z "$1" ]
	then
	     ProjectName="d8_docker_api"
	else
		ProjectName=$1
	fi
	if [ -z "$2" ]
	then
	     GitUrl="https://github.com/guoxiangke/api2017.git"
	else
		GitUrl=$2
	fi

	if [ -z "$3" ]
	then
	    GitBranch="master"
	else
		GitBranch=$3
	fi
	echo Your ProjectName is : $ProjectName
	echo your github url $GitUrl
	echo your github Branch must be $GitBranch
	cd ./code
	if [ -d .git ]; then
		sudo git checkout .
		sudo git fetch
		sudo git checkout $GitBranch
		sudo git pull origin $GitBranch
		cd ../
	else
		cd ../
		rm ./code -rf
		git clone -b $GitBranch $GitUrl ./code
	fi;
	
	
	# docker-compose -p api down --remove-orphans
	# docker-compose -p api -f ./docker-compose.yml up -d  --build --remove-orphans --force-recreate
	# docker exec -it api_php_1  ls /var/www/html/modules/
	# docker-compose -p $ProjectName down --remove-orphans ##not first time!

	# //update code because it stop already!!!
	docker-compose -p $ProjectName  -f ./docker-compose.yml rm -f -v storage-drupal
	# sudo chmod 755 -R ./code
	# sudo chown -R www-data:www-data ./code
	docker-compose -p $ProjectName -f ./docker-compose.yml up -d  --build --remove-orphans --force-recreate
	

	###import databses example!!!!
	# docker exec -it api_db_1 bash
	# mysql -udrupal -pdrupal
	# use drupal;
	# set autocommit =1;
	# source /sql/api.sql;

	###import old files for drupal example!!!!