#!/bin/bash

WEB_PROJECTS_WEBAPP_DIR_PATHS=`find ~/git/ -maxdepth 1 -mindepth 1 | grep web | sed -e 's/$/\/src\/main\/webapp/'`
WEB_PROJECTS_JAVA_DIR_PATHS=`find ~/git/ -maxdepth 1 -mindepth 1 | grep web | sed -e 's/$/\/src\/main\/java/'`
WS_PROJECTS_JAVA_DIR_PATHS=`find ~/git/ -maxdepth 1 -mindepth 1 | grep ws | sed -e 's/$/\/src\/main\/java/'`

DEPLOYMENTS_DIR_PATH=/home/finn/softwares/wildfly/standalone/deployments/

watch_static() {

    inotifywait -m -r -e close_write,moved_to,create $@ | 
    while read -r directory events filename; 
    do
        project_dir=`echo $directory | sed 's/\(-web\).*/\1/'`
        project_name=`basename $project_dir`
        mv $DEPLOYMENTS_DIR_PATH$project_name.war.* $DEPLOYMENTS_DIR_PATH$project_name.war.dodeploy
    done
}

watch_source() {

    inotifywait -m -r -e close_write,moved_to,create $@ | 
    while read -r directory events filename; 
    do
        project_dir=`echo $directory | sed 's/\(-ws\).*/\1/'`
        project_name=`basename $project_dir`
        cd $project_dir
        mvn clean prepare-package war:exploded
        ln -s -f $project_dir/src/main/webapp $project_dir/target/$project_name
        cd -
        mv $DEPLOYMENTS_DIR_PATH$project_name.war.* $DEPLOYMENTS_DIR_PATH$project_name.war.dodeploy
    done
}

if [[ $WEB_PROJECTS_WEBAPP_DIR_PATHS ]]; then
    echo 'Spawning inotifywait for project '$WEB_PROJECTS_DIR_PATHS
    watch_static $WEB_PROJECTS_WEBAPP_DIR_PATHS &
    watch_source $WEB_PROJECTS_JAVA_DIR_PATHS & 
fi

if [[ $WS_PROJECTS_JAVA_DIR_PATHS ]]; then 
    echo 'Spawning inotifywait for project '$WS_PROJECTS_DIR_PATHS
    watch_source $WS_PROJECTS_JAVA_DIR_PATHS & 
fi

echo 'Finished.'
