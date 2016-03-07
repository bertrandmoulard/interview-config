works with https://github.com/rlerdorf/php7dev

requires vagrant and virtualbox

```
$ git clone https://github.com/rlerdorf/php7dev
$ cd php7dev
$ vagrant up #this will take a while and will prompt you at various steps
$ vagrant ssh
$ # on the vm
$ git clone https://github.etsycorp.com/internal-platforms/interview-config
$ cd interview-config
$ ./main.sh
```

Now you should be able to access the interview site (the cooking site) at http://192.168.7.7/cooking/recipes/
the code live in /var/www/cooking
