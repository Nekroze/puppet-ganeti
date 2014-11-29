#### Table of Contents

1. [Overview](#overview)
2. [Description](#module-description)
3. [Setup](#setup)
    * [What ganeti affects](#what-ganeti-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ganeti](#beginning-with-ganeti)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Uses puppet to configure a one ore more Ganeti Hypervisors including a web interface!

## Module Description

This module can handle to configuration of KVM with some handy settings and then prepare Ganeti and its web interface to manage the hypervisor.

## Setup

### What ganeti affects

* A list of files, packages, services, or operations that the module will alter, impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form. 

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled, etc.), mention it here. 

### Beginning with ganeti

The very basic steps needed for a user to get the module up and running. 

If your most recent release breaks compatibility or requires particular steps for upgrading, you may wish to include an additional section here: Upgrading (For an example, see http://forge.puppetlabs.com/puppetlabs/firewall).

## Usage

Put the classes, types, and resources for customizing, configuring, and doing the fancy stuff with your module here. 

## Reference

Here, list the classes, types, providers, facts, etc contained in your module. This section should include all of the under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things. (We are working on automating this section!)

## Limitations

This module is primarily tested on CentOS 6/7.

Debian support should come in the future.

## Development

MIT license, Use how you want. Any contributions are appreciated and welcome.