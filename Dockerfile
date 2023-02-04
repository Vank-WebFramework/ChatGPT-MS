FROM python:3.9.5-slim-buster

WORKDIR /root/service

ADD ./requirements.txt /root/service/

RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn
RUN pip install gunicorn gevent -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn
RUN pip install chatgptpy -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn

#CMD ["/bin/sh", "-c", "supervisord -c tool_for_deploy/supervisord.conf -n"]
CMD ["/bin/sh", "-c", "gunicorn -c gunicorn_config.py server:APP"]