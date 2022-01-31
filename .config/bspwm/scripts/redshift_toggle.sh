#!/bin/bash

if [ -z $(pgrep redshift) ]; then redshift ; else pkill -USR1 redshift ; fi



