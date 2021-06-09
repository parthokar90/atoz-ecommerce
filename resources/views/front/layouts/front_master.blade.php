<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Css Styles -->
      <link rel="icon" type="image/png" href="{{asset('assets/common/images/logo.png')}}"/>
  <link rel="icon" type="image/png" href="{{asset('assets/common/images/logo.png')}}"/>
    @include('front.includes.css')
</head>
<body>
 
    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
                              <a href="{{url('/')}}"><img src="{{asset('assets/common/images/logo.png')}}" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <!--wishlist count start  -->
                            @if(Auth::check()) 
                              @php $wish=DB::table('wishlist')->where('user_id',auth()->user()->id)->count(); @endphp 
                                   <li><a href="{{url('wishlist')}}"><i class="fa fa-heart"></i> <span>{{$wish}}</span></a></li>
                              @else 
                                   <li><a href="{{url('wishlist')}}"><i class="fa fa-heart"></i> <span>0</span></a></li>
                             @endif 
                          <!--wishlist count end  -->
                           <!--cart count start  -->
                            @if(Auth::check())
                                @php 
                                $cart_count=DB::table('user_cart')
                                ->where('user_id',auth()->user()->id)
                                ->sum('quantity');
                                @endphp 
                            @else 
                                @php $cart_count=\Cart::getTotalQuantity(); @endphp
                            @endif
                            @if($cart_count>0)
                               <li><a href="{{url('cart')}}"><i class="fa fa-shopping-bag"></i> <span>{{ $cart_count}} </span></a></li>
                             @else 
                               <li><a href="{{url('cart')}}"><i class="fa fa-shopping-bag"></i> <span>0</span></a></li>
                            @endif 
                          <!--cart count end  -->
            </ul>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__auth">
               <!-- check user is login or not -->
                   @guest
                   <a href="{{ route('login') }}"><i class="fa fa-user"></i> Login</a>
                      @else 
                     <a href="{{url('profile')}}"><i class="fa fa-user"></i> {{auth()->user()->name}}</a>
                  @endguest 
               <!-- end check user is login or not -->
            </div>
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li><a href="{{url('/')}}">Home</a></li>
                <li><a href="{{url('/about')}}">About</a></li>
                <li><a href="{{url('/contact')}}">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a target="_blank" href="https://www.facebook.com/itebangladesh/"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i>info@itebd.com</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    @include('front.includes.header')    
    <!-- Header Section End -->

     	<!-- content part start -->	
          @yield('content')
      <!-- content part end -->

    <!-- Footer Section Begin -->
     @include('front.includes.footer')
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    @include('front.includes.js')
</body>
</html>