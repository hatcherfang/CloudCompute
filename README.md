## Cloud Compute study  
### Docker  
1. [Docker install](https://docs.docker.com/install/linux/docker-ce/debian/#install-docker-ce-1)  
2. Docker command  
**交互式进入容器**  
```
sudo docker exec -it {{containerName or containerID}} bash
sudo docker exec -i {{containerName or containerID}} bash
sudo docker exec -t {{containerName or containerID}} bash
sudo docker exec -d {{containerName or containerID}} bash
```
- 只用 -i 参数，由于没有分配伪终端，看起来像pipe执行一样。但是执行结果、命令返回值都可以正确获取
- 只用 -t 参数，则可以看到一个 console 窗口，但是执行命令会发现由于没有获得stdin的输出，无法看到命令执行情况
- 使用 -it 时，则和我们平常操作 console 界面类似，而且也不会像attach方式因为退出，导致整个容器退出
- 使用 -d 参数，在后台执行一个进程。如果一个命令需要长时间进程，会很快返回
#### Docker 拉取镜像(pull)  
```
docker pull image_name 
```

#### Docker 推送镜像(push)  
镜像重命名：  
```
docker tag origin_image_name new_image_name
```
将镜像推送到镜像仓库中:  
```
docker push new_image_name
```


### K8s  
## 常用命令  
1. 创建资源,可以使用json或者yaml格式定义扩展名用.yaml .yml 或者.json  
kubectl create -f ./my1.yaml -f ./my2.yaml     # 可以使用单个或多个文件创建资源  
2. 强制替换，删除后重新创建资源(会导致服务中断)。  
kubectl replace --force -f ./pod.json  
3. 显示资源  
```
# 列出所有 namespace 中的所有 service 
kubectl get services 
# 列出所有 namespace 中的所有 pod  
kubectl get pods --all-namespaces  
# 列出所有 pod 并显示详细信息
kubectl get pods -o wide
# 列出当前namespace中的所有pod  
kubectl get pods/pod
# 查看pod详细信息  
kubectl describe pods <podname>
# 查看node详细信息  
kubectl describe nodes <nodename>
# 查看ip, port信息  
kubectl get svc
```
4. 删除资源  
```
# 删除 pod.json 文件中定义的类型和名称的 pod
kubectl delete -f ./pod.json
```
5. 与运行中的 Pod 交互  
```
# dump 输出 pod 的日志（stdout）
kubectl logs my-pod                                 
# dump 输出 pod 中容器的日志（stdout，pod 中有多个容器的情况下使用）
kubectl logs my-pod -c my-container                 
# 流式输出 pod 的日志（stdout）
kubectl logs -f my-pod                              
# 流式输出 pod 中容器的日志（stdout，pod 中有多个容器的情况下使用）    
kubectl logs -f my-pod -c my-container              
# 对pod传送命令执行  
kubectl exec my-pod -- ls /
# 进入运行中的容器
kubectl exec -ti <your-pod-name>  -n <your-namespace>  -- /bin/sh
```

## Reference  
1. [Docker 常用命令与操作](https://www.jianshu.com/p/adaa34795e64)  
2. [kubectl 命令技巧大全](https://jimmysong.io/kubernetes-handbook/guide/kubectl-cheatsheet.html)  
