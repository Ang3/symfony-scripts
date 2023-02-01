Symfony scripts
===============

[![Latest Stable Version](https://poser.pugx.org/ang3/symfony-scripts/v/stable)](https://packagist.org/packages/ang3/symfony-scripts) [![Latest Unstable Version](https://poser.pugx.org/ang3/symfony-scripts/v/unstable)](https://packagist.org/packages/ang3/symfony-scripts) [![Total Downloads](https://poser.pugx.org/ang3/symfony-scripts/downloads)](https://packagist.org/packages/ang3/symfony-scripts)

This package provides useful scripts to start and stop your Symfony app.

Installation
============

This package should be installed globally.

Open a command console, enter your project directory and execute the
following command to download the latest stable version of this package:

```console
$ composer global require ang3/symfony-scripts --dev
```

Finally, do not forget to add the composer bin folder to your environment variable ```PATH```.

Usage
=====

Scripts
-------

At the root of your project, execute these following command as to your needs:

| Command       | Description                                                                                   |
|---------------|-----------------------------------------------------------------------------------------------|
| sf_start.sh   | Start the application (Docker, web server, etc.)                                              |
| sf_stop.sh    | Stop the application the application (Docker, web server, etc.)                               |
| sf_restart.sh | Executes `sf_stop.sh` then `sf_start.sh`                                                      |

### Reset the application

To reset application (deleting cache, logs and migrations files), you just have to pass the argument 
`reset` to the command `sf_restart.sh` like below:

```shell
sf_restart.sh reset
```