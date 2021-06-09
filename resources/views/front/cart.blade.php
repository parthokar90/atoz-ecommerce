@extends('front.layouts.front_master')
@section('title') A To Z Online Shop | Cart @endsection 
@section('content')
     <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="{{asset('assets/front/img/breadcrumb.jpg')}}">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="{{url('/')}}">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    @if($cart_user_count>0)
    <!-- Shopping Cart Section Begin -->
    <form id="check_out_form" role="form" action="{{route('cart.update')}}" method="POST">
     @csrf
    <section class="shoping-cart spad">
        <div class="container">
           @if(session('status'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong> {{ session('status') }}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            @endif

            @if(session('status_error_update'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong> {{ session('status_error_update') }}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            @endif
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Item</th>
                                    <th>Price</th>
                                    <th>Qty</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                @php $total_qtyyy=0; @endphp
                                @foreach ($info as $item)
                                    @php 
                                      $image=DB::table('posts')
                                      ->where('ID',$item->id) 
                                      ->where('meta_key','attached_file') 
                                      ->join('postmeta','postmeta.post_id','=','posts.post_parent')
                                      ->select('meta_value')
                                      ->first();

                                       $d_image=DB::table('postmeta')
                                      ->where('post_id',$item->id) 
                                      ->where('meta_key','attached_file') 
                                      ->select('meta_value')
                                      ->first();
                                    @endphp

                                @if(isset($image)) 
                                   @php $img=$image->meta_value; @endphp
                                @endif

                                @if(isset($d_image)) 
                                   @php $img=$d_image->meta_value; @endphp
                                @endif

                                <input type="hidden" name="product_id[]" value="{{$item->id}}">
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img width="100px" height="100px" src="{{asset('backend/products/'.$img)}}" alt="">
                                        <h5>{{$item->name}}</h5><br>
                                        @php $att_name=DB::table('postmeta')
                                        ->where('post_id',$item->id)
                                        ->where('meta_key','attribute')
                                        ->select('meta_value')
                                        ->first();
                                        @endphp
                                        @if(isset($att_name)) 
                                        @php $j_decode=json_decode($att_name->meta_value);  @endphp
                                        @foreach($j_decode as $j_value) 
                                         {{$j_value->term}} 
                                        @endforeach 
                                        @endif
                                    </td>
                                    <td class="shoping__cart__price">
                                     @if(Auth::check())
                                       {{number_format($total=$item->actual_price)}} ৳
                                     @else 
                                      {{number_format($total=$item->price)}} ৳
                                     @endif
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <input type="number" inputmode="numeric" step="1" min="1" max="" name="quantity[]"  value="{{$item->quantity}}">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                    @if(Auth::check())
                                      {{number_format($total=$item->actual_price*$item->quantity)}} ৳
                                    @else 
                                      {{number_format($total=$item->price*$item->quantity)}} ৳
                                    @endif
                                    </td>
                                    <td class="shoping__cart__item__close">
                                          <a onclick="return confirm('are you sure??')"
                                               href="{{url('/remove/'.$item->id)}}"> <span class="icon_close"></span></a>
                                    </td>
                                </tr>
                               @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="{{url('/')}}" class="primary-btn">CONTINUE SHOPPING</a>
                        <button style="background: #D23457;color:#ffffff;border:0px solid #7FAD39;" type="submit" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Update Cart</button>
                    </div>
                </div>
                  </form>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                            <form action="{{url('discount/coupon')}}" method="post">
                             @csrf 
                                <input id="promo_code" name="code" type="text" class="form-control" autocomplete="off" placeholder="Enter your coupon code" required>
                                <button style="background: #D23457;color:#ffffff;border:0px solid #7FAD39;"  id="apply_promo_code" name="c_s" type="submit" class="site-btn">APPLY COUPON</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Subtotal <span>{{number_format($total_order)}} ৳</span> </li>
                            <li>Discount <span>(-) 
                             {{number_format($discount_amount)}} ৳</span> </li>
                            <li>Total <span>{{number_format($total_order-$discount_amount)}} ৳</span> </li>
                        </ul>
                        <a href="{{route('checkout_cart')}}" class="site-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
     @else 
      <h4 class="text-center">Opp's You have no product in your shopping cart</h4>
      <div class="text-center"><a href="{{url('/')}}"><span style="color:#D23457;font-size:14px;">SHOP NOW</span></a></div>
    @endif 
    <!-- Shopping Cart Section End -->
   <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
    <script>
         $(document).ready(function(){
          $(".alert").delay(2000).slideUp(300);
    });
    </script>
@endsection