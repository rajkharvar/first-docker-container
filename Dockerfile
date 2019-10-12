# * base image of OS
FROM alpine:3.5

# * Install python and pip
RUN apk add --update py2-pip

# * Installing python modules needed for python app
COPY requirements.txt /usr/src/app/
# * --no-cache-dir stands for not storing any cache apart from main file
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# * Copy files required for running from local to container
COPY app.py /usr/src/app
COPY templates/index.html /usr/src/app/templates/

# * mentioning port number to expose by container
EXPOSE 5000

# * run the application
CMD ["python", "/usr/src/app/app.py"]