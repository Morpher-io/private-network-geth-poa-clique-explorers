#!/bin/sh

bootnode -nodekey <(echo ${NODEKEYHEX:?NOT SET})
