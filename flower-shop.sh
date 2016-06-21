#!/bin/bash

# Copyright 2016 IBM Corp. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the “License”);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an “AS IS” BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

MYIP=$(/sbin/ifconfig |grep 'inet addr'|grep -v 127.0.0.1|
    awk -F: '{print $2}'| awk '{print $1}');
PICTURE=$1

while true; do
    echo -e "LISTENING\r\n"
    echo -e `date`
    sudo nc -l -p 80 -w 1 <<EOF
HTTP/1.0 200 OK

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="refresh" content="5">
	<title>Flower Shop</title>
	<style type="text/css">
    html, #page { padding:0; margin:0;}
	body { margin:0; padding:0; width:100%; color:#959595; font:normal 12px/2.0em Sans-Serif;} 
	h1, h2, h3, h4, h5, h6 {color:darkgreen;}
	#page { background:#fff;}
	#header, #footer, #top-nav, #content, #content #contentbar, #content #sidebar { margin:0; padding:0;}

	
	#logo { padding:0; width:auto; float:left;}
	#logo h1 a, h1 a:hover { color:darkgreen; text-decoration:none;}
	#logo h1 span { color:#BCCE98;}

	
	#header { background:#fff; }
	#header-inner { margin:0 auto; padding:0; width:970px;}

	
	.feature { background:green;padding:18px;}
	.feature-inner { margin:auto;width:970px; }
	.feature-inner h1 {color:#DAE9BC;font-size:32px;}

	
	#top-nav { margin:0 auto; padding:0px 0 0; height:37px; float:right;}
	#top-nav ul { list-style:none; padding:0; height:37px; float:left;}
	#top-nav ul li { margin:0; padding:0 0 0 8px; float:left;}
	#top-nav ul li a { display:block; margin:0; padding:8px 20px; color:green; text-decoration:none;}
	#top-nav ul li.active a, #top-nav ul li a:hover { color:#BCCE98;}

	
	#content-inner { margin:0 auto; padding:10px 0; width:970px;background:#fff;}
	#content #contentbar { margin:0; padding:0; float:right; width:760px;}
	#content #contentbar .article { margin:0 0 24px; padding:0 20px 0 15px; }
	#content #sidebar { padding:0; float:left; width:200px;}
	#content #sidebar .widget { margin:0 0 12px; padding:8px 8px 8px 13px;line-height:1.4em;}
	#content #sidebar .widget h3 a { text-decoration:none;}
	#content #sidebar .widget ul { margin:0; padding:0; list-style:none; color:#959595;}
	#content #sidebar .widget ul li { margin:0;}
	#content #sidebar .widget ul li { padding:4px 0; width:185px;}
	#content #sidebar .widget ul li a { color:green; text-decoration:none; margin-left:-16px; padding:4px 8px 4px 16px;}
	#content #sidebar .widget ul li a:hover { color:#BCCE98; font-weight:bold; text-decoration:none;}

	
	#footerblurb { background:#DAE9BC;color:green;}
	#footerblurb-inner { margin:0 auto; width:922px; padding:24px;}
	#footerblurb .column { margin:0; text-align:justify; float:left;width:250px;padding:0 24px;}

	
	#footer { background:#fff;}
	#footer-inner { margin:auto; text-align:center; padding:12px; width:922px;}
	#footer a {color:green;text-decoration:none;}

	
	.clr { clear:both; padding:0; margin:0; width:100%; font-size:0px; line-height:0px;}
	</style>

</head>
<body>
	<div id="page">
	<header id="header">
	<div id="header-inner">	
	<div id="logo">
	<h1><a href=#>Flower Shop</a></h1>
	</div>
	<div id="top-nav">
	<ul>
	<li><a href=#>About</a></li>
	<li><a href=#>Contact</a></li>
	<li><a href=#">FAQ</a></li>
	<li><a href=#">Help</a></li>
	</ul>
	</div>
	<div class="clr"></div>
	</div>
	</header>
	<div class="feature">
	<div class="feature-inner">
	<h1>Your online flower shop <span style="color:#ffff00">@ [$MYIP]</span></h1>
	</div>
	</div>


	<div id="content">
	<div id="content-inner">

	<main id="contentbar">
	<div class="article">
	<p>Today's flower - purchase now and the shipment is free:</p>
	<p> <img src="$PICTURE" alt="Flower of the day" height="400" width="512"> 
	</p>
	</div>

	</main>

	<nav id="sidebar">
	<div class="widget">
	<h3>Order now:</h3>
	<ul>
	<li><a href=#>Roses</a></li>
	<li><a href=#>Orchid</a></li>
	<li><a href=#>Iris</a></li>
	<li><a href=#>Lily</a></li>
	<li><a href=#>Sunflower</a></li>
	</ul>
	</div>
	</nav>

	<div class="clr"></div>
	</div>
	</div>

	<div id="footerblurb">
	<div id="footerblurb-inner">

	<div class="column">
	<h2><span>House</span></h2>
	<p>Get flowers for your room, table and more!</p>
	</div>	
	<div class="column">
	<h2><span>Garden</span></h2>
	<p>Decorate your garden with flowers in any color!</p>
	</div>
	<div class="column">
	<h2><span>Birthdays</span></h2>
	<p>Send your family/friends a bouquet of flowers!</p>
	</div>	

	<div class="clr"></div>
	</div>
	</div>
	<footer id="footer">
	<div id="footer-inner">
	<p>&copy; Copyright <a href=#>Flower Shop</a> &#124; <a href=#>Terms of Use</a> &#124; <a href=#>Privacy Policy</a></p>
	<div class=clr></div>
	</div>
    <span style='font-size:20px'> This response is coming from [$MYIP] </span>
	</footer>
	</div>
	</body>
	</html>
EOF
    echo -e "DONE\r\n"
done
