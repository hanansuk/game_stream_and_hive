#!/bin/bash
# ---------------------- 
# Game simulator for Project 3
# Original Code Author: Shane Kramer
# Modified by: Hanan Sukenik

# hosts
host[0]="user101.comcast.com"
host[1]="niceguy@att.net"
host[2]="mossad.surveillance.gov"

# Password boundaries
MIN=10000000
MAX=12312021

# A function to generate a random loop number between 1 and X (10)
randomIterationFunction () {
    # Number of times to iterate (increase "10" if neccesary once tested)
    iterations=$((1 + $RANDOM %10))
}


# Buy a sword
# ====================================================================================================================================

i=0
randomIterationFunction

while [ $i -ne $iterations ]
do
    hostIndex=$(($RANDOM % 3))
    docker-compose exec mids ab -n 10 -H "Host: ${host[$hostIndex]}" http://localhost:5000/purchase_a_sword
    i=$(($i+1))
done

# Join a guild
# ====================================================================================================================================

i=0
randomIterationFunction

while [ $i -ne $iterations ]
do
    hostIndex=$(($RANDOM % 3))
    docker-compose exec mids ab -n 10 -H "Host: ${host[$hostIndex]}" http://localhost:5000/join_guild
    i=$(($i+1))
done