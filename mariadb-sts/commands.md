# Useful commands

## 1. Command to list zones of the pods
```bash
for p in $(k get po -l app=mariadb -o name); do
  n=$(k get "$p" -o jsonpath='{.spec.nodeName}')
  z=$(k get node "$n" -o jsonpath='{.metadata.labels.topology\.kubernetes\.io/zone}')
  echo "$p  ->  $n  ($z)"
done
```

## To delete all PVCs in a single command.
```bash
for pvc in $(k get pvc -o name); do k delete "$pvc"; done 
```