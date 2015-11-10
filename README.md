# Magento 2 Docker - Simple

This is a local Magento 2 docker build. Nothing fancy, does what it says on the tin.

I've not pushed it anyway, use at your own risk.
 
## Kudos and Respect

In order to produce this docker repo for Magento 2 I borrowed heavily from both Alan Kent and Mark Shust.

I wish I could say it was all my own work, I can't, these trialblazers were ahead of me. Many thanks to both and total kudos.

- [https://github.com/alankent/docker-magento2-demo-apache](http://)
- [http://mageinferno.com/blog/magento-2-development-docker-os-x](http://)

You might ask why I did my own version. Well I found Alan's to be a little out of date, but I liked the use of Apache as I'm used to that. I would have forked but it started to move quite a bit away from his.

Mark's was just a bit away from where I am. I wanted to keep it simple, not use dinghy as I don't have Homebrew, and just well shrink things down a bit.

# Manual Changes

If you want to change the release number then do so in `m2docker/files/scripts/install-magento2`, its currently at `2.0.0rc1` and will be updated on next major tag

# Execution

1. git clone this
2. In base directory do `docker-compose build`
3. Go have a cup of tea
4. When finished do `docker-compose up`
5. Connect to magento in browser via your docker ip address (you see this when you first load docker terminal window) 


# Useful Docker commands

`docker ps

docker images

docker exec -it <image_id> bash

docker stop`


# Notes

There is no sample data, I'm not a fan.

It's simple.

Not intended in anyway for Production use.


#TODOs

Maybe some compilation on frontend to speed it up

Mount the volumes so we can use as a local development environment


