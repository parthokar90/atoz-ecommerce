@extends('front.layouts.front_master')
@section('title') A to Z Online Shop | Contact @endsection 
@section('content')

  <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>Phone</h4>
                        <p>+8801313007709</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>Address</h4>
                        <p>ka-74/1 (3rd Floor),
                            Progoti Avenue, Kuril Chowrasta (Bishwaroad),
                            Dhaka-1229, Bangladesh</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>Open time</h4>
                        <p>10:00 am to 23:00 pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>info@atozonlineshop.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

        <!-- Map Begin -->
    <div class="map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d58400.76445395233!2d90.420924!3d23.8169!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xfa4436f59af0f952!2sInnovative%20Technology%20and%20Engineering!5e0!3m2!1sen!2sus!4v1610867296951!5m2!1sen!2sus"
            height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        <div class="map-inside">
            <i class="icon_pin"></i>
            <div class="inside-widget">
                <h4>Innovative Technology & Engineering</h4>
                <ul>
                    <li>Phone: +8801313007709</li>
                    <li>Add: ka-74/1 (3rd Floor),
                            Progoti Avenue, Kuril Chowrasta (Bishwaroad),
                            Dhaka-1229, Bangladesh</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Map End -->

@endsection
