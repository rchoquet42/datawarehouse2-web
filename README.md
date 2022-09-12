# Datawarehouse2 webapp


## General info
Web application for the book "Data Warehouse Systems:
Design and Implementation
Second Edition" (Alejandro A. Vaisman and Esteban Zimányi)

The main purpose of the webapp is to give access to the "Teaching materials" (slides, exercises, ...) of the book.
To access the resource the visitors must create an account and then submit a form that will be validated or not by the moderators/admins.

The Admin panel offer a friendly  way to manage the User and the requests.


## Technologies
Project is created with:

* Ruby version : ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [x86_64-linux]
* Rails version : Rails 7.0.3

## Setup

* Download the source and move the master.key inside de Rails directory
```
$ git@github.com:rchoquet42/datawarehouse2-web.git 
$ mv path/to/master.key datawarehouse2-web/config/master.key

```


* Create the "teaching material" folder wherever you want and populate it with the book resources.
* Please, names the files with their chapter number
```
$ mkdir  &&  && cd "$_"
$ mkdir slides figpdf figEpdf answers samples
$ mv /path/to/slides_of_chapter1.pdf slides/1.pdf
$ mv /path/to/slides_of_chapter2.pdf slides/2.pdf
$ mv /path/to/answers_of_chapter1.pdf answers/1.pdf
$ ...
```

* Change the value of variable "@teaching_material_location" in production.rb.
Following the example, change it to : "/srv/datawarehouse2/teaching_materials/"
```
$ vim datawarehouse2/config/environments/production.rb

```

* Create the Database
```
$ TODO PSQL 

```

* Run the migrations and the seeds
```
$ cd datawarehouse2 && rails db:setup 

```

* Run the Rails server
```
$ cd datawarehouse2 && puma
```



