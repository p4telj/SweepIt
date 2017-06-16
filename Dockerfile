###############################################################
######### SWEEPIT DOCKERFILE TESTING ENVIRONMENT V0.1 #########
# <pateljim@umich.edu> <shahhs@umich.edu> <kramesh@umich.edu> #
###############################################################

# BASE IMAGE: Alpine light-weight Linux OS
FROM alpine
MAINTAINER Jimil Patel <pateljim@umich.edu>
ENV version=0.1
# PACKAGE INSTALL: dependencies for python, postgresql
RUN apk update && apk upgrade && apk add \
	git \
	python3 \
	py3-pip \
	python3-dev \
	postgresql-dev \
	gcc \
	musl-dev
# VIRTUALENV: generate virtual environment for users current repository
### SweepIt dependencies installed
RUN pip3 install virtualenv && virtualenv sweepit-mod
COPY . /sweepit-mod
RUN source sweepit-mod/bin/activate && \
	pip3 install -r sweepit-mod/requirements.txt && \
	deactivate && virtualenv sweepit-updated
# VIRTUALENV: generate virtual environment for master branch updated repository
WORKDIR /sweepit-mod

# Future update
# GIT: pulls current repository when container started
### SweepIt dependencies installed
# 
# ENTRYPOINT ["cd", "sweepit-updated"]
# CMD ["git", "init"]
# CMD ["git", "add remote origin \
# 			 https://www.github.com/p4telj/SweepIt.git"]
# CMD ["git", "pull origin master"]
# CMD ["source", "sweepit-updated/bin/activate && \
# 		   pip3 install -r sweepit-mod/requirements.txt && \
# 		   deactivate"]
# CMD ["echo" "Welcome Back-- SweepIt Testing Environment V$version"]
# CMD ["echo", "SweepIt (c); \
# 			<pateljim@umich.edu> \
# 			<shahhs@umich.edu> \
# 			<kramesh@umich.edu>"]
# CMD ["cd", " "]