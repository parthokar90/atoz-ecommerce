@extends('front.layouts.front_master')
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
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
   @if($cart_user_count>0)
     <!-- Checkout Section Begin -->
    <form id="check_out_form" role="form" action="{{route('checkout')}}" method="POST">
     @csrf
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <h4>Billing Details</h4>
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Fist Name<span>*</span></p>
                                        <input type="text" name="first_name"  autocomplete="off" value="{{$first_name}}" required>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <input type="text" name="last_name" autocomplete="off" value="{{$last_name}}" required>
                                    </div>
                                </div>
                            </div>

                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                @if(Auth::check()) 
                                <textarea cols="3" rows="3" name="address_one" autocomplete="off" class="form-control" required readonly>{{$address}}</textarea>
                                @else 
                                  <textarea cols="3" rows="3" name="address_one" autocomplete="off" class="form-control" required>{{$address}}</textarea>
                               @endif  
                            </div>

                              <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text" name="phone" autocomplete="off" value="{{$phone}}" required>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        @if(Auth::check()) 
                                        <input type="email" name="email"  autocomplete="off" readonly value="{{$email}}" required>
                                        @else 
                                          <input type="email" name="email"  autocomplete="off" value="{{$email}}" required>
                                        @endif 
                                    </div>
                                </div>
                            </div>

                            <div class="checkout__input">
                                <p>Country<span>*</span></p>
                                <input readonly name="country" autocomplete="off" value="Bangladesh" required>
                            </div>

                             <div class="checkout__input">
                               <p>Select District<span>*</span></p>

                            <select style="width:100%" class="nice-select" name="state" id="state" required>
                                      <option value="">Select District</option>
                                    @foreach($district as $dist)
                                          <option value="{{$dist->term_id}}">{{ $dist->district }}</option>
                                    @endforeach
                            </select>
                           </div>
                            <br><br>
                    
                            <div class="checkout__input">
                                <p>City<span>*</span></p>
                                <select style="width:100%" id="city" class="nice-select" name="city" required>
                                    <option value="">Select District First</option>
                                </select>
                            </div><br><br>


                            <div class="checkout__input">
                                <p>Postcode / ZIP<span>*</span></p>
                                <input id="zip" type="text" readonly name="zip" autocomplete="off" value="" required>
                            </div>
                          
                        </div>
                        <div class="col-lg-4 col-md-6" style="padding: 0px;">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                    <table style="padding: 0px;" class="table">
                                    <thead>
                                        <tr style="font-size: 12px;">
                                            <th>Item</th>
                                            <th>Price</th>
                                            <th>Qty</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      @php $total_qtyyy=0; @endphp
                                   @foreach ($info as $item)
                                    <tr style="font-size: 12px;">
                                          <th>
                                                {{$item->name}}<br>
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
                                            </th>
                                            <td>
                                               @if(Auth::check())
                                                 {{number_format($total=$item->actual_price)}} ৳
                                                @else 
                                                {{number_format($total=$item->price)}} ৳
                                                @endif
                                            </td>
                                            <td>
                                             {{$item->quantity}}
                                            </td>
                                            <td> 
                                              @if(Auth::check())
                                                  {{number_format($total=$item->actual_price*$item->quantity)}} ৳
                                                    @else 
                                                  {{number_format($total=$item->price*$item->quantity)}} ৳
                                              @endif
                                            </td>
                                        </tr>
                                         @endforeach
                                    </tbody>
                                    </table>


                                <div class="checkout__order__subtotal">Sub Total<span>{{$cart_user_count}} pcs ৳ {{number_format($total_order)}}</span></div>
                                <div class="checkout__order__subtotal">Discount:<span>(-) ৳ {{number_format($discount_amount)}}</span></div>
                                <div class="checkout__order__subtotal">Delivery Charge: <span id="delivery_charge">(+) </span></div>
                                <div class="checkout__order__subtotal">Order Total: <span id="total_order_discount"></span></div>
                                
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Cash On Delivery
                                        <input type="checkbox" name="paymentMethod" value="Cash On Delivery" id="payment" required>
                                        <span class="checkmark"></span>
                                    </label>
                                </div>

                                <!-- <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Delivery
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div> -->

                                <!-- <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div> -->
                                @if(isset($discount_code))  
                                   <input type="hidden" name="promo_code" value="{{$discount_code->session_code}}">
                                @endif
                                <input type="hidden" name="coupon_taka" value="{{$discount_amount}}">
                                <button id="order_submit" type="submit" class="site-btn">PLACE ORDER</button>
                            </div>
                        </div>
                    </div>
               </div>
          </div>
    </section>
    </form> 
      @else 
      <h4 class="text-center">Opp's You have no product in your shopping cart</h4>
      <div class="text-center"><a href="{{url('/')}}"><span style="color:orange;font-size:14px;">SHOP NOW</span></a>
    @endif 
    <!-- Checkout Section End -->


  <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  <script>
  $(document).ready(function() {


  $("#order_submit").click(function(){
      $("#payment").prop("checked", true);
  });

    var charge=0;  
    var nf = new Intl.NumberFormat();
    var tot_amount=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price')-$discount_amount; }else{echo Cart::getTotal()-$discount_amount; } ?>;  
    document.getElementById('total_order_discount').innerHTML='৳'+ (nf.format(tot_amount)); 
    document.getElementById('delivery_charge').innerHTML='(+)'+'৳'+ (nf.format(charge));
    //state dropdown change ajax call 
    $("#state").change(function() {
        var tot_amount=<?php if(Auth::check()){ echo $totak_price=DB::table('user_cart')->where('user_id',auth()->user()->id)->sum('price')-$discount_amount; }else{echo Cart::getTotal()-$discount_amount; } ?>;
        var district_id = $("#state").val();
         if(district_id==0){
           document.getElementById('delivery_charge').innerHTML='(+)'+'৳'+ (nf.format(charge));
           document.getElementById('total_order_discount').innerHTML='৳'+ (nf.format(tot_amount+charge));
           document.getElementById('zip').value = '';
         }
        $.ajax({
            url: "{{url('/district/city/')}}" + '/' + district_id,
            type: "GET",
            success: function(response) {
                var items = ""; 
                items += "<option value=''>Select City</option>";
                $.each(response.data, function(i, item) {
                    items += "<option value='" + item.term_id + "'>" + (item
                            .city_name) +
                        "</option>";
                        $("#city").addClass('nice-select open');
                });
                $("#city").html(items);
                $.each(response.charge,function(i, item) {
                    if(tot_amount>=response.amount){
                       var delivery_charge=0;
                    }else{
                       var delivery_charge=parseInt(item.description) || 0;
                    }
                    var nf = new Intl.NumberFormat();
                    nf.format(delivery_charge); 
                    document.getElementById('delivery_charge').innerHTML='(+)'+'৳'+ (nf.format(delivery_charge));
                    document.getElementById('total_order_discount').innerHTML='৳'+ (nf.format(tot_amount+delivery_charge));
                });
            },
            error: function(response) {
                console.log(response);
            },
            });
         });
      });
    </script>
    <!-- state dropdown ajax end -->



    <!-- zip ajax start -->
      <script>
    $("#city").change(function() {
    var city_id = $("#city").val();
    $.ajax({
        url: "{{url('/district/city/postcode/')}}" + '/' + city_id,
        type: "GET",
        success: function(response) {
            var items = "";
            $.each(response, function(i, item) {
                items += item.zip;
            });
            document.getElementById('zip').value = items;
        },
        error: function(response) {
            console.log(response);
        },
    });
   });
  </script>
    <!-- zip ajax end -->
@endsection