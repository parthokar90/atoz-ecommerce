@extends('front.layouts.front_master')
@section('title') A To Z Online Shop | Profile @endsection 
@section('content')
<style>
    @media (max-width: 767px) {
        .poductDiv div:nth-child(even){
            padding-right: 0px !important;
            padding-left: 5px !important;
        }
        .poductDiv > div:nth-child(odd){
            padding-right: 5px !important;     
        }
    }

</style>
<div class="container p-0">
    <div class="d-flex flex-row flex-wrap mt-4">
        <div class="col-md-3 col-12 mb-4 ">
            <h5>User Profile</h5>
            <div class="">
                @if(isset($profile_image->meta_value))
                <img width="100px" height="100px" src="{{asset('assets/front/user/'.$profile_image->meta_value)}}" class="img-fluid" alt="">
                @else
                <img width="100px" height="100px" src="{{asset('assets/front/user/user.png')}}" class="img-fluid" alt="">
                @endif</br>
                <div class="d-flex flex-column">
                  <ul style="padding: 0px;">
                      <li style="list-style: none;"> {{auth()->user()->name}} {{auth()->user()->last_name}}</li>
                      <li style="list-style: none;"> {{auth()->user()->email}}</li>
                  </ul>
                    <div><a style="text-decoration: none; color: #000000;" href="{{route('profile.edit',auth()->user()->id)}}"><i class="fa fa-pencil" aria-hidden="true"></i> Edit </a></div>
                    <div><a style="text-decoration: none; color: #000000;" href="{{route('password.edit',auth()->user()->id)}}"> <i class="fa fa-key"></i> Password Change </a></div>
                    <div><a style="text-decoration: none; color: #000000;" href="{{url('order-list')}}"> <i class="demo fa fa-sticky-note" aria-hidden="true"></i> Order List</a></div>
                    <div><a style="text-decoration: none; color: #000000;" href="{{url('customer-support')}}"> <i style="color:#000000" class="demo fa fa-users" aria-hidden="true"></i> Support</a></div>
                    <div><a style="text-decoration: none; color: #000000;" href="{{url('wishlist')}}"> <i style="color:#000000" class="demo fa fa-heart" aria-hidden="true"></i> Wishlist</a></div>
                    <!-- <div><a style="text-decoration: none; color: #000000;" href="{{url('faq')}}"> <i style="color:#000000" class="fa fa-question-circle"></i> Faq</a></div> -->
                  <div class="d-flex align-items-center ">
                    <a style="color: #000000;" href="{{ route('logout') }}" onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();"><i class="fa fa-sign-out"></i> {{ __('Logout') }}</a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form> 
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9 col-12 p-0 mb-3 ">
            <div class="text-center h5">Wishlist Item</div>
            <div class="d-flex flex-wrap poductDiv">
                @php $guid=''; $qty=0; $name=''; $image='no-image.png'; $price=''; @endphp
                @foreach($wishProduct as $item)
                @php
                $product=DB::table('posts')
                ->where('post_type','product')
                ->where('ID',$item->product_id)
                ->get();
                $product_meta=DB::table('postmeta')
                ->where('post_id',$item->product_id)
                ->get();
                @endphp
                @foreach($product as $products)
                  @php $name=$products->post_title; @endphp
                  @php $guid=$products->guid; @endphp
                @endforeach
                @foreach($product_meta as $meta)
                @if($meta->meta_key=='sale_price')
                @php
                $price=$meta->meta_value;
                @endphp
                @endif
                @if($meta->meta_key=='attached_file')
                @php
                $image=$meta->meta_value;
                @endphp
                @endif
                @endforeach
                <div class="col-md-4 col-6 ml-0 pl-0">
                    <div class="card">
                        <img src="{{asset('backend/products/'.$image)}}"  class="img-fluid rounded" >
                        <div class="text-center">
                            <div>{{$name}}</div>
                            <div>৳ {{ $price}}</div>
                        </div>
                          <a  href="{{url('product/'.$item->product_id.'/'.$guid)}}" class="site-btn btn-sm">View</a>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
         {{$wishProduct->links()}}
    </div>
</div>
@endsection