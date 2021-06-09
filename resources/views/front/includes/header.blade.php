  <header class="header">
        <div class="header__top">
            <div class="container">
              @if(session('subscribe_success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong> {{ session('subscribe_success') }}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                @endif
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> info@atozonlineshop.com</li>
                          
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </div>
                        
                            <div class="header__top__right__auth">
                                <!-- check user is login or not -->
                                 @guest
                                  <a href="{{ route('login') }}"><i class="fa fa-sign-in"></i> Login</a>
                                  @else 
                                  <a href="{{url('profile')}}"><i class="fa fa-user"></i> {{auth()->user()->name}}</a>
                                @endguest 
                                <!-- end check user is login or not -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="{{url('/')}}"><img width="94px" src="{{asset('assets/common/images/logo.png')}}" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                               <li><a href="{{url('/')}}">Home</a></li>
                               <li><a  href="{{url('/about')}}">About Us</a></li>
                               <li> <a href="{{url('/contact')}}">Contact Us</a></li>
                          
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
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
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>

 <script src="https://code.jquery.com/jquery-3.4.1.min.js"
                    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
 </script>
  <script>
    $(document).ready(function() {
        $(".alert").delay(3000).slideUp(300);
           });
  </script>