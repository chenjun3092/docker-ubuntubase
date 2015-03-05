ubuntu trusty with confd and etcd dockerized

This is based on ubuntu:trusty with built-in confd and etcdctl as executable binaries
What is it?

Nothing more than the genuine ubuntu:trusty with binaries from the last stable releases of confd https://github.com/coreos/etcd/releases etcdctl https://github.com/kelseyhightower/confd/releases
Usage

include this as a base image when you intend to use confd or connect to an existing etcd service
