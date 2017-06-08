<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>MyBiz Bootstrap Theme</title>
    <meta name="description" content="Free Bootstrap Theme by BootstrapMade.com">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Open+Sans|Raleway" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flexslider.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css">
  
</head>
<body id="top" data-spy="scroll">
	<!--top header-->

	<header id="home">

		<section class="main-header">

			<!-- Logo -->
			<a href="index2.html" class="logo">
			  <!-- mini logo for sidebar mini 50x50 pixels -->
			  <span class="logo-mini"><b>A</b>LT</span>
			  <!-- logo for regular state and mobile devices -->
			  <span class="logo-lg"><b>Admin</b>LTE</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
			  <!-- Sidebar toggle button-->
			  <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
				<span class="sr-only">Toggle navigation</span>
			  </a>
			  <!-- Navbar Right Menu -->
			  <div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
				  <!-- Messages: style can be found in dropdown.less-->
				  <li class="dropdown messages-menu">
					<!-- Menu toggle button -->
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					  <i class="fa fa-envelope-o"></i>
					  <span class="label label-success">4</span>
					</a>
					<ul class="dropdown-menu">
					  <li class="header">You have 4 messages</li>
					  <li>
						<!-- inner menu: contains the messages -->
						<ul class="menu">
						  <li><!-- start message -->
							<a href="#">
							  <div class="pull-left">
								<!-- User Image -->
								<img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
							  </div>
							  <!-- Message title and timestamp -->
							  <h4>
								Support Team
								<small><i class="fa fa-clock-o"></i> 5 mins</small>
							  </h4>
							  <!-- The message -->	
							  <p>Why not buy a new awesome theme?</p>
							</a>
						  </li>
						  <!-- end message -->
						</ul>
						<!-- /.menu -->
					  </li>
					  <li class="footer"><a href="#">See All Messages</a></li>
					</ul>
				  </li>
				  <li class="dropdown messages-menu">
					<!-- Menu toggle button -->
					<a href="/mypage" class="dropdown-toggle" data-toggle="dropdown">
					  <i class="fa fa-envelope-o"></i>
					  <span class="label label-success">4</span>
					</a>
					<ul class="dropdown-menu">
					  <li class="header">You have 4 messages</li>
					  <li>
						
						<!-- /.menu -->
					  </li>
					  <li class="footer"><a href="${pageContext.request.contextPath}/mypage">My page</a></li>
					</ul>
				  </li>
				  <!-- /.messages-menu -->

				  <!-- Notifications Menu -->
				  <li class="dropdown notifications-menu">
					<!-- Menu toggle button -->
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					  <i class="fa fa-bell-o"></i>
					  <span class="label label-warning">10</span>
					</a>
					<ul class="dropdown-menu">
					  <li class="header">You have 10 notifications</li>
					  <li>
						<!-- Inner Menu: contains the notifications -->
						<ul class="menu">
						  <li><!-- start notification -->
							<a href="#">
							  <i class="fa fa-users text-aqua"></i> 5 new members joined today
							</a>
						  </li>
						  <!-- end notification -->
						</ul>
					  </li>
					  <li class="footer"><a href="#">View all</a></li>
					</ul>
				  </li>
				  <!-- Tasks Menu -->
				  <li class="dropdown tasks-menu">
					<!-- Menu Toggle Button -->
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					  <i class="fa fa-flag-o"></i>
					  <span class="label label-danger">9</span>
					</a>
					<ul class="dropdown-menu">
					  <li class="header">You have 9 tasks</li>
					  <li>
						<!-- Inner menu: contains the tasks -->
						<ul class="menu">
						  <li><!-- Task item -->
							<a href="#">
							  <!-- Task title and progress text -->
							  <h3>
								Design some buttons
								<small class="pull-right">20%</small>
							  </h3>
							  <!-- The progress bar -->
							  <div class="progress xs">
								<!-- Change the css width attribute to simulate progress -->
								<div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
									 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
								  <span class="sr-only">20% Complete</span>
								</div>
							  </div>
							</a>
						  </li>
						  <!-- end task item -->
						</ul>
					  </li>
					  <li class="footer">
						<a href="#">View all tasks</a>
					  </li>
					</ul>
				  </li>
				  <!-- User Account Menu -->
				  <li class="dropdown user user-menu">
					<!-- Menu Toggle Button -->
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					  <span class="hidden-xs">login</span>
					</a>
					
					<ul class="dropdown-menu">
					  <!-- The user image in the menu -->
					  <form action="" method="post">
					  <li class="user-header">
						<div class="form-group">
			                <label for="id">ID:</label>
			                <input type="text" class="form-control" id="id">
			              </div>
			              <div class="form-group">
			                <label for="password">Password:</label>
			                <input type="password" class="form-control" id="password">
			              </div>
					  <!-- Menu Footer-->
					  <li class="user-footer">
						<div class="pull-left">
						  <input class="btn btn-default btn-flat" type="submit" name="login" value="login">
						 <!--  <a href="#" class="btn btn-default btn-flat">Profile</a> -->
						</div>
						<div class="pull-right">
						  <a href="#" class="btn btn-default btn-flat">Sign</a>
						</div>
					  </li>
					  </form>
					</ul>
					
				  </li>
				</ul>
			  </div>
			</nav>
		</section>

		<!--main-nav-->

		<div id="main-nav">

			<nav class="navbar">
				<div class="container">

					<div class="navbar-header">
						<a href="index.html" class="navbar-brand">MyBiz</a>
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#ftheme">
							<span class="sr-only">Toggle</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>

					<div class="navbar-collapse collapse" id="ftheme">

						<ul class="nav navbar-nav navbar-right">
							<li><a href="#home">home</a></li>
							<li><a href="#about">about</a></li>
							<li><a href="#service">services</a></li>
							<li><a href="#portfolio">portfolio</a></li>
							<li><a href="#contact">contact</a></li>
							<li class="hidden-sm hidden-xs">
	                            <a href="#" id="ss"><i class="fa fa-search" aria-hidden="true"></i></a>
	                        </li>
						</ul>

					</div>

					<div class="search-form">
	                    <form>
	                        <input type="text" id="s" size="40" placeholder="Search..." />
	                    </form>
	                </div>

				</div>
			</nav>
		</div>

	</header>

	<!--slider-->
	<div id="slider" class="flexslider">

        <ul class="slides">
            <li>
            	<img src="${pageContext.request.contextPath}/resources/images/slider/slider1.jpg">

				<div class="caption">
					<h2><span>an awesome website</span></h2> 
					<h2><span>html theme</span></h2>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
					<button class="btn">Read More</button>                 
	            </div>

            </li>
            <li>
            	<img src="${pageContext.request.contextPath}/resources/images/slider/slider2.jpg">

				<div class="caption">
					<h2><span>yet another slide</span></h2> 
					<h2><span>html theme</span></h2>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
					<button class="btn">Read More</button>                 
	            </div>

            </li>
            <li>
            	<img src="${pageContext.request.contextPath}/resources/images/slider/slider3.jpg">

				<div class="caption">
					<h2><span>one more slide</span></h2> 
					<h2><span>html theme</span></h2>
					<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
					<button class="btn">Read More</button>                 
	            </div>

            </li>
        </ul>

    </div>

    <!--about-->
    <div id="about">

    	<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<div class="about-heading">
						<h2>about</h2> 
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent metus magna,malesuada porta elementum vitae.</p>
					</div>
				</div>
			</div>   	
    	</div>

    	<!--about wrapper left-->
    	<div class="container">

    		<div class="row">
    			<div class="col-xs-12 hidden-sm col-md-5">

    				<div class="about-left">
    					<img src="${pageContext.request.contextPath}/resources/images/about/about1.jpg" alt="">
    				</div>

    			</div>

    			<!--about wrapper right-->
    			<div class="col-xs-12 col-md-7">
    				<div class="about-right">
    					<div class="about-right-heading">
    						<h1>about our consulting</h1>
    					</div>
  
    					<div class="about-right-boot">
    						<div class="about-right-wrapper">
	    						<a href="#"><h3>Boost Your Business</h3></a>
	    						<p>Michael Knight a young loner on a crusa champion the cause of the innocent. The helpless. powerless in a world of operate above the law.</p>
    						</div>
    					</div>

    					<div class="about-right-best">
    						<div class="about-right-wrapper">
	    						<a href="#"><h3>Best Business Statitics</h3></a>
	    						<p>Michael Knight a young loner on a crusa champion the cause of the innocent. The helpless. powerless in a world of operate above the law.</p>
    						</div>
    					</div>

    					<div class="about-right-support">
    						<div class="about-right-wrapper">
	    						<a href="#"><h3>24/7 Online Support</h3></a>
	    						<p>Michael Knight a young loner on a crusa champion the cause of the innocent. The helpless. powerless in a world of operate above the law.</p>
    						</div>
    					</div>

    				</div>
    			</div>
    		</div>

    	</div>
    </div>

	<!--about bg-->
		<div id="about-bg">

			<div class="container">
				<div class="row">

					<div class="about-bg-heading">
						<h1>sucessfull stats about us</h1>
						<p>what we have achieved so far</p>
					</div>

					<div class=" col-xs-12 col-md-3">
						<div class="about-bg-wrapper">
								<span class="count"><h1><span class="border">32</span>15</h1></span>
							<p>happy client</p>
						</div>
					</div>

					<div class="col-xs-12 col-md-3">
						<div class="about-bg-wrapper">
							<span class="count"><h1>2217</h1></span>
							<p>projects</p>
						</div>
					</div>

					<div class="col-xs-12 col-md-3">
						<div class="about-bg-wrapper">
							<span class="count"><h1>1522</h1></span>
							<p>branches</p>
						</div>
					</div>

					<div class="col-xs-12 col-md-3">
						<div class="about-bg-wrapper">
							<span class="count"><h1>3151</h1></span>
							<p>expert team</p>
						</div>
					</div>

				</div>
			</div>

			<div class="cover"></div>

		</div> 

		<!--service-->
		<div id="service">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-6 col-md-offset-3">
						<div class="service-heading">
							<h2>service</h2> 
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent metus magna,malesuada porta elementum vitae.</p>
						</div>
					</div>
				</div>   	
	    	</div>

			<!--services wrapper-->
    <section class="services-style-one">
    	<div class="outer-box clearfix">
    		
            <div class="services-column">
            	<div class="content-outer">
                	<div class="row clearfix">
                    	
                        <div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        	<div class="inner-box">
                            	<div class="icon-box"><i class="fa fa-briefcase" aria-hidden="true"></i></div>
                                <h4>FINANCIAL PLANNING</h4>
                                <div class="text">Leverage agile frameworks to provide a robust synopsis for high level overviews. </div>
                            </div>
                        </div>
                        
                        <div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        	<div class="inner-box">
                            	<div class="icon-box"><i class="fa fa-bar-chart" aria-hidden="true"></i></div>
                                <h4>BUSINESS PLANNING</h4>
                                <div class="text">Leverage agile frameworks to provide a robust synopsis for high level overviews. </div>
                            </div>
                        </div>
                        
                        <div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        	<div class="inner-box">
                            	<div class="icon-box"><i class="fa fa-trophy" aria-hidden="true"></i></div>
                                <h4>WORK &amp; REDUNDANCY</h4>
                                <div class="text">Leverage agile frameworks to provide a robust synopsis for high level overviews. </div>
                            </div>
                        </div>
                        
                        <div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        	<div class="inner-box">
                            	<div class="icon-box"><i class="fa fa-bullhorn" aria-hidden="true"></i></div>
                                <h4>MORTGAGE ADVISOR</h4>
                                <div class="text">Leverage agile frameworks to provide a robust synopsis for high level overviews. </div>
                            </div>
                        </div>
                        
                        <div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        	<div class="inner-box">
                            	<div class="icon-box"><i class="fa fa-lightbulb-o" aria-hidden="true"></i></div>
                                <h4>RETIREMENT PLANNING</h4>
                                <div class="text">Leverage agile frameworks to provide a robust synopsis for high level overviews. </div>
                            </div>
                        </div>
                        
                        <div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        	<div class="inner-box">
                            	<div class="icon-box"><i class="fa fa-money" aria-hidden="true"></i></div>
                                <h4>SAVING AND INVESTING</h4>
                                <div class="text">Leverage agile frameworks to provide a robust synopsis for high level overviews. </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Content Column-->
            <div class="content-column clearfix">
                <div class="content-box">
                	<div class="inner-box">
                        <!--Section Title-->
                        <div class="sec-title aligned-right">
                            <h2>Our Servi<span>ces</span></h2>
                        </div>
                        <div class="text">Lorem Ipsum is simply dummy text printing and typesetting industry. Lorem Ipsum has been industry's standard dummy text ever since 1500s, when an unknown printer specimen book. </div>
                        
                        <button class="btn">learn more</button>
                    </div>
                </div>
            </div>


        </div>
    </section>



			<!--service gapping-->
			<div class="service-footer hidden-xs">
				<div class="container">
					<div class="row">
						<div class="col-md-7">
							<div class="service-footer-left">
								<h3>Need to <span>Consult with us</span> ? Book an appointment</h3>
								<p>The Brady Bunch the Brady Bunch that's the way we all became the Brady Bunch</p>
							</div>
						</div>

						<div class="col-md-5">
							<div class="service-footer-right">
								<button class="btn">book now</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--portfolio-->
		<div id="portfolio">
			<div class="container">
				<div class="row">

					<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						<div class="portfolio-heading">
							<h2>portfolio</h2> 
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent metus magna,malesuada porta elementum vitae.</p>
						</div>
					</div>

				</div>   	
	    	</div>

	    	<div class="portfolio-thumbnail">
	    		<div class="container-fluid">
	    			<div class="row">

	    				<div class="col-xs-6 col-sm-3 col-md-3">
	    					<div class="item">
	    						<img src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio1.jpg" alt="">
	    						<div class="caption">
                               		<i class="fa fa-search" aria-hidden="true"></i>
                               		<p>lorem ipsum amet</p>
                            	</div>
	    					</div>
	    				</div>

	    				<div class="col-xs-6 col-sm-3 col-md-3">
	    					<div class="item">
	    						<img src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio2.jpg" alt="">
	    						<div class="caption">
                               		<i class="fa fa-search" aria-hidden="true"></i>
                               		<p>lorem ipsum amet</p>
                            	</div>
	    					</div>
	    				</div>

	    				<div class="col-xs-6 col-sm-3 col-md-3">
	    					<div class="item">
	    						<img src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio3.jpg" alt="">
	    						<div class="caption">
                               		<i class="fa fa-search" aria-hidden="true"></i>
                               		<p>lorem ipsum amet</p>
                            	</div>
	    					</div>
	    				</div>

	    				<div class="col-xs-6 col-sm-3 col-md-3">
	    					<div class="item">
	    						<img src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio4.jpg" alt="">
	    						<div class="caption">
                               		<i class="fa fa-search" aria-hidden="true"></i>
                               		<p>lorem ipsum amet</p>
                            	</div>
	    					</div>
	    				</div>

	    				<div class="col-xs-6 col-sm-3 col-md-3">
	    					<div class="item">
	    						<img src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio5.jpg" alt="">
	    						<div class="caption">
                               		<i class="fa fa-search" aria-hidden="true"></i>
                               		<p>what you see</p>
                            	</div>
	    					</div>
	    				</div>

	    				<div class="col-xs-6 col-sm-3 col-md-3">
	    					<div class="item">
	    						<img src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio6.jpg" alt="">
	    						<div class="caption">
                               		<i class="fa fa-search" aria-hidden="true"></i>
                               		<p>lorem ipsum amet</p>
                            	</div>
	    					</div>
	    				</div>

	    				<div class="col-xs-6 col-sm-3 col-md-3">
	    					<div class="item">
	    						<img src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio7.jpg" alt="">
	    						<div class="caption">
                               		<i class="fa fa-search" aria-hidden="true"></i>
                               		<p>lorem ipsum amet</p>
                            	</div>
	    					</div>
	    				</div>

	    				<div class="col-xs-6 col-sm-3 col-md-3">
	    					<div class="item">
	    						<img src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio8.jpg" alt="">
	    						<div class="caption">
                               		<i class="fa fa-search" aria-hidden="true"></i>
                               		<p>lorem ipsum amet</p>
                            	</div>
	    					</div>
	    				</div>

	    			</div>
	    		</div>
	    	</div>
		</div>

		<!--contact form-->
		<div id="get-touch">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						<div class="get-touch-heading">
							<h2>get in touch</h2> 
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent metus magna,malesuada porta elementum vitae.</p>
						</div>
					</div>
				</div>   

				<div class="content">
	                <div class="row">
                        <div id="sendmessage">Your message has been sent. Thank you!</div>
                        <div id="errormessage"></div>
                        
                         <form action="" method="post" role="form" class="form contactForm">
	                        <div class="col-md-4">
	                            <div class="form-group">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                    <div class="validation"></div>
                                </div>
	                        </div>
	                        <div class="col-md-4">
	                            <div class="form-group">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                                    <div class="validation"></div>
                                </div>
	                        </div>
	                        <div class="col-md-4">
	                            <div class="form-group">
                                    <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                                    <div class="validation"></div>
                                </div>
	                        </div>
	                        <div class="col-md-12">
	                            <div class="form-group">
                                    <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                                    <div class="validation"></div>
                                </div>
	                        </div>
	                        <div class="submit">
	                            <button class="btn btn-default" type="submit">Send Now</button>
	                        </div>
	                    </form>
	                </div>
            </div>	
	    	</div>
		</div>


		<!--contact-->
		<div id="contact">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						<div class="contact-heading">
							<h2>contact</h2> 
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent metus magna,malesuada porta elementum vitae.</p>
						</div>
					</div>
				</div>   	
	    	</div>

	    	<div id="google-map" data-latitude="40.713732" data-longitude="-74.0092704"></div>
            
		</div>


		<!--client-->
		<div id="client">
			<div class="container">
				<div class="row">

					<div class="col-sm-4 col-md-2">
						<span></span><img src="${pageContext.request.contextPath}/resources/images/client/client1.png" alt="">
					</div>

					<div class="col-sm-4 col-md-2">
						<span></span><img src="${pageContext.request.contextPath}/resources/images/client/client2.png" alt="">
					</div>

					<div class="col-sm-4 col-md-2">
						<span></span><img src="${pageContext.request.contextPath}/resources/images/client/client3.png" alt="">
					</div>

					<div class="col-sm-4 col-md-2">
						<span></span><img src="${pageContext.request.contextPath}/resources/images/client/client4.png" alt="">
					</div>

					<div class="col-sm-4 col-md-2">
						<span></span><img src="${pageContext.request.contextPath}/resources/images/client/client5.png" alt="">
					</div>

					<div class="col-sm-4 col-md-2">
						<span></span><img src="${pageContext.request.contextPath}/resources/images/client/client6.png" alt="">
					</div>

				</div>
			</div>
		</div>

		<!--footer-->
		<div id="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="footer-heading">
							<h3><span>about</span> us</h3>
							<p>To explore strange new worlds to seek out new life and new civilizations to boldly go where no man has gone before. It's time to play the music.</p>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
						</div>
					</div>

					<div class="col-md-4">
						<div class="footer-heading">
							<h3><span>latest</span> news</h3>
							<ul>
								<li><a href="#">Trends don't matter, but techniques do</a></li>
								<li><a href="#">Trends don't matter, but techniques do</a></li>
								<li><a href="#">Trends don't matter, but techniques do</a></li>
								<li><a href="#">Trends don't matter, but techniques do</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-4">
						<div class="footer-heading">
							<h3><span>follow</span> us on instagram</h3>
							<div class="insta">
								<ul>
									<img src="${pageContext.request.contextPath}/resources/images/footer/footer1.jpg" alt="">
									<img src="${pageContext.request.contextPath}/resources/images/footer/footer2.jpg" alt="">
									<img src="${pageContext.request.contextPath}/resources/images/footer/footer3.jpg" alt="">
									<img src="${pageContext.request.contextPath}/resources/images/footer/footer4.jpg" alt="">
									<img src="${pageContext.request.contextPath}/resources/images/footer/footer5.jpg" alt="">
									<img src="${pageContext.request.contextPath}/resources/images/footer/footer6.jpg" alt="">
								</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!--bottom footer-->
		<div id="bottom-footer" class="hidden-xs">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="footer-left">
							&copy; MyBix Theme. All rights reserved
                            <div class="credits">
                                <!-- 
                                    All the links in the footer should remain intact. 
                                    You can delete the links only if you purchased the pro version.
                                    Licensing information: https://bootstrapmade.com/license/
                                    Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyBiz
                                -->
                                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                            </div>
						</div>
					</div>

					<div class="col-md-8">
						<div class="footer-right">
                            <ul class="list-unstyled list-inline pull-right">
                                <li><a href="#home">Home</a></li>
                                <li><a href="#about">About</a></li>
                                <li><a href="#service">Service</a></li>
                                <li><a href="#portfolo">Portfolio</a></li>
                                <li><a href="#contact">Contact</a></li>
                            </ul>
						</div>
					</div>
				</div>
			</div>
		</div>
        

	
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.flexslider.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.inview.js"></script>
    <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
    
</body>
</html>