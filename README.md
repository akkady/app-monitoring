# PerfBoot Monitoring

![Logo](https://blog.octo.com/wp-content/uploads/2017/05/screenshot-from-2017-05-26-15-50-46-1024x130.png)

The TIG stack ( [Telegraf](https://docs.influxdata.com/telegraf/v1.22/) | [Influxdb](https://docs.influxdata.com/influxdb/v2.2/) | [Grafana](https://grafana.com/docs/grafana/latest/) ) is now being the most used tools in the  softwear monitoring world.

In this repository we tried to create a docker image that  combines all the stack requirements with configuration files that to make it shareable and easier 😜

## Geting Started

### Requirments

All what you need to run this image is to have ``` docker ``` and ``` docker-compose ``` installed in your local machine . 
you can also use ``` Docker descktop ``` which had them bout 

### Usage 

 - First clone this repository

 ```bash
 $ git clone https://github.com/akkady/perfboot-monitoring.git
 ```
- Navigate inside the folder and run this command 
```bash 
$ docker-compose up
```
> note that you can run the command in the background by adding ``` -d ```

### How it works

#### **Telegraf**

telegraf is a tool that collects data from many sources and sends it to a central server. It is a powerful tool for collecting and reporting metrics. in our case we are using it to collect data from multiple systems and send it to the ```influxdb``` server.

#### **Influxdb**
influxdb is a distributed time series database. It stores data in a time series database and makes it available over HTTP.

#### **Grafana**
Grafana is a web application for visualizing and analyzing metrics. It is a powerful tool for collecting and reporting metrics. we are using it to visualize all the metrics in a dashboards.

#### **Architecture**


- **Telegraf**

    ```
    ├── telegraf
        ├──telegraf.conf
    ```
the telegraf.conf file is the configuration file for telegraf that contains all the information about the telegraf server and the plugins that will be used to collect the data from the different systems and send it to the influxdb server.

example of what we can add in telegraf.conf file

```yml
    [[outputs.influxdb_v2]]
        urls = ["http://influxdb:${INFLUXDB_PORT}"]
        token = "$DOCKER_INFLUXDB_INIT_ADMIN_TOKEN"
        organization = "$DOCKER_INFLUXDB_INIT_ORG"
        bucket = "$DOCKER_INFLUXDB_INIT_BUCKET"
 ```
- **Grafana**

    ```
    ├── grafana
        ├──provisioning
            ├── dashboards
            ├──datasources
        ├── dashboards
            ├── hybris
            ├── jmeter
            ├── mssql
            ├── solr
        Dockerfile
        config.ini
    ```
Grafana ```provisionig``` is a folder that contains all the configuration files for the different dashboards and datasources. we created this folder to override the default configuration files that grafana provides.

you can lock at the docker file to see how it works

```dockerfile
ADD ./grafana/provisioning /etc/grafana/provisioning
```
this will copy the ```provisioning``` folder to the ```/etc/grafana/provisioning``` folder in the container.

```dashboards``` folder contains all the dashboards that we will use to visualize the metrics. 
the dashbord files are in ```json``` format.

We recomend you to gather all the dashboards you need in the ```dashboards``` folder and copy them to the ```/etc/grafana/dashboards``` folder in the container.

```dockerfile
ADD ./dashboards /var/lib/grafana/dashboards
```
this command will mount the ```dashboards``` folder to the ```/var/lib/grafana/dashboards``` folder in the container.

```datasources``` folder contains all the datasources that we will use to visualize the metrics.
```datasources``` folder contains all the datasources that we will use to visualize the metrics.






