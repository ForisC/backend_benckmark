$composeFile = "fastapi_v1/docker-compose.yml"
$fastapiContainerName = "fastapi-v1-container"
$wrkContainerName = "wrk-container"
docker-compose -f $composeFile up -d
$result = "`n`n"
$StartTime = Get-Date
# 等待 wrk 服务停止
while ($(docker inspect -f '{{.State.Running}}' $wrkContainerName) -eq "true") {
    $cpuUsage = (docker stats $fastapiContainerName --no-stream --format "{{.CPUPerc}}")
    $memUsage = (docker stats $fastapiContainerName --no-stream --format "{{.MemUsage}}")
    $data = "$((Get-Date) - $StartTime)`tCPU: $cpuUsage`tMEM: $memUsage"
    Write-Host $data
    $result += ($data + "`n")
    Start-Sleep -Seconds 1
}
docker-compose -f $composeFile down
Add-Content -Path "fastapi_v1/result/async.txt" -Value $result



# ===================
$composeFile = "fastapi_v2/docker-compose.yml"
$fastapiContainerName = "fastapi-v2-container"
$wrkContainerName = "wrk-container"
docker-compose -f $composeFile up -d
$result = "`n`n"
$StartTime = Get-Date
# 等待 wrk 服务停止
while ($(docker inspect -f '{{.State.Running}}' $wrkContainerName) -eq "true") {
    $cpuUsage = (docker stats $fastapiContainerName --no-stream --format "{{.CPUPerc}}")
    $memUsage = (docker stats $fastapiContainerName --no-stream --format "{{.MemUsage}}")
    $data = "$((Get-Date) - $StartTime)`tCPU: $cpuUsage`tMEM: $memUsage"
    Write-Host $data
    $result += ($data + "`n")
    Start-Sleep -Seconds 1
}
docker-compose -f $composeFile down
Add-Content -Path "fastapi_v2/result/async.txt" -Value $result


# ===================
$composeFile = "fastapi_v2/docker-compose-sync.yml"
$fastapiContainerName = "fastapi-v2-container"
$wrkContainerName = "wrk-container"
docker-compose -f $composeFile up -d
$result = "`n`n"
$StartTime = Get-Date
# 等待 wrk 服务停止
while ($(docker inspect -f '{{.State.Running}}' $wrkContainerName) -eq "true") {
    $cpuUsage = (docker stats $fastapiContainerName --no-stream --format "{{.CPUPerc}}")
    $memUsage = (docker stats $fastapiContainerName --no-stream --format "{{.MemUsage}}")
    $data = "$((Get-Date) - $StartTime)`tCPU: $cpuUsage`tMEM: $memUsage"
    Write-Host $data
    $result += ($data + "`n")
    Start-Sleep -Seconds 1
}
docker-compose -f $composeFile down
Add-Content -Path "fastapi_v2/result/sync.txt" -Value $result