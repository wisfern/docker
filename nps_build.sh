
VERSION=0.23.1
repos_head=docker.io/wisfern

cd nps_server
nps_id=$(docker build -t ${repos_head}/nps-server:${VERSION} . | grep 'Successfully built' | awk '{print $3}')
cd ../npc_client
npc_id=$(docker build -t ${repos_head}/npc-client:${VERSION} . | grep 'Successfully built' | awk '{print $3}')
cd ..

echo $nps_id
echo $npc_id

docker tag ${nps_id} ${repos_head}/nps-server:latest 
docker tag ${npc_id} ${repos_head}/npc-client:latest
