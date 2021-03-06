set -x

touch zzz_STARTED_AT.log
cd
cd poc-neo4j-import/
git pull origin master
cd
cd poc-neo4j-stressTest/
git pull origin master
cd
cd poc-neo4j-import/matrixDb/

date
curl -s http://instance-data/latest/meta-data/ami-id;echo;curl -s http://instance-data/latest/meta-data/instance-type;echo; curl -s http://instance-data/latest/meta-data/instance-id

echo -n "******************************************************* " && date
sudo service neo4j stop
##############################################echo -n "******************************************************* " && date
##############################################./_generateData.sh $1 $2
echo -n "******************************************************* " && date
./_importData.sh $1 $2
echo -n "******************************************************* " && date
sudo service neo4j start
echo -n "******************************************************* " && date


cd
cd poc-neo4j-stressTest/matrixDb/
./recreateIndexes.sh
#echo -n "******************************************************* " && date

touch zzz_ENDED_AT.log
date
sudo shutdown -h now

