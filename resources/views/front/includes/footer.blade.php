  <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="{{url('/')}}"><img width="94px" src="{{asset('assets/common/images/logo.png')}}" alt=""></a>
                        </div>
                        <ul>
                            <li><b>Address:</b> ka-74/1 (3rd Floor), Progoti Avenue, Kuril Chowrasta (Bishwaroad), Dhaka-1229, Bangladesh.</li>
                            <li><b>Phone:</b> +8801313007709</li>
                            <li><b>Email:</b> info@atozonlineshop.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-3 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="{{url('/')}}">Home</a></li>
                            <li><a href="{{url('/about')}}">About Us</a></li>
                            <li><a href="{{url('/contact')}}">Contact Us</a></li>
                            <li><a href="{{url('/privacy')}}">Privacy Policy</a></li>
                            <li><a href="{{url('/return-policy')}}">Return Policy</a></li>
                            <li><a href="{{url('/terms&conditions')}}">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-5 col-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form method="post" action="{{route('subscribe_mail')}}">
                        @csrf 
                            <input type="email" name="user_email" placeholder="Enter your Email" required>
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright <?php echo date('Y')?> © <a href="http://itebd.com" alt="ITE" target="_blank" class="text-decoration-none"> ITE  </a>All Rights Reserved.
                         <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                        <!-- <div class="footer__copyright__payment"><img src="{{asset('assets/front/img/payment-item.png')}}" alt=""></div> -->
                    </div>
                </div>
            </div>
        </div>
    </footer>

