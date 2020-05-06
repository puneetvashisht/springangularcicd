# docker build -t puneetvashisht/multi-client:latest -t puneetvashisht/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t puneetvashisht/domshom-server:latest -t puneetvashisht/domshom-server:$SHA -f ./server/Dockerfile ./server
# docker build -t puneetvashisht/multi-worker:latest -t puneetvashisht/multi-worker:$SHA -f ./worker/Dockerfile ./worker

# docker push puneetvashisht/multi-client:latest
docker push puneetvashisht/domshom-server:latest
# docker push puneetvashisht/multi-worker:latest

# docker push puneetvashisht/multi-client:$SHA
docker push puneetvashisht/domshom-server:$SHA
# docker push puneetvashisht/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=puneetvashisht/domshom-server:$SHA
# kubectl set image deployments/client-deployment client=puneetvashisht/multi-client:$SHA
# kubectl set image deployments/worker-deployment worker=puneetvashisht/multi-worker:$SHA