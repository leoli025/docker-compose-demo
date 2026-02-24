-- 初始化 PostgreSQL 脚本示例
-- 文件放在 init 目录下，容器首次启动时会自动执行

-- 创建 pgvector 扩展（如果使用 pgvector 镜像，可自动支持）
CREATE EXTENSION IF NOT EXISTS vector;

-- 创建示例表
CREATE TABLE IF NOT EXISTS test_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 插入示例数据
INSERT INTO test_table (name) VALUES ('PostgreSQL 初始化成功');
