# Getting started with the Flowgrammable development environment

1. Download and install [virtualbox](http://virtualbox.org)
2. Download and install [vagrant](http://vagrantup.com). Version 1.7.2 or later is required.
3. Clone dev-machine repo

 ```sh
 $ git clone https://github.com/flowgrammable/dev-machine.git
 ```
 or
 ```sh
 $ git clone git@github.com:flowgrammable/dev-machine.git
 ```
4. Run the commands below. The result will be three virtual machines running in virtualbox. 

 ```sh
 $ cd dev-machine
 $ vagrant up
 ```


### Virtual machine topology

```
enp0s3                 enp0s3                 enp0s3
 |                        |                      |
Source                   DUT                   Sink
     |___________________| |_____________________|
   enp0s8          enp0s8  enp0s9           enp0s8
192.168.20.1/24                          192.168.20.2/24
```

The development environment consists of three machines: source, dut, sink. 
The dut machine acts as a switch between the source and sink machine and will
run the noproto instance. The enp0s3 interface of each device is used for 
management. You can connect to each device with the following commands:

```
vagrant ssh source
vagrant ssh dut
vagrant ssh sink
```