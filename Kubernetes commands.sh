Pods > ReplicaSets > Deployment #Layers of abstraction

kubectl run #CLI
kubectl apply #YAML/JSON
kubectl create #CLI & YAML/JSON

kubectl run NAME_POD --image=IMAGE #Start a single pod of IMAGE
                                    --port=XXXX #Expose port XXXX
                                    --replicas=X #Start a replicated pod                                 
kubectl delete pod NAME_POD

#-CONFIG-#
KUBECONFIG=~/.kube/config:~/.kube/kubconfig2 #Use multiple kubeconfig files at the same time 
kubectl config view #Show merged kubeconfig settings
kubectl config view -o jsonpath='{.users[].name}'    # display the first user
kubectl config view -o jsonpath='{.users[*].name}'   # get a list of users
kubectl config get-contexts                          # display list of contexts 
kubectl config current-context                       # display the current-context
kubectl config use-context my-cluster-name           # set the default context to my-cluster-name

#-PODS-#
kubectl get pods
kubectl get pods -o wide
kubectl get pods --show-labels
kubectl get pods -l app=nginx
kubectl get pods -o yaml
kubectl get pod POD_NAME -o yaml --export
kubectl get pod POD_NAME -o yaml --export > nameof file.yaml
kubectl get pods --field-selector status.phase=Running