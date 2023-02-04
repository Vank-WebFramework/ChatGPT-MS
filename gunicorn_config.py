"""
@File: gunicorn_config.py
"""
bind = '0.0.0.0:5000'

# 设置进程数以及最大请求处理数
workers = 3
max_requests = 3000
max_requests_jitter = 1000

# 设置日志级别
accesslog = '-'
loglevel = 'INFO'