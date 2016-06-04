# Piper Dockerfile

This directory contains a Dockerfile for building
[Piper Push Cache](http://www.piperpushcache.com) in Docker. It also includes a
sample piper_cfg.json for configuring Piper along with a welcome page in the
pages directory. Pages, flows, and the configuration file are expected to be
modified and are simply a sample ready to be forked and changed.

### Installation

1. Install [Docker](https://www.docker.com/).

2. Clone or fork this repository.

3. Build.
```
docker build -t piper:1.1.1 --rm .
```

### Usage

```
docker run -d -p 7660:7660 piper
```

or with a mounted directory

```
docker run -d -p 7660:7660 -v your/dir/here:/piper piper
```

Go to a browser and open `http://<host>:7660` for the home page.
