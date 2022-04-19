#!/bin/bash

nmcli radio wifi |grep disabled > /dev/null && nmcli radio wifi on || nmcli radio wifi off
