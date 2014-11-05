---
layout: post
title: Using dd-wrt on a Linksys WAP54G
permalink: /2010/02/using-dd-wrt-on-linksys-wap54g.html
---
After I recently relocated my home office to a different room, the TiVo and
other Ethernet-hungry gear in our living room was no longer wired into our
router. Normally in such situations, I'd get out the fish tape and drill and
run some new Ethernet cable and take secret delight in using a punch-down tool
on Levitron jacks, but living in a condo with concrete floors and neighbors
upstairs, they'd probably get upset if I started boring through their floor
with a hammer drill. I put off worrying about the problem until tonight, when
our TiVo no longer knew what shows were on any channel anymore. I was afraid of
what it might start recording.

Fortunately, I remembered I had an old
  [Linksys WAP54G](http://www.linksysbycisco.com/US/en/products/WAP54G)
V2.0 that I formerly used my wireless access point when I ran my own OpenBSD
router. I dug it out of a box and fired it up. The WAP54G has four connection
modes: access point, wireless client, wireless repeater, and wireless bridge.
However, as is clearly noted several places in the web management tool and the
documentation, it can only work in the latter three modes if you pair it with
another WAP54G or a Linksys WRT54G. I'm now using a Linksys WRT54G2 as my home
router, so I was hopeful, but I'll spare you details of three evenings'
experimentation with bridging that; the short story is that I couldn't get the
AP to connect in any mode.

In desperation, I decided to try installing
[dd-wrt](http://dd-wrt.com/site/index), and open-source firmware. I wasn't too
worried about bricking the AP or voiding the warranty since it was useless to
me anyway in its current, incapable state. After a little digging around in
their [router database](http://dd-wrt.com/site/support/router-database) and
[wiki](http://dd-wrt.com/wiki/index.php/Linksys_WAP54G), I decided to try out
the `V24 VINT micro` firmware build (download
[here](http://dd-wrt.com/routerdb/de/download/Linksys/WAP54G/v2.0/dd-wrt.v24-13064_VINT_micro.bin/2175)).
It installed right away with no issues and booted right up.

Bingo! Now my formerly meager access point was a full-blown router. I set it up
in [Client mode](http://dd-wrt.com/wiki/index.php/Client_Mode) and enabled the
DHCP server and I was in business dishing out delicious packets to all my
data-starved home entertainment equipment. I tried to set up DHCP forwarding to
my main router, but I wasn't able to get it to work; No matter, I don't really
care what IP and subnet my TiVo is on.

So, another warranty voided and another success for open-source software. Give
dd-wrt a try and resurrect some of your old networking equipment.
