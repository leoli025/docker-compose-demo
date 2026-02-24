# PostgreSQL + pgvector 部署文档

## 1.部署容器

### 1.1 将当前 `pgsql` 目录拷贝上传至需要部署的服务器，并进入

```
cd pgsql
```

### 1.2 启动容器

```
docker-compose up -d
```

## 2.配置 PostgreSQL（可选操作）

### 2.1 自定义配置

```
将 PostgreSQL 的 "xxx.conf" 配置文件拷贝到启动容器后生成的 "conf" 目录下，重启容器即可完成配置。
```

### 2.2 初始化数据库

```
先将 PostgreSQL 的 "xxx.sql" 初始化文件拷贝到 "init" 目录下，再启动容器即可完成初始化（注意：对于同一个容器，初始化 sql 只会生效一次）。
```

### 2.3 启用 pgvector 插件

本镜像已内置 pgvector 插件，进入容器后执行以下命令即可启用：

```sql
-- 连接到数据库
\c my-db

-- 创建 pgvector 扩展
CREATE EXTENSION IF NOT EXISTS vector;
```

或通过命令行连接：

```bash
# 进入容器
docker exec -it postgres bash

# 连接到 PostgreSQL
psql -U postgres -d my-db

# 创建 pgvector 扩展
CREATE EXTENSION IF NOT EXISTS vector;
```

## 3. pgvector 使用示例

```sql
-- 创建带有向量列的表
CREATE TABLE documents (
    id SERIAL PRIMARY KEY,
    content TEXT,
    embedding vector(1536)
);

-- 插入向量数据
INSERT INTO documents (content, embedding) VALUES
    ('hello world', '[1,2,3]'),
    ('foo bar', '[4,5,6]');

-- 计算向量相似度
SELECT id, content, embedding <-> '[1,2,3]' AS distance
FROM documents
ORDER BY distance
LIMIT 5;
```

## 4. 端口说明

- `5432`: PostgreSQL 默认端口
