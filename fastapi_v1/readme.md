# use docker file to test the performance of fastapi v1
# get the result of requests/per sec and cpu usage/per request and memery usage/per request
## 步骤

1. 构建 Docker 镜像
   ```
   docker build -t fastapi-v1 .
   ```

2. 运行 Docker 容器
   ```
   docker run -d -p 8000:8000 --name fastapi-v1-container fastapi-v1
   ```

3. 使用性能测试工具（如 Apache Bench 或 wrk）进行测试
   例如，使用 wrk：
   ```
   wrk -t12 -c400 -d30s http://localhost:8000
   ```

4. 监控 CPU 和内存使用情况
   ```
   docker stats fastapi-v1-container
   ```

5. 分析结果
   - 请求/秒：查看 wrk 输出中的 "Requests/sec" 值
   - CPU 使用率/请求：从 docker stats 输出中计算
   - 内存使用/请求：从 docker stats 输出中计算

6. 清理
   ```
   docker stop fastapi-v1-container
   docker rm fastapi-v1-container
   ```

## 注意事项

- 确保在测试前系统处于稳定状态
- 多次运行测试以获得平均值
- 考虑不同的并发级别和请求类型进行测试
